package io.testbed.rl;

import org.deeplearning4j.nn.api.OptimizationAlgorithm;
import org.deeplearning4j.nn.conf.ConvolutionMode;
import org.deeplearning4j.nn.conf.ComputationGraphConfiguration;
import org.deeplearning4j.nn.conf.NeuralNetConfiguration;
import org.deeplearning4j.nn.conf.inputs.InputType;
import org.deeplearning4j.nn.conf.layers.ConvolutionLayer;
import org.deeplearning4j.nn.conf.layers.DenseLayer;
import org.deeplearning4j.nn.conf.layers.GlobalPoolingLayer;
import org.deeplearning4j.nn.conf.layers.OutputLayer;
import org.deeplearning4j.nn.conf.layers.PoolingType;
import org.deeplearning4j.nn.graph.ComputationGraph;

import org.nd4j.linalg.activations.Activation;
import org.nd4j.linalg.api.ndarray.INDArray;
import org.nd4j.linalg.dataset.MultiDataSet;
import org.nd4j.linalg.factory.Nd4j;
import org.nd4j.linalg.learning.config.Adam;
import org.nd4j.linalg.lossfunctions.LossFunctions;

import java.io.*;
import java.util.*;

/**
 * FINAL — Lei & Liu (2024) CNN-based Double Dueling DQN
 * Inputs: K × Factive matrix of selected RPL metrics.
 *
 * FINAL FIXED FEATURE ORDER (matches simulation.js + node.c):
 *
 * 0  ETX  (pure per-link ETX)
 * 1  RSSI
 * 2  PFI  (windowed)
 * 3  RE
 * 4  QO
 * 5  MPIQ (windowed peak queue occupancy)
 * 6  QLR  (windowed)
 * 7  SI   (windowed)
 * 8  CC   (Child Count; was PC)
 * 9  HC
 * 10 STR  (real stretch: own rank - best rank via any neighbor)
 * 11 SR   (windowed rank churn)
 *
 * BDI/TV/WR were dropped: BDI ≡ 1-RE/E0 and TV ≡ 1-QLR are exact algebraic
 * duplicates of other features here; WR was structurally just PFI evaluated
 * at the current parent's index. See the feature audit for the full writeup.
 */
public class Agent implements Serializable {

	private static final Set<Integer> DBG_IDS = new HashSet<>(Arrays.asList(5)); // add more
	private static boolean shouldDbg(int moteId){ return DBG_IDS.contains(moteId); }
	private static PrintWriter logger;
	private static final long SEED = getAgentSeed();
	
	private static String getLogPath() {
		String p = System.getenv("AGENT_LOG_PATH");
		if (p != null && !p.trim().isEmpty()) return p.trim();
		return "/workspace/testbed/logs/agent.log"; // fallback
	}
	
	private static long getAgentSeed() {
		String s = System.getenv("AGENT_SEED");
		if (s != null && !s.trim().isEmpty()) {
			try { return Long.parseLong(s.trim()); } catch (Exception ignored) {}
		}
		return 1234L; // fallback
	}

	static {
		try {
			String path = getLogPath();
			File f = new File(path);
			File parent = f.getParentFile();
			if (parent != null) parent.mkdirs(); // ensure dirs exist

			logger = new PrintWriter(new FileWriter(path, true), true);
			logger.println("=== Agent started === logPath=" + path);
			logger.println("AGENT_SEED=" + SEED);
		} catch (Exception e) {
			e.printStackTrace();
			logger = new PrintWriter(System.err, true);
		}
	}

    private static void log(String msg) {
        logger.println(System.currentTimeMillis() + " " + msg);
        logger.flush();
    }

    // -------------------------------------------------------------------
    // FINAL 13 FEATURE INDICES
    // -------------------------------------------------------------------
    private static final int IDX_ETX = 0;
    private static final int IDX_RSSI = 1;
    private static final int IDX_PFI = 2;

    private static final int IDX_RE = 3;
    private static final int IDX_QO = 4;
    private static final int IDX_MPIQ = 5;
    private static final int IDX_QLR = 6;
    private static final int IDX_SI = 7;
    private static final int IDX_CC = 8;

    private static final int IDX_HC = 9;
    private static final int IDX_STR = 10;
    private static final int IDX_SR = 11;

