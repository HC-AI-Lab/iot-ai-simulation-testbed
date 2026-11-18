import sys
import statistics
import math
sys.path.insert(0, "/workspace")
from run import parse_log  # reuse the exact same parsing logic as the real pipeline

topos = [f"{i:02d}" for i in range(1, 11)]
ROOT = "/workspace/results/data/baseline_v2/logs/N100_PPM120"


def per_topo(mask):
    out = {}
    for t in topos:
        path = f"{ROOT}/topo{t}/seed1/{mask}/COOJA.testlog"
        m = parse_log(__import__("pathlib").Path(path))
        if m is None:
            continue
        delay_mean = statistics.mean(m.delay_latency) if m.delay_latency else None
        out[t] = (m.nlt, m.prr, delay_mean)
    return out


etx = per_topo("etx")
rarl = per_topo("etx_re_qlr_hc")

common = sorted(set(etx) & set(rarl))
print(f"Matched topologies: {len(common)} / 10: {common}\n")


def paired_t(diffs):
    n = len(diffs)
    mean_d = statistics.mean(diffs)
    sd_d = statistics.stdev(diffs) if n > 1 else 0.0
    if sd_d == 0:
        return mean_d, 0.0, float('inf') if mean_d != 0 else 0.0
    se = sd_d / math.sqrt(n)
    t = mean_d / se
    return mean_d, sd_d, t


for idx, label in [(0, "NLT"), (1, "PRR"), (2, "Delay")]:
    diffs = [rarl[t][idx] - etx[t][idx] for t in common if rarl[t][idx] is not None and etx[t][idx] is not None]
    print(f"{label}: per-topology (RARL - ETX) = {[round(d,4) if label=='PRR' else round(d,1) for d in diffs]}")
    mean_d, sd_d, t = paired_t(diffs)
    sig = abs(t) > 2.26  # df=9, two-tailed p<0.05 critical value
    print(f"  paired mean diff={mean_d:.4f}  sd={sd_d:.4f}  paired-t={t:.3f}  {'SIGNIFICANT' if sig else 'still overlap/noise'}")
    print()
