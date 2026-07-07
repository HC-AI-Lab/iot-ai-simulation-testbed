package io.testbed.rl;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Sanity-checks the feature-normalization pipeline (Agent.scale()) after the
 * 13-&gt;12 feature reduction: every index must still map into [0,1] for
 * representative inputs, and the mask length (FTOTAL) must actually match
 * the number of feature indices simulation.js's ORDER array now expects.
 * Spot-checks STR/SR/MPIQ specifically since those are new or recalibrated.
 */
class AgentScaleTest {

    private static boolean[] singleFeatureMask(int idx) {
        boolean[] m = new boolean[Agent.debugFTotal()];
        m[idx] = true;
        return m;
    }

    @Test
    void featureCountIsTwelve() {
        assertTrue(Agent.debugFTotal() == 12, "expected 12 features after dropping BDI/TV/WR and adding MPIQ/SR");
    }

    @Test
    void strStaysBoundedForRepresentativeStretchValues() {
        Agent agent = new Agent(4, singleFeatureMask(Agent.debugIdxStr()), 2000.0);
        int idx = Agent.debugIdxStr();

        double[] representativeStretches = {0.0, 1.0, 50.0, 300.0, 2000.0};
        for (double v : representativeStretches) {
            double scaled = agent.debugScale(idx, v);
            assertTrue(scaled >= 0.0 && scaled <= 1.0,
                "STR scale(" + v + ") = " + scaled + " should be in [0,1]");
        }
    }

    @Test
    void srStaysBoundedForRepresentativeChurnValues() {
        Agent agent = new Agent(4, singleFeatureMask(Agent.debugIdxSr()), 2000.0);
        int idx = Agent.debugIdxSr();

        double[] representativeChurn = {0.0, 1.0, 50.0, 300.0, 2000.0};
        for (double v : representativeChurn) {
            double scaled = agent.debugScale(idx, v);
            assertTrue(scaled >= 0.0 && scaled <= 1.0,
                "SR scale(" + v + ") = " + scaled + " should be in [0,1]");
        }
    }

    @Test
    void mpiqSharesQueueCapBoundWithQo() {
        Agent agent = new Agent(4, singleFeatureMask(Agent.debugIdxMpiq()), 2000.0);
        int idx = Agent.debugIdxMpiq();

        assertTrue(agent.debugScale(idx, 0.0) == 0.0);
        assertTrue(agent.debugScale(idx, 8.0) == 1.0, "MPIQ should saturate at the queue capacity (8)");
        assertTrue(agent.debugScale(idx, 100.0) == 1.0, "MPIQ above capacity should clamp to 1.0, not overflow");
    }

    @Test
    void ccKeepsOldPcScalingBehavior() {
        Agent agent = new Agent(4, singleFeatureMask(Agent.debugIdxCc()), 2000.0);
        int idx = Agent.debugIdxCc();

        assertTrue(agent.debugScale(idx, 0.0) == 0.0);
        assertTrue(agent.debugScale(idx, 10.0) == 1.0);
        assertTrue(agent.debugScale(idx, 50.0) == 1.0, "CC above the safety limit should clamp, not overflow");
    }

    @Test
    void everyFeatureIndexStaysInUnitRangeForTypicalInputs() {
        Agent agent = new Agent(4, singleFeatureMask(Agent.debugIdxEtx()), 2000.0);
        double[] typicalInputs = {0.0, 0.5, 1.0, 5.0, 10.0, 100.0, 2000.0};

        for (int idx = 0; idx < Agent.debugFTotal(); idx++) {
            for (double v : typicalInputs) {
                double scaled = agent.debugScale(idx, v);
                assertTrue(scaled >= 0.0 && scaled <= 1.0,
                    "scale(idx=" + idx + ", v=" + v + ") = " + scaled + " should be in [0,1]");
            }
        }
    }
}
