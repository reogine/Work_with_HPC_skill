#!/bin/bash
#SBATCH --job-name=gpu_job
#SBATCH --output=logs/gpu_%j.out
#SBATCH --error=logs/gpu_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=128G
#SBATCH --time=24:00:00
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2

mkdir -p logs

echo "Starting GPU Job on $(hostname) at $(date)"

module purge
module load PyTorch/2.1.2-foss-2023a-CUDA-12.1.1

source /path/to/lustre/gpu_env/bin/activate

# For vLLM inference as an example:
# vllm serve /path/to/lustre/model/weights --tensor-parallel-size 2

# Or standard PyTorch training:
python3 -u train.py

echo "Job completed at $(date)"
