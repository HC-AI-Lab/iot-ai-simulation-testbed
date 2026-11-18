import json
import math

nodes = [60, 80, 100]
ppms = [80, 100, 120]
ROOT = "/workspace/results/data/baseline_v2/logs"


def load(n, p, mk):
    with open(f"{ROOT}/N{n}_PPM{p}/{mk}/aggregated_results.json") as f:
        return json.load(f)


def welch_t(m1, s1, n1, m2, s2, n2):
    se = math.sqrt((s1**2)/n1 + (s2**2)/n2)
    if se == 0:
        return 0.0
    return (m2 - m1) / se


print(f"{'regime':<14}{'metric':<8}{'etx_mean':>11}{'etx_std':>10}{'rarl_mean':>11}{'rarl_std':>10}{'t':>7}  overlap?")

sig_count = {"NLT": 0, "PRR": 0, "Delay": 0}
total = {"NLT": 0, "PRR": 0, "Delay": 0}

for n in nodes:
    for p in ppms:
        etx = load(n, p, "etx")
        rarl = load(n, p, "etx_re_qlr_hc")
        regime = f"N{n}_PPM{p}"
        for metric in ["NLT", "PRR", "Delay"]:
            em, es, en = etx["metrics"][metric]["mean"], etx["metrics"][metric]["std"], etx["runs"]["valid"]
            rm, rs, rn = rarl["metrics"][metric]["mean"], rarl["metrics"][metric]["std"], rarl["runs"]["valid"]
            t = welch_t(em, es, en, rm, rs, rn)
            # rough: |t| > ~2.1 approx significant at n=10ish (df~9-18), two-tailed p<0.05
            sig = abs(t) > 2.1
            total[metric] += 1
            if sig:
                sig_count[metric] += 1
            print(f"{regime:<14}{metric:<8}{em:>11.3f}{es:>10.3f}{rm:>11.3f}{rs:>10.3f}{t:>7.2f}  {'SIG' if sig else 'overlap/noise'}")

print()
for metric in ["NLT", "PRR", "Delay"]:
    print(f"{metric}: {sig_count[metric]}/{total[metric]} regimes show a statistically distinguishable ETX-vs-RARL difference (|t|>2.1, rough p<0.05)")
