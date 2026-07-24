# HPC MPI Error Pattern Dictionary

## 1. InfiniBand RDMA Permissions
- **Likely symptom**: `Failed to modify UD QP to INIT on mlx5_0: Operation not permitted`
- **Root cause**: MPI/RDMA traffic is blocked or misconfigured over InfiniBand interfaces due to strict permissions or incorrect UCX configuration on the node.
- **Primary fix**: Ensure the correct UCX/OpenMPI modules are loaded. Consider falling back to TCP (e.g. `--mca btl ^openib` or adjusting `UCX_TLS`) if IB is restricted for the specific queue.
