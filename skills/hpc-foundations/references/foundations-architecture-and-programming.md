# HPC Architecture and Hardware Foundations

Understanding the underlying hardware architecture of the cluster is critical to avoiding compilation mismatches and runtime crashes.

> [!NOTE]
> **AGENT INSTRUCTION**: This document is currently a template. When first operating on a new cluster, you must run commands like `lscpu` on the login node and `sinfo -o "%P %c %m %f %G"` to profile the cluster's hardware (CPU architectures, instruction sets like AVX-512, GPUs, RAM, etc.). Document your findings here so that future operations can avoid hardware-specific runtime crashes (e.g., compiling a module on an AVX-512 login node and running it on an older GPU node).

## Cluster Hardware Overview
*(Agent to populate based on cluster profiling)*

### 1. Login and Compute Nodes
- **Architecture**: *(e.g., Intel Xeon Platinum, AMD EPYC)*
- **Instruction Sets**: *(e.g., AVX-512 support)*

### 2. GPU Nodes
- **Architecture**: *(e.g., Older Intel Xeons)*
- **GPUs**: *(e.g., A100, H100)*
- **Instruction Sets**: *(e.g., AVX2 only)*

## Known Hardware Mismatch Traps
*(Agent to document any historical or predicted compilation mismatches based on the heterogeneous nature of the cluster.)*