    private static final int FTOTAL = 12;

    // -------------------------------------------------------------------
    public static class Counters {
        public int generated, delivered, dropped;
        public double residualEnergy;
        public int etx, hopCount, rankViolations;
    }

    private static class Episode {
        final double[] sFlat;
        final int a;
        final int parentId;
        final double hcSnap, reSnap, qoSnap;

        Episode(double[] s, int a, int pid, double hc, double re, double qo) {
            this.sFlat = s; this.a = a;
            this.parentId = pid;
            this.hcSnap = hc; this.reSnap = re; this.qoSnap = qo;
        }
    }

    private static class Transition {
        final double[] s;
        final int a;
        final double r;
        final double[] s2;
        final boolean done;
        final boolean[] valid2;

        Transition(double[] s, int a, double r, double[] s2, boolean done, boolean[] valid2) {
            this.s = s; this.a = a; this.r = r;
            this.s2 = s2; this.done = done; this.valid2 = valid2;
        }
    }

    // -------------------------------------------------------------------
    private final int k;
    private final boolean[] mask;
    private final int Factive;
    private final double initialEnergy;

    private final Map<Integer, Episode> open = new HashMap<>();

    private double epsilonStart = 0.30, epsilonEnd = 0.01;
    private int epsilonAnneal = 500;
    private double epsilon = epsilonStart;

    private double betaStart = 0.40, betaEnd = 1.00;
    private int betaAnneal = 500;
    private double perBeta = betaStart; // Eq. 22 IS-weight exponent; applied in trainOneBatch()

    private double gamma = 0.90;
    private int batchSize = 32;
    private int targetUpdate = 5;

    private int phase = 0;
    private long trainSteps = 0;
    private long policyEvalStates = 0;
    private long policyEvalChoiceStates = 0;
    private long policyEvalGreedyTop1 = 0;
    private long policyEvalInvalidPicks = 0;
    private double policyEvalGreedyRewardSum = 0.0;
    private double policyEvalBestRewardSum = 0.0;

    // PER
    private static final int CAP = 1000;
    private final Deque<Transition> replay = new ArrayDeque<>(CAP);
    private final Map<Transition,Double> pri = new IdentityHashMap<>();
    private double perAlpha = 0.6;

    // Lei & Liu (2024) Eq. 11, Table 1: w1 = w2 = 0.5
    private double w_qu = 0.5;
    private double w_ecr = 0.5;

    // QUEUEBUF_CONF_NUM is fixed at 8 across all PPM Makefiles (Q in Eq. 12)
    private static final double QUEUE_CAP = 8.0;

    private final Random rnd = new Random(SEED);

    private final ComputationGraph online;
    private final ComputationGraph target;

    private static final double HOP_NORM = 16.0;
    private static final double EPS = 1e-9;

    // -------------------------------------------------------------------
    public Agent(int k, boolean[] mask, double initialEnergy) {

        this.k = k;
        this.mask = Arrays.copyOf(mask, mask.length);
        this.initialEnergy = initialEnergy;

        int c = 0;
        for (boolean b : mask) if (b) c++;
        if (c == 0) throw new RuntimeException("Mask activates 0 features!");
        this.Factive = c;

        Nd4j.getRandom().setSeed(SEED);

        this.online = buildGraph(k);
        this.target = buildGraph(k);
        this.online.init();
        this.target.init();
        syncTarget();

        log("INIT Agent: K=" + k + " Factive=" + Factive);
		log("EPS sched: start=" + epsilonStart + " end=" + epsilonEnd + " anneal=" + epsilonAnneal);
    }

