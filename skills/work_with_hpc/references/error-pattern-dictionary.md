# Common Cluster Error Patterns

This dictionary contains real-world error patterns and signatures extracted from failed Slurm jobs on the UM6P cluster. Use these to diagnose and remediate issues when assisting users.

## 1. Walltime Limit Exceeded
- **Likely symptom**: `CANCELLED AT ... DUE TO TIME LIMIT` appears in the slurm output log.
- **Root cause**: The job exceeded the requested walltime (`--time`) or got stuck in an infinite loop/deadlock.
- **Primary fix**: Inspect if the job was genuinely progressing but needed more time. If so, increase `--time` in the job script. Otherwise, inspect for infinite loops or stalling.

## 2. Cgroup Out of Memory (OOM) Kill
- **Likely symptom**: `Detected 1 oom-kill event(s)` appears in the slurm log.
- **Root cause**: Slurm's out-of-memory handler (cgroup) killed the job because it consumed more memory than what was requested.
- **Primary fix**: Increase the memory request in the job script using `--mem` or `--mem-per-cpu`.

## 3. Application-Level Memory Error
- **Likely symptom**: `numpy.core._exceptions.MemoryError: Unable to allocate ... GiB`
- **Root cause**: The Python/Numpy script attempted to allocate an array larger than the physical memory available on the node, or larger than the requested limit.
- **Primary fix**: Request a high-memory node partition (`himem`), or optimize application memory usage (e.g., chunking, using `float32` instead of `float64`).

## 4. CUDA PTX Version Mismatch
- **Likely symptom**: `CudaAPIError: [222] ... CUDA_ERROR_UNSUPPORTED_PTX_VERSION`
- **Root cause**: The application was compiled (e.g. by Numba or PyCUDA) with a newer CUDA toolkit than the NVIDIA driver supports on the active compute node.
- **Primary fix**: Load a compatible (older) CUDA module before running the script.

## 5. InfiniBand RDMA Permissions
- **Likely symptom**: `Failed to modify UD QP to INIT on mlx5_0: Operation not permitted`
- **Root cause**: MPI/RDMA traffic is blocked or misconfigured over InfiniBand interfaces due to strict permissions or incorrect UCX configuration on the node.
- **Primary fix**: Ensure the correct UCX/OpenMPI modules are loaded. Consider falling back to TCP (e.g. `--mca btl ^openib` or adjusting `UCX_TLS`) if IB is restricted for the specific queue.

## 6. General PETSc Crash
- **Likely symptom**: `PETSC ERROR: ------------------------------------------------------------------------`
- **Root cause**: General PETSc library crash, which can be due to objects in the wrong state, memory corruption, or bad MPI usage.
- **Primary fix**: Look at the specific error code documented immediately below the dashed line for the precise root cause (e.g., `error code 73`). Use this error code in PETSc documentation to determine the actual failure.
