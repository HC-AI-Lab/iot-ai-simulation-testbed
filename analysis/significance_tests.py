"""Significance tests for the stressed regime (N100/PPM120).

Usage (inside the container):  python3 analysis/significance_tests.py [/workspace]

qo-cc was selected by the GA on topologies 01-10; qo-cc, ETX and RARL were then
run on topologies 11-60. Reports unpaired Welch tests, paired t-tests on the
shared topologies, and a Holm correction over the qo-cc comparisons.
"""
import sys, statistics, math
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else "/workspace")
sys.path.insert(0, str(ROOT))
from run import parse_log  # the pipeline's own parser

BASE = ROOT / "results/data/baseline_v2/logs/N100_PPM120"
NEW = ROOT / "results/data/power_check_pilot/logs/N100_PPM120"
MASKS = {"qo-cc": "qo-cc", "ETX": "etx", "RARL": "etx_re_qlr_hc"}
METRICS = ["NLT", "PRR", "Delay"]


def metrics(root, topo, mask):
    p = root / f"topo{topo}/seed1/{mask}/COOJA.testlog"
    if not p.is_file():
        return None
    m = parse_log(p)
    if m is None:
        return None
    d = statistics.mean(m.delay_latency) if m.delay_latency else None
    return {"NLT": m.nlt, "PRR": m.prr, "Delay": d}


def t_sf(t, df):
    """Two-tailed p for Student t via the regularized incomplete beta (no scipy needed)."""
    x = df / (df + t * t)
    return betainc(df / 2, 0.5, x)


def betainc(a, b, x):
    if x <= 0: return 0.0
    if x >= 1: return 1.0
    lbeta = math.lgamma(a + b) - math.lgamma(a) - math.lgamma(b)
    front = math.exp(math.log(x) * a + math.log(1 - x) * b + lbeta)
    if x < (a + 1) / (a + b + 2):
        return front * cf(a, b, x) / a
    return 1 - front * cf(b, a, 1 - x) / b


def cf(a, b, x, it=300, eps=1e-14):
    c, d = 1.0, 1 - (a + b) * x / (a + 1)
    d = 1 / (d if abs(d) > 1e-300 else 1e-300); h = d
    for m in range(1, it):
        for num in (m * (b - m) * x / ((a + 2*m - 1) * (a + 2*m)),
                    -(a + m) * (a + b + m) * x / ((a + 2*m) * (a + 2*m + 1))):
            d = 1 + num * d; d = 1 / (d if abs(d) > 1e-300 else 1e-300)
            c = 1 + num / c; c = c if abs(c) > 1e-300 else 1e-300
            h *= d * c
        if abs(d * c - 1) < eps: break
    return h


def welch(a, b):
    ma, mb, va, vb, na, nb = statistics.mean(a), statistics.mean(b), statistics.variance(a), statistics.variance(b), len(a), len(b)
    se = math.sqrt(va/na + vb/nb); t = (ma - mb) / se
    df = (va/na + vb/nb)**2 / ((va/na)**2/(na-1) + (vb/nb)**2/(nb-1))
    return t, df, t_sf(t, df)


def paired(a, b):
    d = [x - y for x, y in zip(a, b)]; n = len(d)
    t = statistics.mean(d) / (statistics.stdev(d) / math.sqrt(n))
    return t, n - 1, t_sf(t, n - 1), statistics.mean(d)


data = {k: {} for k in MASKS}
for t in [f"{i:02d}" for i in range(1, 61)]:
    for name, mask in MASKS.items():
        root = BASE if (int(t) <= 10 and name != "qo-cc") else NEW
        r = metrics(root, t, mask)
        if r: data[name][t] = r

print("Sample sizes:", {k: len(v) for k, v in data.items()})

print("\n(a) Unpaired Welch (qo-cc n=50 on 11-60; ETX/RARL n=60 on 01-60)")
rows = []
for base in ("ETX", "RARL"):
    for met in METRICS:
        a = [v[met] for v in data["qo-cc"].values() if v[met] is not None]
        b = [v[met] for v in data[base].values() if v[met] is not None]
        t, df, p = welch(a, b)
        rows.append((f"qo-cc vs {base}", met, p))
        print(f"  qo-cc vs {base:<4} {met:<5} mean {statistics.mean(a):.4g} vs {statistics.mean(b):.4g}  t={t:+.3f} df={df:.1f} p={p:.4f}")

print("\n(b) Paired t on shared held-out topologies (qo-cc - baseline)")
prows = []
for base in ("ETX", "RARL"):
    shared = sorted(set(data["qo-cc"]) & set(data[base]))
    for met in METRICS:
        pairs = [(data["qo-cc"][t][met], data[base][t][met]) for t in shared
                 if data["qo-cc"][t][met] is not None and data[base][t][met] is not None]
        t, df, p, md = paired([x for x, _ in pairs], [y for _, y in pairs])
        prows.append((f"qo-cc vs {base}", met, p))
        print(f"  qo-cc vs {base:<4} {met:<5} n={len(pairs)} mean diff={md:+.4g}  t={t:+.3f} p={p:.4f}")

def holm(rows, title):
    print(f"\n(c) Holm correction over the {len(rows)} {title} qo-cc tests (family alpha 0.05)")
    for i, (name, met, p) in enumerate(sorted(rows, key=lambda r: r[2])):
        thr = 0.05 / (len(rows) - i)
        print(f"  {name:<14} {met:<5} p={p:.4f}  Holm threshold={thr:.4f}  {'REJECT H0' if p < thr else 'not significant'}")
        if p >= thr:
            break


holm(rows, "unpaired")
holm(prows, "paired")

print("\n(d) RARL vs ETX, unpaired n=60 vs 60")
for met in METRICS:
    a = [v[met] for v in data["RARL"].values() if v[met] is not None]
    b = [v[met] for v in data["ETX"].values() if v[met] is not None]
    t, df, p = welch(a, b)
    print(f"  RARL vs ETX  {met:<5} t={t:+.3f} p={p:.4f}")