    // -------------------------------------------------------------------
    // CNN ARCHITECTURE (Lei & Liu 2024)
    // -------------------------------------------------------------------
    private ComputationGraph buildGraph(int outK) {
        ComputationGraphConfiguration conf =
            new NeuralNetConfiguration.Builder()
                .seed(SEED)
                .optimizationAlgo(OptimizationAlgorithm.STOCHASTIC_GRADIENT_DESCENT)
                // Learning rate 0.01 (Lei & Liu 2024, Table 1)
                .updater(new Adam(1e-2))
                .convolutionMode(ConvolutionMode.Same)
                .graphBuilder()
                .addInputs("input")
                .setInputTypes(InputType.convolutional(k, Factive, 1))
                .addLayer("conv1", new ConvolutionLayer.Builder(3,3)
                        .stride(1,1).nOut(16)
                        .activation(Activation.RELU).build(), "input")
                .addLayer("conv2", new ConvolutionLayer.Builder(3,1)
                        .stride(1,1).nOut(32)
                        .activation(Activation.RELU).build(), "conv1")
                .addLayer("pool", new GlobalPoolingLayer.Builder(PoolingType.AVG)
                        .build(), "conv2")
                .addLayer("dense", new DenseLayer.Builder()
                        .nOut(128).activation(Activation.RELU)
                        .build(), "pool")
                .addLayer("advFC", new DenseLayer.Builder()
                        .nOut(64).activation(Activation.RELU)
                        .build(), "dense")
                .addLayer("valFC", new DenseLayer.Builder()
                        .nOut(64).activation(Activation.RELU)
                        .build(), "dense")
                .addLayer("advOut", new OutputLayer.Builder(LossFunctions.LossFunction.MSE)
                        .nOut(outK).activation(Activation.IDENTITY)
                        .build(), "advFC")
                .addLayer("valOut", new OutputLayer.Builder(LossFunctions.LossFunction.MSE)
                        .nOut(1).activation(Activation.IDENTITY)
                        .build(), "valFC")
                .setOutputs("advOut","valOut")
                .build();

        return new ComputationGraph(conf);
    }

    private void syncTarget() { target.setParams(online.params().dup()); }

    // -------------------------------------------------------------------
    // DECISION STEP
    // -------------------------------------------------------------------
    public synchronized int decide(
            int moteId,
            double[][] S,
            boolean[] valid,
            Counters ctrs,
            int[] candIds,
            double[] hcArr,
            double[] reArr,
            double[] qoArr)
    {
        double[] flat = flatten(S);

        // Close previous episode for this mote
        Episode prev = open.remove(moteId);
        if (prev != null) {
            double r = computeReward(prev, candIds, hcArr, reArr, qoArr);
            addReplay(new Transition(prev.sFlat, prev.a, r, flat, false, copyValid(valid)));
        }

        double[] q = qValues(online, flat);
        // Eq. 28: epsilon-greedy over all k actions, including invalid slots
        int greedy = argmax(q);
        trackPolicyEvidence(valid, candIds, hcArr, reArr, qoArr, greedy);
        int action = (rnd.nextDouble() < epsilon)
                ? rnd.nextInt(k)
                : greedy;

		// DEBUG line:
		logDecisionDebug(moteId, S, valid, candIds, hcArr, reArr, qoArr, q, action);

        int pid = 0;
        double hc = 0, re = 0, qo = 0;

        if (action >= 0 && action < candIds.length) {
            pid = candIds[action];
            hc = safe(hcArr, action);
            re = safe(reArr, action);
            qo = safe(qoArr, action);
        }

        open.put(moteId, new Episode(flat, action, pid, hc, re, qo));
        return action;
    }

    // -------------------------------------------------------------------
    // END PHASE
    //
    // NOTE: this must NOT close/clear `open`. Episodes are closed by
    // decide()'s own prev-episode branch, using that mote's fresh
    // candIds/hcArr/reArr/qlrArr for the *current* phase — i.e. the
    // actual outcome of the previous decision, not a decision-time
    // snapshot. Call assignParentsAll() (which drives decide()) before
    // endPhase() each phase so those transitions land in the replay
    // buffer before we train on it.
    // -------------------------------------------------------------------
    public synchronized void endPhase() {

        if (!replay.isEmpty()) trainOneBatch();

        logPolicyEvidenceSummary();
        resetPolicyEvidence();

        phase++;

        epsilon = epsilonStart + (epsilonEnd - epsilonStart)
                * Math.min(1.0, (double) phase / epsilonAnneal);

        perBeta = betaStart + (betaEnd - betaStart)
                * Math.min(1.0, (double) phase / betaAnneal);
    }

