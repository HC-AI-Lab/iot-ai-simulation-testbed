import re
import glob
import statistics
from collections import Counter

nn_values = []
paths = glob.glob("/workspace/results/data/fidelity_test/logs/N100_PPM120/topo*/seed1/etx/COOJA.testlog")
paths += glob.glob("/workspace/results/data/fidelity_test/logs/N100_PPM120/topo*/seed1/etx_re_qlr_hc/COOJA.testlog")

for path in paths:
    with open(path, errors="ignore") as f:
        for line in f:
            if "DBG_IN" in line:
                m = re.search(r"nn=(\d+)", line)
                if m:
                    nn_values.append(int(m.group(1)))

print("total DBG_IN samples:", len(nn_values))
print("nn distribution:", Counter(nn_values))

# Random-choice baseline: for states with nn>=2 candidates (matches the
# choiceStates gate in trackPolicyEvidence), expected P(random == best) = 1/nn.
choice_nns = [n for n in nn_values if n >= 2]
print("choiceStates-eligible samples (nn>=2):", len(choice_nns), "/", len(nn_values))
if choice_nns:
    random_hits = [1.0 / n for n in choice_nns]
    print(f"expected random-choice top1 rate (mean of 1/nn over nn>=2): {statistics.mean(random_hits):.3f}")
    print(f"mean nn (over nn>=2): {statistics.mean(choice_nns):.3f}")
