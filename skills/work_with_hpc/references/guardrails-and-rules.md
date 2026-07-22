# HPC Guardrails and Rules

Adhering to these rules prevents system degradation, avoids account suspension, and ensures reproducible workflows.

## 1. The Golden Rule of Login Nodes
- **Never run heavy computational tasks on login nodes.**
- Login nodes are for submitting jobs (`sbatch`), editing text, moving files, and basic git operations. Running MPI, heavy Python scripts, or model training on the login node disrupts all other users.

## 2. SLURM Naming Conventions
- Always assign a descriptive `#SBATCH --job-name`.
- **CRITICAL**: Do NOT use the word "video" in any SLURM job names under any circumstances. (This is a strict policy requirement for this environment).

## 3. Output Logging
- Never let SLURM spam the root of your project directory with `slurm-12345.out` files.
- Always map outputs to a dedicated `logs/` directory:
  ```bash
  #SBATCH --output=logs/job_%j.out
  #SBATCH --error=logs/job_%j.err
  ```
- Ensure the `logs/` directory exists before submitting the job (e.g., `mkdir -p logs`).