    // -------------------------------------------------------------------
    // TRAINING STEP (PER sampling, no IS weighting yet)
    // -------------------------------------------------------------------
    private void trainOneBatch() {

        int D = replay.size();
        int bs = Math.min(batchSize, D);
        if (bs <= 0) return;

        Transition[] pool = replay.toArray(new Transition[0]);

        double[] p = new double[D];
        double c = 0;
        for (int i = 0; i < D; i++) {
            double w = pri.getOrDefault(pool[i], 1.0);
            w = Math.pow(w, perAlpha);
            p[i] = w;
            c += w;
        }

        double[] pref = new double[D];
        double acc = 0;
        for (int i=0;i<D;i++){ acc += p[i]; pref[i] = acc; }

        int[] idx = new int[bs];
        for (int i=0;i<bs;i++) {
            double u = ((i + rnd.nextDouble()) / bs) * acc;
            idx[i] = lowerBound(pref, u);
        }

        // Eq. 22: PER importance-sampling weights, normalized by the batch max
        double[] isW = new double[bs];
        double maxIsW = 0.0;
        for (int i = 0; i < bs; i++) {
            double Pj = (c > 0) ? (p[idx[i]] / c) : (1.0 / D);
            double w = Math.pow(D * Pj, -perBeta);
            isW[i] = w;
            if (w > maxIsW) maxIsW = w;
        }
        for (int i = 0; i < bs; i++) isW[i] = (maxIsW > 0) ? (isW[i] / maxIsW) : 1.0;

        INDArray X    = Nd4j.create(bs, 1, k, Factive);
        INDArray Yadv = Nd4j.create(bs, k);
        INDArray Yval = Nd4j.create(bs, 1);

        Transition[] batch = new Transition[bs];
        double[] newP = new double[bs];

        for (int i=0;i<bs;i++) {

            Transition t = pool[idx[i]];
            batch[i] = t;

            putConv(X, i, t.s);

            INDArray[] out = online.output(false, conv(t.s));
            double[] A = out[0].toDoubleVector();
            double V  = out[1].getDouble(0);

            double meanA = mean(A);

            double targetQ;
            if (t.done) {
                targetQ = t.r;
            } else {
                double[] Qn = qValues(online, t.s2);
                // Eq. 18: argmax over all k actions
                int aStar = argmax(Qn);

                INDArray[] outT = target.output(false, conv(t.s2));
                double[] At = outT[0].toDoubleVector();
                double Vt = outT[1].getDouble(0);
                double meanAt = mean(At);

                double Qnext = Vt + (At[aStar] - meanAt);
                targetQ = t.r + gamma * Qnext;
            }

            int a = t.a;
            double Qcurr = V + (A[a] - meanA);
            double td = targetQ - Qcurr;

            newP[i] = Math.abs(td) + 1e-3;

            // Apply IS weight w to the TD update: label = pred + w * (target - pred)
            double w = isW[i];

            double[] A_lbl = Arrays.copyOf(A, k);
            double fullTargetA = targetQ - V + meanA;
            A_lbl[a] = A[a] + w * (fullTargetA - A[a]);
            Yadv.getRow(i).assign(Nd4j.create(A_lbl));

            double fullTargetV = targetQ - (A[a] - meanA);
            double V_lbl = V + w * (fullTargetV - V);
            Yval.putScalar(i, 0, V_lbl);
        }

        MultiDataSet mds = new MultiDataSet(
                new INDArray[]{X}, new INDArray[]{Yadv, Yval});
        online.fit(mds);

        trainSteps++;
        if (trainSteps % targetUpdate == 0) syncTarget();

        for (int i = 0; i < bs; i++)
            pri.put(batch[i], newP[i]);
    }

    // -------------------------------------------------------------------
    private double[] qValues(ComputationGraph net, double[] flat) {
        INDArray x = conv(flat);
        INDArray[] out = net.output(false, x);

        double[] A = out[0].toDoubleVector();
        double V   = out[1].getDouble(0);
        double m   = mean(A);

        double[] Q = new double[k];
        for (int i=0;i<k;i++) Q[i] = V + (A[i] - m);

        return Q;
    }

