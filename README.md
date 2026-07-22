# My-HPC-Skills

A collection of custom AI agent skills tailored specifically for interacting with the **UM6P Toubkal Supercomputer**. These skills guide AI coding agents on how to safely navigate the cluster, write Slurm batch scripts, and avoid common hardware and quota pitfalls.

## Included Skills

### 1. `work_with_hpc` (Orchestration & Guardrails)
This skill governs how the agent should behave when orchestrating jobs on the cluster. It enforces:
- Local dry-runs and pre-flight checks on the login node.
- Proper SLURM naming conventions and output logging.
- Accurate baseline resource estimation (RAM/Time constraints).
- Strict adherence to the "Golden Rule of Login Nodes" (never run heavy computations on login nodes).

### 2. `hpc-foundations` (Knowledge Hub)
A deep foundational knowledge base customized to the exact specs of the Toubkal cluster. It includes:
- **Architecture**: Details the heterogeneous nature of the cluster (Intel Xeon Platinum with AVX-512 on login nodes vs older Xeons on the `gpu` partition) and provides solutions to avoid `Illegal instruction (core dumped)` compilation traps.
- **Schedulers**: Explicit mappings of Quality of Service (QOS) limits for the `gpu`, `compute`, and `himem` partitions.
- **Networking**: Explicit networking guardrails, such as noting that outbound QUIC (UDP) traffic fails on the cluster and tunneling solutions must use TCP (`http2`).

## Installation

These skills are designed to be dynamically loaded into the agent's context. Clone this repository and either link it or copy the `skills/` directory into your global agent configuration root (e.g., `~/.gemini/config/skills/`).
