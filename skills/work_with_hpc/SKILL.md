---
name: work_with_hpc
description: Generalized guide to orchestrating jobs on HPC, managing SLURM quotas, organizing storage, deploying environments, and optimizing model hosting (tmpfs, vLLM). Use when configuring HPC experiments or troubleshooting SLURM workflows.
---

# Work with HPC

Use this skill as a comprehensive guide for interacting with HPC environments, specifically focusing on SLURM workload managers, storage organization, and advanced model inference patterns.

## Start

1. Read `references/cluster-monitoring.md` to understand how to check your available resources and strict SLURM quotas.
2. Read `references/storage-and-environments.md` to learn why you must use Lustre/Scratch storage for intensive tasks and how to properly activate software modules.
3. Read `references/advanced-model-hosting.md` when deploying large AI models (like LLMs on GPUs via vLLM or massive CPU inference tasks using tmpfs).
4. Read `references/guardrails-and-rules.md` to understand strict cluster policies (like naming conventions and login node usage).

## Templates

Use `assets/templates/` when you need a concrete, best-practice SLURM script:
- `slurm-compute.sh` for standard multi-core processing.
- `slurm-himem.sh` for memory-heavy tasks.
- `slurm-gpu.sh` for GPU-accelerated tasks like PyTorch training or vLLM serving.

## Guardrails

- Do not use the word "video" in SLURM job names under any circumstances.
- Never run heavy scripts or training loops directly on the login node.
- Always check `sacctmgr` limits before requesting massive GPU or node allocations.