    // -------------------------------------------------------------------
    // STATE FLATTENING WITH FIXED SCALING (K rows, zero-padded)
    // -------------------------------------------------------------------
    private double[] flatten(double[][] S) {

        double[] out = new double[k * Factive];
        int p = 0;

        for (int i = 0; i < k; i++) {

            double[] row = (S != null && i < S.length) ? S[i] : null;
            int pos = 0;

            for (int f = 0; f < FTOTAL; f++) {
                if (mask[f]) {
                    double v = (row != null && pos < row.length) ? row[pos++] : 0.0;
                    out[p++] = scale(f, v);
                }
            }
        }
        return out;
    }

    // -------------------------------------------------------------------
    private INDArray conv(double[] flat) {
        INDArray x = Nd4j.create(1,1,k,Factive);
        int idx=0;
        for (int i=0;i<k;i++)
            for (int j=0;j<Factive;j++)
                x.putScalar(0,0,i,j, flat[idx++]);
        return x;
    }

    private void putConv(INDArray X, int row, double[] flat) {
        int idx=0;
        for (int i=0;i<k;i++)
            for (int j=0;j<Factive;j++)
                X.putScalar(row,0,i,j, flat[idx++]);
    }

    // -------------------------------------------------------------------
    private void addReplay(Transition t) {
        if (replay.size() >= CAP) {
            Transition old = replay.pollFirst();
            pri.remove(old);
        }
        replay.addLast(t);

        double mx = pri.values().stream()
                .mapToDouble(v -> v)
                .max().orElse(1.0);

        pri.put(t, mx + 1e-3);
    }

    // -------------------------------------------------------------------
    private void trackPolicyEvidence(
            boolean[] valid,
            int[] candIds,
            double[] hcArr,
            double[] reArr,
            double[] qoArr,
            int greedy)
    {
        int candidates = (candIds == null) ? 0 : candIds.length;
        if (candidates <= 0) return;

        policyEvalStates++;

        int upper = Math.min(k, candidates);

        // Count greedy picks of invalid slots
        if (greedy < 0 || greedy >= upper) policyEvalInvalidPicks++;

        int validCount = 0;
        int best = -1;
        double bestReward = Double.NEGATIVE_INFINITY;

        for (int i = 0; i < upper; i++) {
            boolean ok = (valid == null) || (i < valid.length && valid[i]);
            if (!ok) continue;

            validCount++;
            double rewardNow = reward(safe(hcArr, i), safe(reArr, i), safe(qoArr, i));
            if (rewardNow > bestReward) {
                bestReward = rewardNow;
                best = i;
            }
        }

        if (validCount < 2 || greedy < 0 || greedy >= upper || best < 0) return;

        double greedyReward = reward(safe(hcArr, greedy), safe(reArr, greedy), safe(qoArr, greedy));

        policyEvalChoiceStates++;
        policyEvalGreedyRewardSum += greedyReward;
        policyEvalBestRewardSum += bestReward;
        if (greedy == best) policyEvalGreedyTop1++;
    }

    private void logPolicyEvidenceSummary() {
        StringBuilder sb = new StringBuilder();
        sb.append("POLICY_EVAL phase=").append(phase)
          .append(" states=").append(policyEvalStates)
          .append(" choiceStates=").append(policyEvalChoiceStates)
          .append(" invalidPicks=").append(policyEvalInvalidPicks)
          .append(" invalidPickRate=").append(policyEvalStates > 0
                  ? String.format("%.3f", (double) policyEvalInvalidPicks / policyEvalStates)
                  : "0.000");

        if (policyEvalChoiceStates > 0) {
            double meanGreedy = policyEvalGreedyRewardSum / policyEvalChoiceStates;
            double meanBest = policyEvalBestRewardSum / policyEvalChoiceStates;
            double meanRegret = (policyEvalBestRewardSum - policyEvalGreedyRewardSum) / policyEvalChoiceStates;
            double top1 = (double) policyEvalGreedyTop1 / policyEvalChoiceStates;
            double rewardRatio = (meanBest > 0.0) ? (meanGreedy / meanBest) : 0.0;

            sb.append(" greedyTop1=").append(String.format("%.3f", top1))
              .append(" meanGreedyReward=").append(String.format("%.4f", meanGreedy))
              .append(" meanBestReward=").append(String.format("%.4f", meanBest))
              .append(" meanRegret=").append(String.format("%.4f", meanRegret))
              .append(" rewardRatio=").append(String.format("%.3f", rewardRatio));
        }

        log(sb.toString());
    }

