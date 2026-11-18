import json
import os
import statistics

nodes = [60, 80, 100]
ppms = [80, 100, 120]
ROOT = "/workspace/results/data/baseline_v2/logs"


def load(n, p, mk):
    path = f"{ROOT}/N{n}_PPM{p}/{mk}/aggregated_results.json"
    with open(path) as f:
        return json.load(f)


print(f"{'regime':<14}{'NLT_etx':>10}{'NLT_rarl':>10}{'NLT_d%':>9}  "
      f"{'PRR_etx':>9}{'PRR_rarl':>9}{'PRR_d%':>9}  "
      f"{'Delay_etx':>10}{'Delay_rarl':>11}{'Delay_d%':>9}")

nlt_deltas, prr_deltas, delay_deltas = [], [], []

for n in nodes:
    for p in ppms:
        etx = load(n, p, "etx")
        rarl = load(n, p, "etx_re_qlr_hc")
        regime = f"N{n}_PPM{p}"

        nlt_e, nlt_r = etx["metrics"]["NLT"]["mean"], rarl["metrics"]["NLT"]["mean"]
        prr_e, prr_r = etx["metrics"]["PRR"]["mean"], rarl["metrics"]["PRR"]["mean"]
        del_e, del_r = etx["metrics"]["Delay"]["mean"], rarl["metrics"]["Delay"]["mean"]

        nlt_d = (nlt_r - nlt_e) / nlt_e * 100
        prr_d = (prr_r - prr_e) / prr_e * 100
        delay_d = (del_r - del_e) / del_e * 100

        nlt_deltas.append(nlt_d)
        prr_deltas.append(prr_d)
        delay_deltas.append(delay_d)

        print(f"{regime:<14}{nlt_e:>10.0f}{nlt_r:>10.0f}{nlt_d:>+8.1f}%  "
              f"{prr_e:>9.4f}{prr_r:>9.4f}{prr_d:>+8.1f}%  "
              f"{del_e:>10.1f}{del_r:>11.1f}{delay_d:>+8.1f}%")

print()
print(f"NLT:   RARL wins in {sum(1 for d in nlt_deltas if d > 0)}/9 regimes, mean delta {statistics.mean(nlt_deltas):+.1f}%")
print(f"PRR:   RARL wins in {sum(1 for d in prr_deltas if d > 0)}/9 regimes, mean delta {statistics.mean(prr_deltas):+.1f}%")
print(f"Delay: RARL wins (lower) in {sum(1 for d in delay_deltas if d < 0)}/9 regimes, mean delta {statistics.mean(delay_deltas):+.1f}%")
