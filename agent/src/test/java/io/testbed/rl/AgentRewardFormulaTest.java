package io.testbed.rl;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Checks the reward formula itself against Lei &amp; Liu (2024) Eq. 10-13:
 *
 *   rank(a) = HC(a) + w1*QU(a) + w2*ECR(a),  w1 = w2 = 0.5   (Eq. 11, Table 1)
 *   QU(a)   = q / Q                                          (Eq. 12)
 *   ECR(a)  = 1 - RE/E0                                      (Eq. 13)
 *   reward  = 1 / rank(a)                                    (Eq. 10, valid-action case)
 *
 * Distinct from AgentRewardTest, which checks *when* the reward is computed
 * (post-decision outcome vs. decision-time snapshot). This checks the
 * formula's actual arithmetic once given the outcome values.
 */
class AgentRewardFormulaTest {

    private static boolean[] etxOnlyMask() {
        boolean[] m = new boolean[Agent.debugFTotal()];
        m[0] = true; // feature content is irrelevant to this test
        return m;
    }

    @Test
    void rewardMatchesPaperFormulaForMidRangeValues() {
        Agent agent = new Agent(4, etxOnlyMask(), 2000.0);

        // hc = 2 hops (raw, unnormalized per Eq. 11)
        // re = 1000/2000 => ECR = 0.5
        // qo = 4/8 buffers occupied => QU = 0.5
        // rank(a) = 2 + 0.5*0.5 + 0.5*0.5 = 2.5
        // reward  = 1/2.5 = 0.4
        double reward = agent.debugReward(2.0, 1000.0, 4.0);

        assertEquals(1.0 / 2.5, reward, 1e-6,
            "reward should equal 1/rank(a) with rank(a) = HC + 0.5*QU + 0.5*ECR");
    }

    @Test
    void hopCountIsNotNormalizedInTheRewardUnlikePaperState() {
        Agent agent = new Agent(4, etxOnlyMask(), 2000.0);

        // Doubling hc from 1 to 2 with everything else perfect (QU=0, ECR=0)
        // should roughly halve the reward (1/1 vs 1/2), since HC enters the
        // rank sum raw, not scaled down to a small fraction of 1.0.
        double rewardHc1 = agent.debugReward(1.0, 2000.0, 0.0);
        double rewardHc2 = agent.debugReward(2.0, 2000.0, 0.0);

        assertEquals(1.0, rewardHc1, 1e-6);
        assertEquals(0.5, rewardHc2, 1e-6);
    }

    @Test
    void rewardStaysFiniteWhenRankApproachesZero() {
        Agent agent = new Agent(4, etxOnlyMask(), 2000.0);

        // Best possible case: 0 hops, full energy, empty queue -> rank -> 0.
        // The paper's raw 1/rank(a) would divide by zero here; we keep a
        // small epsilon for numerical safety, so this must stay finite.
        double reward = agent.debugReward(0.0, 2000.0, 0.0);

        assertTrue(Double.isFinite(reward) && reward > 0,
            "reward must stay finite even as rank(a) approaches 0");
    }
}
