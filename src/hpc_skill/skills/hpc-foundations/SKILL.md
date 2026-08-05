---
name: hpc-foundations
description: Navigate foundational HPC knowledge across concepts, architectures, schedulers, Linux usage, storage and RDMA, containers, cloud basics, and cluster administration patterns distilled from hpclib.com. Use when the task is about understanding or explaining HPC basics, Slurm or PBS or LSF concepts, Linux-on-cluster workflows, software environment setup, storage or network fundamentals, or when turning general HPC knowledge into future skills.
---

# HPC Foundations

Use this skill as the general HPC knowledge hub that sits below solver-specific skills and beside `work_with_hpc`.

## Start

1. Read `references/index-map.md` first for the knowledge graph and the shortest route to the right topic.
2. Read `references/foundations-architecture-and-programming.md` when the task starts from HPC concepts, system design, hardware constraints (e.g. CPU architecture mismatches), or performance basics.
3. Read `references/schedulers-and-execution.md` when the task is about Slurm queues (gpu, compute, himem), batch scripts, or accounting limits.
4. Read `references/linux-and-os.md` when the task is about Linux usage, login patterns, or package management.
5. Read `references/software-environments.md` when the task is about Conda, modules, or picking common HPC tools.
6. Read `references/storage-network-cloud-and-admin.md` when the task is about storage tiers (e.g. Lustre scratch), RDMA, or site-level administration topics.
7. Read `references/source-catalog.md` when a page-level lookup is needed.
8. Read `references/skillization-roadmap.md` when splitting this index into narrower reusable skills.

## Positioning

- Prefer this skill for orientation, taxonomy, and first-pass explanation, specifically regarding underlying hardware architectures.
- Prefer `work_with_hpc` once the question becomes an execution workflow on this cluster.
- Prefer solver-specific skills once the question becomes input-deck or application specific.

## Guardrails

- Treat this as a practical knowledge index representing our history with this specific cluster.
- Re-check scheduler flags and module availability before applying them.
- Remember that hardware limits (like AVX-512 support on GPU nodes) are strictly hardware-bound and dictate module compatibility.
