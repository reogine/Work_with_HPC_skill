# HPC GPU Stack Error Pattern Dictionary

## 1. CUDA PTX Version Mismatch
- **Likely symptom**: `CudaAPIError: [222] ... CUDA_ERROR_UNSUPPORTED_PTX_VERSION`
- **Root cause**: The application was compiled (e.g. by Numba or PyCUDA) with a newer CUDA toolkit than the NVIDIA driver supports on the active compute node.
- **Primary fix**: Load a compatible (older) CUDA module before running the script.
