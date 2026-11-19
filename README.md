# IoT-AI Simulation Testbed

This repository contains the code and archived experiment artifacts for a
Dockerized IoT-AI simulation workflow built around Contiki-NG, Cooja, and a Java
RL agent.

The repository is intended to let reviewers and collaborators inspect the
simulation code, rebuild the Docker environment, run a representative
simulation, and reproduce the result-generation workflow. Thesis drafts,
article/manuscript drafts, reviewer responses, and other private writing
materials are intentionally not part of this repository.

## What Is Included

- Docker environment for headless Cooja simulation runs.
- Pinned lab-controlled Contiki-NG and Cooja checkouts.
- ARARL experiment source code under `experiments/ararl/`.
- RL agent source code under `agent/`.
- Feature mask definitions under `masks/`.
- Batch runners:
  - `run.py` for Cooja simulation batches and metric aggregation.
  - `run_ga.py` for GA-based feature-mask search.
- Archived result data under `results/data/`.

## What Is Not Included

- Thesis drafts.
- Article/manuscript drafts.
- Private notes, credentials, SSH details, or server paths.
- Generated local build products such as `rl-agent-all.jar`.

## Requirements

Use a Linux host with Docker. The workflow is tested on Linux and is intended to
run inside Docker.

Recommended:

- Docker Engine running on the host.
- Git.
- At least several GB of free disk space.
- Enough RAM for Docker, Cooja, Gradle, and the Java RL agent. A full run is not
  a lightweight unit test.

Windows users should run the workflow through Linux/WSL or a Linux server. Full
Cooja runs are much slower when the repository is bind-mounted from a Windows
filesystem.

## Dependency Layout

This repository uses pinned lab forks:

- `contiki-ng/` from `https://github.com/HC-AI-Lab/contiki-ng.git`
- `contiki-ng/tools/cooja/` from `https://github.com/HC-AI-Lab/cooja.git`

Do not manually clone upstream Contiki-NG or Cooja into this repository. Use
`setup_repo.sh` so the expected paths and pinned checkouts are initialized
correctly.

## First-Time Setup

Clone the repository:

```bash
git clone https://github.com/HC-AI-Lab/iot-ai-simulation-testbed.git
cd iot-ai-simulation-testbed
```

Initialize the pinned Contiki-NG and Cooja checkouts:

```bash
./setup_repo.sh
```

Start the Docker environment:

```bash
./docker_run.sh
```

`docker_run.sh` will:

- verify the expected Contiki-NG and Cooja checkouts,
- build the Docker image `cooja-headless-rl:latest` if needed,
- mount this repository at `/workspace`,
- attach to the container shell.

## Build The RL Agent

Run this inside the Docker container after a fresh clone, or after changing Java
agent code:

```bash
./build-agent.sh
```

This builds the fat jar:

```text
/workspace/agent/build/libs/rl-agent-all.jar
```

and copies it into Cooja's library directory:

```text
/workspace/contiki-ng/tools/cooja/lib/rl-agent-all.jar
```

The jar is a generated build product and is not tracked by Git.

## Run One Simulation

Inside the Docker container, run one representative simulation:

```bash
python3 run.py \
  --ararl-dir /workspace/experiments/ararl \
  --logs-dir /workspace/results/data/manual_single/logs \
  --gradle-root /workspace/contiki-ng/tools/cooja \
  --nodes 60 \
  --ppm 80 \
  --topology-ids 01 \
  --mask-file /workspace/masks/baseline/etx.yaml \
  --mask-name etx \
  --traffic-seeds 1 \
  --jobs 1 \
  --work-root /workspace/_work
```

This command runs exactly one task:

- 60 nodes,
- 80 packets per minute,
- topology `01`,
- traffic seed `1`,
- mask `etx`.

The run can take tens of minutes depending on CPU, disk, and Docker setup.

## Output Files

For the example above, outputs are written under:

```text
results/data/manual_single/logs/
```

Important files include:

- `summary.csv`: per-run summary rows.
- `run_checkpoint.json`: checkpoint/resume state.
- `N60_PPM80/topo01/seed1/etx/runner.log`: Cooja/Gradle runner log.
- `N60_PPM80/topo01/seed1/etx/COOJA.testlog`: raw Cooja log.
- `N60_PPM80/etx/aggregated_results.csv`: aggregate metrics.
- `N60_PPM80/etx/aggregated_results.json`: aggregate metrics.

The primary reported metrics are:

- `Delay` in milliseconds,
- `NLT` in milliseconds,
- `PRR` as a ratio.

## Run A Small GA Test

Inside the Docker container, a small GA test can be launched with:

```bash
python3 run_ga.py \
  --mask-file /workspace/masks/baseline/etx_re_qlr_hc.yaml \
  --ararl-dir /workspace/experiments/ararl \
  --gradle-root /workspace/contiki-ng/tools/cooja \
  --work-root /workspace/_work \
  --ga-out /workspace/results/data/manual_ga \
  --nodes 60 \
  --ppm 80 \
  --topologies 1 \
  --traffic-seeds 1 \
  --population 4 \
  --generations 2 \
  --elite 1 \
  --cx-rate 0.8 \
  --mut-rate 0.08 \
  --jobs 1
```

This is intentionally small for workflow validation. It still invokes Cooja
simulations, so it is slower than a normal software unit test.

## Archived Results

Archived experiment outputs are stored under:

```text
results/data/
```

These files are included to support result inspection and comparison without
requiring reviewers to rerun every batch. Full experiment batches are
computationally expensive; the single-run command above is the recommended first
check for environment reproducibility.

## Notes For Reviewers

- Run commands from the repository root unless stated otherwise.
- Use the Docker container for simulations.
- Rebuild the RL agent with `./build-agent.sh` before running simulations from a
  fresh clone.
- Generated logs and manual run outputs should be treated as local artifacts.
- Private thesis and article/manuscript documents are intentionally excluded
  from this code repository.