    private void resetPolicyEvidence() {
        policyEvalStates = 0;
        policyEvalChoiceStates = 0;
        policyEvalGreedyTop1 = 0;
        policyEvalInvalidPicks = 0;
        policyEvalGreedyRewardSum = 0.0;
        policyEvalBestRewardSum = 0.0;
    }

    // -------------------------------------------------------------------
	
	// -------------------------------------------------------------------
	// DEBUG: log what the agent sees and does
	// -------------------------------------------------------------------
	private void logDecisionDebug(
			int moteId,
			double[][] S,
			boolean[] valid,
			int[] candIds,
			double[] hcArr,
			double[] reArr,
			double[] qoArr,
			double[] qValues,
			int action)
	{
		// Only log a subset to avoid GB-sized logs
		// if (moteId > 5) return;          // only first few motes
		// if (phase > 20) return;          // only early phases
		// if (rnd.nextDouble() > 0.05) return;  // 5% sampling

		if(!shouldDbg(moteId)) return;

		StringBuilder sb = new StringBuilder();
		sb.append("DECISION ");
		sb.append("phase=").append(phase)
		  .append(" mote=").append(moteId)
		  .append(" eps=").append(String.format("%.3f", epsilon))
		  .append(" cand=");

		sb.append(Arrays.toString(candIds));
		sb.append(" valid=").append(Arrays.toString(valid)).append("\n");

		// Features per candidate row
		for (int i = 0; i < candIds.length; i++) {
			sb.append("  cand[").append(i).append("] id=").append(candIds[i]);

			if (S != null && i < S.length) {
				sb.append(" features=").append(Arrays.toString(S[i]));
			} else {
				sb.append(" features=[]");
			}

			double hc = (hcArr != null && i < hcArr.length) ? hcArr[i] : 0.0;
			double re = (reArr != null && i < reArr.length) ? reArr[i] : 0.0;
			double qo = (qoArr != null && i < qoArr.length) ? qoArr[i] : 0.0;

			sb.append(" hc=").append(String.format("%.2f", hc))
			  .append(" re=").append(String.format("%.1f", re))
			  .append(" qo=").append(String.format("%.3f", qo));

			sb.append("\n");
		}

		sb.append("  qValues=").append(Arrays.toString(qValues))
		  .append("  action=").append(action);

		if (action >= 0 && action < candIds.length) {
			sb.append("  chosenParent=").append(candIds[action]);
		}

		log(sb.toString());
	}
    
	// Lei & Liu (2024) Eq. 10-13: rank(a) = HC(a) + w1*QU(a) + w2*ECR(a),
	// reward = 1/rank(a). HC is raw/unnormalized (Eq. 11); QU = q/Q (Eq. 12);
	// ECR = 1 - RE/E0 (Eq. 13). qo is the raw queue-buffer count (0..QUEUE_CAP).
	// EPS is a numerical-stability floor not present in the paper (rank(a)
	// can be exactly 0 for a node directly under the root with full energy
	// and an empty queue), kept minimal so it doesn't distort real values.
	private double reward(double hc, double re, double qo) {

        double ecr = 1.0 - Math.max(0.0, Math.min(1.0, re / initialEnergy));
        double qu = Math.max(0.0, Math.min(1.0, qo / QUEUE_CAP));

        double rank = hc + w_qu*qu + w_ecr*ecr;
        return 1.0 / (rank + EPS);
    }

    private double computeReward(Episode ep,
                                 int[] candIds,
                                 double[] hcArr, double[] reArr, double[] qoArr)
    {
        // Eq. 10: reward -1 for an invalid slot (parentId stays 0)
        if (ep.parentId == 0) return -1.0;

        int idx = -1;
        for (int i=0;i<candIds.length;i++)
            if (candIds[i] == ep.parentId) idx = i;

        double hc = (idx>=0) ? safe(hcArr,idx) : ep.hcSnap;
        double re = (idx>=0) ? safe(reArr,idx) : ep.reSnap;
        double qo = (idx>=0) ? safe(qoArr,idx) : ep.qoSnap;

        return reward(hc,re,qo);
    }

