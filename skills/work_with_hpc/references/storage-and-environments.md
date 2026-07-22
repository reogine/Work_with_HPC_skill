# Storage and Software Environments

HPC clusters differentiate between safe, slow storage and fast, parallel storage. They also require careful environment management to avoid dependency conflicts.

## 1. Lustre / Scratch Storage vs. Home
- **Home Directory (`~`)**: Small quotas, slower network drives. Best for source code, small scripts, and configuration files. Do NOT run heavy I/O tasks here.
- **Lustre/Scratch**: High-performance parallel filesystem. 
  - **Rule:** ALL large datasets, model checkpoints, Python virtual environments, and heavy log outputs MUST reside here.

## 2. Software Modules
Always load software dynamically using the Environment Modules system.

### Best Practices:
1. **Purge first**: Always clear existing modules to avoid hidden conflicts.
   ```bash
   module purge
   ```
2. **Load specific versions**: 
   - CPU Python: `module load Python/3.12.3-GCCcore-13.3.0`
   - GPU PyTorch: `module load PyTorch/2.1.2-foss-2023a-CUDA-12.1.1`

## 3. Python Virtual Environments
Never use system Python for packages. Create your own isolated environment on the Lustre storage.
```bash
# Create environment
python3 -m venv /path/to/lustre/my_project/env

# Activate in your SLURM script
source /path/to/lustre/my_project/env/bin/activate
```
