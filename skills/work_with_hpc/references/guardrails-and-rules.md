# HPC Guardrails and Rules

Adhering to these rules prevents system degradation, avoids account suspension, and ensures reproducible workflows.

## 1. The Golden Rule of Login Nodes
- **Never run heavy computational tasks on login nodes.**
- Login nodes are for submitting jobs (`sbatch`), editing text, moving files, and basic git operations. Running MPI, heavy Python scripts, or model training on the login node disrupts all other users.

## 2. SLURM Naming Conventions
- Always assign a descriptive `#SBATCH --job-name`.

## 3. Output Logging
- Never let SLURM spam the root of your project directory with `slurm-12345.out` files.
- Always map outputs to a dedicated `logs/` directory:
  ```bash
  #SBATCH --output=logs/job_%j.out
  #SBATCH --error=logs/job_%j.err
  ```
- Ensure the `logs/` directory exists before submitting the job (e.g., `mkdir -p logs`).

## 4. Local Dry-Runs (Pre-Flight Checks)
- **CRITICAL:** Always simulate or dry-run your scripts locally before submitting them to the SLURM queue. Do not waste time waiting for a job to queue only for it to fail instantly due to a typo or missing import.
- **How to test safely on a login node:**
  1. Activate the exact same environment the SLURM script will use.
  2. Run the script on a very tiny subset of data (or just 1 iteration/epoch) so it finishes in seconds.
  3. Ensure paths are correct, environment variables are set, and imports succeed.
  4. Terminate the test immediately if it starts consuming heavy resources.

### The Limits of Login Node Testing (Hardware Mismatches)
A test on the login node **cannot** predict hardware-specific errors (e.g., `Illegal instruction (core dumped)`) caused by CPU architecture mismatches. For example, if an environment module (like `foss-2023a`) was natively compiled for the AMD EPYC processors on the login/compute nodes, running it on the older Intel Xeons of the `gpu` nodes will cause an instant crash due to unsupported instructions (like AVX-512).

**How to predict/test this BEFORE submitting a batch job:**
Instead of testing on the login node, request a fast, interactive session directly on the target hardware using `srun`.
```bash
# Request an interactive shell on a GPU node for 30 minutes
srun --partition=gpu --gres=gpu:1 --time=00:30:00 --pty /bin/bash

# Once inside the node, run your small dry-run test
source env/bin/activate
python script.py
```
This guarantees your code, environment, and modules are fully compatible with the exact hardware your batch job will use, saving you from waiting in the queue just to fail instantly.
