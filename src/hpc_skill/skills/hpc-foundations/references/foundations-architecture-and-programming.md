# HPC Architecture and Hardware Foundations

Understanding the underlying hardware architecture of the cluster is critical to avoiding compilation mismatches and runtime crashes.

> [!NOTE]
> **UM6P Toubkal Supercomputer Profile**
> This document has been customized for the UM6P Toubkal cluster based on historical profiling (`lscpu` and `sinfo`).

## Cluster Hardware Overview

### 1. Login and Compute Nodes
- **Architecture**: Intel(R) Xeon(R) Platinum 8276 CPU @ 2.20GHz
- **Instruction Sets**: Natively supports `AVX-512` (avx512f, avx512dq, avx512cd, avx512bw, avx512vl).
- **Compute Resources**: Standard compute nodes (`compute` partition) feature 56 CPUs and ~190 GB RAM. High memory nodes (`himem` partition) feature 112 CPUs and ~1.5 TB RAM.

### 2. GPU Nodes (`gpu` partition)
- **Architecture**: Older Intel Xeons
- **GPUs**: NVIDIA A100 (Up to 4x per node)
- **Instruction Sets**: Do **NOT** support `AVX-512`. They only support up to `AVX2`.
- **Resources**: 128 CPUs and ~1 TB RAM per node.

## Known Hardware Mismatch Traps

### 1. The AVX-512 Trap (Illegal Instruction Core Dump)
**The Problem**: If you load globally provided environment modules (e.g., `foss-2023a`) or compile software natively (using `-march=native`) on the login node, the binaries will be compiled for the Intel Xeon Platinum processors using AVX-512 instructions. When you submit a job to the `gpu` partition, these binaries will hit the older Intel Xeons, resulting in an instant `Illegal instruction (core dumped)` crash because the GPU node CPUs do not understand AVX-512 instructions.

**The Solution**: 
- Prefer portable Conda/Apptainer environments over globally compiled modules for tasks traversing both partitions.
- If compiling C/C++ code for the GPU nodes, do not use `-march=native` on the login node; explicitly target a lower instruction set like `AVX2` or compile the software directly via an interactive `srun` session on the target `gpu` node.
