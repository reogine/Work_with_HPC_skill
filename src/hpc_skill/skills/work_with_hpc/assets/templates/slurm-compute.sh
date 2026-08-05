#!/bin/bash
#SBATCH --job-name=compute_job
#SBATCH --output=logs/compute_%j.out
#SBATCH --error=logs/compute_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --time=24:00:00
#SBATCH --partition=compute

mkdir -p logs

echo "Starting Compute Job on $(hostname) at $(date)"

module purge
module load Python/3.12.3-GCCcore-13.3.0

source /path/to/lustre/env/bin/activate

# Execute Python script
python3 -u main.py

echo "Job completed at $(date)"
