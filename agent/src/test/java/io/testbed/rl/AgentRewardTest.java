package io.testbed.rl;

import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;

class AgentRewardTest {

    private static boolean[] etxOnlyMask() {
        boolean[] m = new boolean[Agent.debugFTotal()];
        m[0] = true; // feature content is irrelevant to this test
        return m;
    }

    /**
     * Mirrors simulation.js's real call order: agent.endPhase() runs first,
     * then agent.decide() is invoked again for the next phase
     * (experiments/ararl/simulation.js, ALL_NODES_RETRAIN handler).
     */
    @Test
    void rewardShouldReflectPostDecisionOutcomeNotDecisionTimeSnapshot() {
        Agent agent = new Agent(4, etxOnlyMask(), 2000.0);

        int moteId = 1;
        // All four candidates identical and valid, since action selection is unmasked
        int[] candIds = {100, 101, 102, 103};
        boolean[] valid = {true, true, true, true};
        Agent.Counters ctrs = new Agent.Counters();

        // Phase 1: every candidate parent looks great (no loss, full energy).
        double[][] s1 = {{0.1}, {0.1}, {0.1}, {0.1}};
        double[] hc1 = {2.0, 2.0, 2.0, 2.0};
        double[] re1 = {2000.0, 2000.0, 2000.0, 2000.0};
        double[] ql1 = {0.0, 0.0, 0.0, 0.0};
        agent.decide(moteId, s1, valid, ctrs, candIds, hc1, re1, ql1);

        // Reality between phase 1 and phase 2: every candidate's queue
        // collapses (qlr jumps to 0.9) by the time the next phase begins.
        double[][] s2 = {{0.1}, {0.1}, {0.1}, {0.1}};
        double[] hc2 = {2.0, 2.0, 2.0, 2.0};
        double[] re2 = {2000.0, 2000.0, 2000.0, 2000.0};
        double[] ql2 = {0.9, 0.9, 0.9, 0.9};

        agent.endPhase();
        agent.decide(moteId, s2, valid, ctrs, candIds, hc2, re2, ql2);

        List<Agent.ReplaySample> replay = agent.debugReplaySnapshot();
        assertFalse(replay.isEmpty(), "expected the phase-1 decision to produce a transition");

        Agent.ReplaySample closed = replay.get(0);

        double outcomeReward = agent.debugReward(2.0, 2000.0, 0.9); // what actually happened

        assertEquals(outcomeReward, closed.reward, 1e-9,
            "reward for the phase-1 decision should reflect the degraded qlr observed " +
            "by the time the phase closed, not the good qlr visible at decision time");

        assertFalse(closed.done,
            "the mote has further candidates in phase 2, so this transition should not be terminal");
    }

    /**
     * Guards against a fix that only happens to work for a single phase
     * transition. Runs a continuously-active mote through several phases
     * with a different qlr each time, and checks every closed transition
     * reflects the qlr seen in the *following* phase's decide() call
     * (its actual outcome), not the qlr visible when it was chosen.
     */
    @Test
    void rewardTrackingHoldsAcrossMultiplePhases() {
        Agent agent = new Agent(4, etxOnlyMask(), 2000.0);

        int moteId = 7;
        // All four candidates identical (see test above)
        int[] candIds = {200, 201, 202, 203};
        boolean[] valid = {true, true, true, true};
        Agent.Counters ctrs = new Agent.Counters();
        double[][] s = {{0.1}, {0.1}, {0.1}, {0.1}};
        double[] hc = {1.0, 1.0, 1.0, 1.0};
        double[] re = {2000.0, 2000.0, 2000.0, 2000.0};

        double[] qlrByPhase = {0.0, 0.2, 0.9, 0.1};

        for (double qlr : qlrByPhase) {
            agent.decide(moteId, s, valid, ctrs, candIds, hc, re, new double[]{qlr, qlr, qlr, qlr});
            agent.endPhase();
        }

        List<Agent.ReplaySample> replay = agent.debugReplaySnapshot();
        // One decide() per phase closes the *previous* phase's episode,
        // so phases 2..N each produce one closed transition (N-1 total).
        assertEquals(qlrByPhase.length - 1, replay.size(),
            "expected one closed transition per phase after the first");

        for (int i = 0; i < replay.size(); i++) {
            double expectedReward = agent.debugReward(hc[0], re[0], qlrByPhase[i + 1]);
            assertEquals(expectedReward, replay.get(i).reward, 1e-9,
                "transition " + i + " should be rewarded on the qlr observed in the "
                + "phase after it was decided, not the qlr at decision time");
            assertFalse(replay.get(i).done, "mote stays active every phase, none of these are terminal");
        }
    }
}
