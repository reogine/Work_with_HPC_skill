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
A test on the login node **cannot** predict hardware-specific errors (e.g., `Illegal instruction (core dumped)`) caused by CPU architecture mismatches. For example, if an environment module (like `foss-2023a`) was natively compiled for the newer processors on the login/compute nodes, running it on the older Intel Xeons of the `gpu` nodes will cause an instant crash due to unsupported instructions (like AVX-512).

**How to predict/prevent this BEFORE submitting a batch job:**
Instead of blindly waiting in an interactive `srun` queue just to test hardware compatibility, **cross-reference the cluster's known architecture.**
Check the `hpc-foundations` skill (specifically `references/foundations-architecture-and-programming.md`) which catalogs the hardware instructions sets (e.g. AVX-512 limits) for each partition on this cluster. By understanding the underlying architecture, you can proactively choose portable Conda binaries over globally-compiled modules and avoid the core-dump entirely without ever waiting in the queue!

## 5. Accurate Resource Estimation
- **CRITICAL:** Always estimate your RAM, CPU, GPU, and Wall Time requirements as accurately as possible before submitting a job.
- Do not blindly request the partition maximums (e.g., requesting 36 hours for a 5-minute script, or 128 CPUs for a single-threaded Python script). Over-requesting resources drastically lowers your job priority (queue time) and clogs the scheduler for other users.
- If a job fails due to an Out-Of-Memory (OOM) error or a Time Limit timeout, analyze the failure, adjust the `#SBATCH --mem` or `#SBATCH --time` flags accordingly, and document the new baseline for future runs.