    // -------------------------------------------------------------------
    // FINAL CORRECT SCALING
    // -------------------------------------------------------------------
    private double scale(int f, double v) {

        if (!Double.isFinite(v)) return 0.0;

        switch(f){

            // ---------------- LINK ----------------
            case IDX_ETX:  return Math.min(Math.max(v,0.0),10.0) / 10.0;
            case IDX_RSSI: return Math.min(Math.max(v,0.0),10.0) / 10.0;

            // PFI (windowed) in [0,1]
            case IDX_PFI:  return Math.max(0.0, Math.min(1.0, v));

            // ---------------- NODE ----------------
            case IDX_RE:   return Math.max(0.0, Math.min(1.0, v / initialEnergy));

            // QO and MPIQ share the same bound (QUEUEBUF=8)
            case IDX_QO:   return Math.max(0.0, Math.min(1.0, v / QUEUE_CAP));
            case IDX_MPIQ: return Math.max(0.0, Math.min(1.0, v / QUEUE_CAP));

            // QLR, SI (both windowed) already ∈ [0,1]
            case IDX_QLR:  return Math.max(0.0, Math.min(1.0, v));
            case IDX_SI:   return Math.max(0.0, Math.min(1.0, v));

            // CC (Child Count, was PC): safety-limit to [0,10]
            case IDX_CC:   return Math.min(Math.max(v,0.0),10.0) / 10.0;

            // ---------------- NETWORK ----------------
            case IDX_HC:   return Math.max(0.0, Math.min(1.0, v / HOP_NORM));

            // STR (real stretch: own rank - best rank via any neighbor) and
            // SR (windowed rank churn) are both rank-derived and typically
            // much smaller in magnitude than the old raw-rank STR was, so
            // this divisor is a reasoned estimate pending real run data --
            // revisit once we have actual STR/SR distributions to calibrate against.
            case IDX_STR:  return Math.log1p(Math.max(0.0, v)) / 8.0;
            case IDX_SR:   return Math.log1p(Math.max(0.0, v)) / 8.0;
        }

        return 0.0;
    }

    // -------------------------------------------------------------------
    private static double safe(double[] arr, int i){
        return (arr!=null && i>=0 && i<arr.length && Double.isFinite(arr[i]))
                ? arr[i] : 0.0;
    }

    private static boolean[] copyValid(boolean[] v){
        return v==null?null:Arrays.copyOf(v,v.length);
    }

    // Argmax over all k actions (Eq. 18, Eq. 28)
    private static int argmax(double[] q){
        int b = 0;
        double bv = q[0];
        for (int i = 1; i < q.length; i++) {
            if (q[i] > bv) { bv = q[i]; b = i; }
        }
        return b;
    }

    private static int lowerBound(double[] a, double x){
        int lo=0, hi=a.length-1;
        while (lo<hi) {
            int m=(lo+hi)>>>1;
            if (a[m]>=x) hi=m; else lo=m+1;
        }
        return lo;
    }

    private static double mean(double[] a){
        double s=0; int n=0;
        for (double v:a) if (Double.isFinite(v)){ s+=v; n++; }
        return n>0? (s/n):0.0;
    }

    // -------------------------------------------------------------------
    // TEST-ONLY VISIBILITY HOOKS (package-private; no production callers)
    // -------------------------------------------------------------------
    static final class ReplaySample {
        final double reward;
        final boolean done;
        ReplaySample(double reward, boolean done) { this.reward = reward; this.done = done; }
    }

    synchronized List<ReplaySample> debugReplaySnapshot() {
        List<ReplaySample> out = new ArrayList<>();
        for (Transition t : replay) out.add(new ReplaySample(t.r, t.done));
        return out;
    }

    synchronized int debugOpenEpisodeCount() {
        return open.size();
    }

    double debugReward(double hc, double re, double qo) {
        return reward(hc, re, qo);
    }

    double debugScale(int idx, double v) { return scale(idx, v); }
    static int debugFTotal()  { return FTOTAL; }
    static int debugIdxEtx()  { return IDX_ETX; }
    static int debugIdxHc()   { return IDX_HC; }
    static int debugIdxStr()  { return IDX_STR; }
    static int debugIdxSr()   { return IDX_SR; }
    static int debugIdxMpiq() { return IDX_MPIQ; }
    static int debugIdxCc()   { return IDX_CC; }
}
