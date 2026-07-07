#!/usr/bin/env python3
from pathlib import Path

# LINK (3) + NODE (6) + NETWORK (3) = 12 features, matching Agent.java/simulation.js.
# bdi/tv/wr were dropped (exact duplicates of re/qlr/pfi respectively); pc was
# renamed to cc (it always computed child count, not parent count); mpiq/sr
# are new. See the feature audit for the full writeup.
LINK_FEATURES = ["etx", "rssi", "pfi"]
NODE_FEATURES = ["re", "qo", "mpiq", "qlr", "si", "cc"]
NETWORK_FEATURES = ["hc", "str", "sr"]
FEATURES = LINK_FEATURES + NODE_FEATURES + NETWORK_FEATURES


def mask_text(feature: str) -> str:
    lines = []
    lines += ["run:", f"  id: solo_{feature}", f'  notes: "SOLO feature mask: only {feature} enabled"', ""]
    lines += ["features:", "  all: false", ""]

    lines += ["  # LINK"]
    for key in LINK_FEATURES:
        lines += [f"  {key}:  {'true' if feature == key else 'false'}"]
    lines += [""]

    lines += ["  # NODE"]
    for key in NODE_FEATURES:
        lines += [f"  {key}:  {'true' if feature == key else 'false'}"]
    lines += [""]

    lines += ["  # NETWORK"]
    for key in NETWORK_FEATURES:
        lines += [f"  {key}:  {'true' if feature == key else 'false'}"]
    lines += [""]
    return "\n".join(lines)


def main() -> None:
    project_root = Path(__file__).resolve().parents[1]
    # Real layout is masks/solo/<feature>.yaml (this script previously wrote
    # to masks/solo_<feature>.yaml, flat -- a pre-existing mismatch that meant
    # it never actually reproduced the real solo masks; fixed here).
    out_dir = project_root / "masks" / "solo"
    out_dir.mkdir(parents=True, exist_ok=True)

    for feature in FEATURES:
        out_file = out_dir / f"{feature}.yaml"
        out_file.write_text(mask_text(feature), encoding="utf-8")

    print(f"Wrote SOLO masks to: {out_dir}")
    print("Files:", ", ".join([f"{f}.yaml" for f in FEATURES]))


if __name__ == "__main__":
    main()
