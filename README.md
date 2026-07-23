# Work_with_HPC_skill

A collection of custom AI agent skills tailored specifically for interacting with the **UM6P Toubkal Supercomputer**. These skills guide AI coding agents on how to safely navigate the cluster, write Slurm batch scripts, and avoid common hardware and quota pitfalls.

## Included Skills

### 1. `work_with_hpc` (Orchestration & Guardrails)
This skill governs how the agent should behave when orchestrating jobs on the cluster. It serves as the primary operational playbook.
- **Cluster Monitoring & Quotas (`cluster-monitoring.md`)**: Instructs the agent on how to use `sinfo` and `sacctmgr` to inspect available resources and understand strict QOS constraints before drafting job submissions.
- **Storage and Environments (`storage-and-environments.md`)**: Forces the agent to use Lustre/Scratch storage for intensive tasks, enforces proper environment module loading (`module purge` followed by explicit versions), and guides the deployment of Python Virtual Environments on compute nodes without `conda activate` failures.
- **Guardrails (`guardrails-and-rules.md`)**: Enforces critical rules:
  - Local dry-runs and pre-flight checks on the login node.
  - Proper SLURM naming conventions and isolated output logging (`logs/`).
  - Accurate baseline resource estimation (RAM/Time constraints) to preserve queue priority.
  - Strict adherence to the "Golden Rule of Login Nodes" (never run heavy computations on login nodes).

### 2. `hpc-foundations` (Knowledge Hub)
A deep foundational knowledge base customized to the exact specs of the Toubkal cluster. It sits below `work_with_hpc` to provide the "why" behind the "how".
- **Hardware Architecture (`foundations-architecture-and-programming.md`)**: Details the heterogeneous nature of the cluster. Explains that the Intel Xeon Platinum processors on the login/compute nodes natively support `AVX-512`, while the older Xeons on the `gpu` partition do not. It provides concrete solutions to avoid the notorious `Illegal instruction (core dumped)` compilation trap.
- **Schedulers & Execution (`schedulers-and-execution.md`)**: Explicit mappings of Quality of Service (QOS) limits tailored for typical user accounts on Toubkal:
  - `gpu`: Max 2 A100 GPUs, 24-hour limit.
  - `compute`: Max 64 nodes, 36-hour limit.
  - `himem`: Max 112 CPUs, 36-hour limit.
- **Storage, Network & Cloud (`storage-network-cloud-and-admin.md`)**: Explicit networking guardrails, documenting that outbound QUIC (UDP) traffic fails on the cluster network and tunneling solutions (like `cloudflared`) must be configured to fallback to TCP (`http2`).

## Installation

These skills are designed to be dynamically loaded into the agent's context. Clone this repository and either link it or copy the `skills/` directory into your global agent configuration root (e.g., `~/.gemini/config/skills/`).
