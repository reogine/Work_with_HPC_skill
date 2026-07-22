#!/bin/bash
#SBATCH --job-name=himem_job
#SBATCH --output=logs/himem_%j.out
#SBATCH --error=logs/himem_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=1000G
#SBATCH --time=36:00:00
#SBATCH --partition=himem

mkdir -p logs

echo "Starting HiMem Job on $(hostname) at $(date)"

module purge
module load Python/3.12.3-GCCcore-13.3.0

source /path/to/lustre/env/bin/activate

# Execute memory-heavy Python script
python3 -u heavy_processing.py

echo "Job completed at $(date)"
