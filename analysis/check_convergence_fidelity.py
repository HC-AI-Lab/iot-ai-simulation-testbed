import re, sys, statistics

masks = ["etx", "etx_re_qlr_hc"]
topos = [f"{i:02d}" for i in range(1, 11)]

for mk in masks:
    print(f"=== mask={mk} ===")
    all_early = []
    all_late = []
    all_invalid = []
    for t in topos:
        path = f"/workspace/results/data/fidelity_test/logs/N100_PPM120/topo{t}/seed1/{mk}/agent.log"
        try:
            with open(path, errors="ignore") as f:
                lines = [l for l in f if "POLICY_EVAL" in l and "greedyTop1" in l]
        except FileNotFoundError:
            print(f"  topo{t}: MISSING agent.log")
            continue
        vals = []
        invalid_rates = []
        for l in lines:
            m = re.search(r"greedyTop1=([\d.]+)", l)
            if m:
                vals.append(float(m.group(1)))
            mi = re.search(r"invalidPickRate=([\d.]+)", l)
            if mi:
                invalid_rates.append(float(mi.group(1)))
        if len(vals) < 10:
            print(f"  topo{t}: too few eval points ({len(vals)})")
            continue
        n = len(vals)
        early_n = max(1, n // 5)
        early = vals[:early_n]
        late = vals[-early_n:]
        early_mean = statistics.mean(early)
        late_mean = statistics.mean(late)
        overall_mean = statistics.mean(vals)
        overall_std = statistics.pstdev(vals)
        all_early.extend(early)
        all_late.extend(late)
        invalid_mean = statistics.mean(invalid_rates) if invalid_rates else float('nan')
        all_invalid.extend(invalid_rates)
        print(f"  topo{t}: n={n} early={early_mean:.3f} late={late_mean:.3f} delta={late_mean-early_mean:+.3f} overall_mean={overall_mean:.3f} overall_std={overall_std:.3f} meanInvalidPickRate={invalid_mean:.3f}")
    if all_early and all_late:
        print(f"  --- MASK AGGREGATE: early={statistics.mean(all_early):.3f} late={statistics.mean(all_late):.3f} delta={statistics.mean(all_late)-statistics.mean(all_early):+.3f} ---")
        if all_invalid:
            print(f"  --- MASK AGGREGATE invalidPickRate: mean={statistics.mean(all_invalid):.3f} ---")
    print()
