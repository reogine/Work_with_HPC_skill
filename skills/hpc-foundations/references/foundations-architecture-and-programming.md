# HPC Architecture and Hardware Foundations

Understanding the underlying hardware architecture of the cluster is critical to avoiding compilation mismatches and runtime crashes.

## Cluster Hardware Overview

This cluster is heterogeneous, meaning different partitions are equipped with different generations and families of CPUs and GPUs. 

### 1. Login and Compute Nodes
- **Architecture**: Intel Xeon Platinum (e.g., 8276 @ 2.20GHz). (Note: Historically, some compute nodes might use AMD EPYC processors depending on the specific sub-cluster).
- **Instruction Sets**: These newer processors support advanced instruction sets, including **AVX-512**. 
- **Role**: Software compiled or installed here (via `module load` or native compilation) will often be heavily optimized for AVX-512 by default.

### 2. GPU Partition Nodes (`gpu`)
- **Architecture**: Older Intel Xeons.
- **GPUs**: 4x NVIDIA A100 GPUs per node.
- **Resources**: 128 CPUs, ~1TB RAM.
- **Instruction Sets**: These older CPUs **DO NOT** support AVX-512.

### 3. GPU H100 Partition (`gpu_h100`)
- **GPUs**: 4x NVIDIA H100 GPUs per node.
- **Resources**: 96 CPUs, ~1TB RAM.

## The Hardware Mismatch Trap (AVX-512)

Because the login nodes have newer CPUs than the `gpu` nodes, you must be extremely careful when using globally provided modules or compiling software.

### Case Study: PyTorch and `foss-2023a`
If you load a globally provided module like `foss-2023a` on the login node and submit a job to the `gpu` partition, the job may fail instantly with an **`Illegal instruction (core dumped)`** error.

**Why?**
The `foss-2023a` environment was compiled natively on the compute/login architecture, which means the binaries include AVX-512 instructions. When those binaries are executed on the older Xeons attached to the A100 GPUs, the CPU encounters an instruction it does not understand and dumps core.

### The Solution
1. **Prefer Custom Conda Environments**: Build your own isolated Conda environments instead of relying on globally provided modules for Python and PyTorch. Conda binaries are typically compiled to be highly portable across x86_64 architectures (e.g., standard AVX2).
2. **Compile on Target Hardware**: If you must compile software natively (e.g., C++/MPI applications), do not compile it on the login node. Request an interactive `srun` session on the target partition and compile it there to ensure the correct architecture flags are used.
