# HPC PETSc Error Pattern Dictionary

## 1. General PETSc Crash
- **Likely symptom**: `PETSC ERROR: ------------------------------------------------------------------------`
- **Root cause**: General PETSc library crash, which can be due to objects in the wrong state, memory corruption, or bad MPI usage.
- **Primary fix**: Look at the specific error code documented immediately below the dashed line for the precise root cause (e.g., `error code 73`). Use this error code in PETSc documentation to determine the actual failure.
