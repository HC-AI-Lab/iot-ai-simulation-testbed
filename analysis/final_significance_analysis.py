import sys
import statistics
import math
from pathlib import Path
sys.path.insert(0, "/workspace")
from run import parse_log

ORIG_TOPOS = [f"{i:02d}" for i in range(1, 11)]
NEW_TOPOS = [f"{i:02d}" for i in range(11, 61)]
ALL_TOPOS = ORIG_TOPOS + NEW_TOPOS

BASELINE_ROOT = "/workspace/results/data/baseline_v2/logs/N100_PPM120"
NEW_ROOT = "/workspace/results/data/power_check_pilot/logs/N100_PPM120"


def get_metrics(root, topo, mask):
    path = Path(f"{root}/topo{topo}/seed1/{mask}/COOJA.testlog")
    if not path.is_file():
        return None
    m = parse_log(path)
    if m is None:
        return None
    delay_mean = statistics.mean(m.delay_latency) if m.delay_latency else None
    return (m.nlt, m.prr, delay_mean)


def collect(mask_new, mask_orig=None, include_orig=True):
    data = {}
    if include_orig and mask_orig:
        for t in ORIG_TOPOS:
            r = get_metrics(BASELINE_ROOT, t, mask_orig)
            if r:
                data[t] = r
    for t in NEW_TOPOS:
        r = get_metrics(NEW_ROOT, t, mask_new)
        if r:
            data[t] = r
    return data


qo_cc = collect("qo-cc", None, include_orig=False)          # new topos only, n=50
etx = collect("etx", "etx", include_orig=True)               # orig 10 + new 50 = 60
rarl = collect("etx_re_qlr_hc", "etx_re_qlr_hc", include_orig=True)  # orig 10 + new 50 = 60

print(f"Sample sizes: qo-cc={len(qo_cc)}  etx={len(etx)}  rarl={len(rarl)}")
print()


def welch_t(vals1, vals2):
    m1, m2 = statistics.mean(vals1), statistics.mean(vals2)
    s1, s2 = statistics.stdev(vals1), statistics.stdev(vals2)
    n1, n2 = len(vals1), len(vals2)
    se = math.sqrt(s1**2/n1 + s2**2/n2)
    t = (m2 - m1) / se if se > 0 else 0.0
    return m1, s1, n1, m2, s2, n2, t


def report(name1, d1, name2, d2, metric_idx, label):
    v1 = [d1[t][metric_idx] for t in d1 if d1[t][metric_idx] is not None]
    v2 = [d2[t][metric_idx] for t in d2 if d2[t][metric_idx] is not None]
    m1, s1, n1, m2, s2, n2, t = welch_t(v1, v2)
    sig = abs(t) > 2.0  # approx critical value for large-ish df, p<0.05 two-tailed
    print(f"{label:<8} {name1}: mean={m1:.4g} std={s1:.4g} n={n1}  |  {name2}: mean={m2:.4g} std={s2:.4g} n={n2}  |  t={t:.3f}  {'SIGNIFICANT' if sig else 'not significant'}")


print("=== qo-cc vs etx (n=50 vs n=60, unpaired) ===")
report("qo-cc", qo_cc, "etx", etx, 0, "NLT")
report("qo-cc", qo_cc, "etx", etx, 1, "PRR")
report("qo-cc", qo_cc, "etx", etx, 2, "Delay")
print()
print("=== qo-cc vs rarl (n=50 vs n=60, unpaired) ===")
report("qo-cc", qo_cc, "rarl", rarl, 0, "NLT")
report("qo-cc", qo_cc, "rarl", rarl, 1, "PRR")
report("qo-cc", qo_cc, "rarl", rarl, 2, "Delay")
print()
print("=== rarl vs etx (n=60 vs n=60, unpaired) ===")
report("rarl", rarl, "etx", etx, 0, "NLT")
report("rarl", rarl, "etx", etx, 1, "PRR")
report("rarl", rarl, "etx", etx, 2, "Delay")
