# Advanced Model Hosting on HPC

Deploying large AI models (like GLM-5.2 or Qwen2.5-72B) on an HPC cluster requires optimization strategies beyond standard batch processing.

## 1. High Memory CPU Inference with tmpfs
When running massive models on CPU, the bottleneck is often disk I/O when reading weights.
**The Solution:** Use RAM Disks (tmpfs).
- Request a `himem` node (e.g., ~1.5 TB RAM).
- Before starting the inference engine, copy the model weights from Lustre to the node's shared memory (`/dev/shm/`).
- Point the model loader to the `/dev/shm/` path.
This drastically accelerates loading times and reduces latency for disk-bound operations.

## 2. Distributed GPU Inference with vLLM
When deploying a vLLM server:
- **Respect Quotas:** If your QOS limit is 2 GPUs, set `#SBATCH --gres=gpu:2` and perfectly align vLLM with `tensor_parallel_size=2`.
- **Command Syntax:** Use the explicit `vllm serve` command instead of passing deprecated `--model` flags to the API server module.
- **Eager Mode:** For some architectures, enforcing eager execution (`enforce_eager=True`) avoids TorchInductor/CUDAGraph compilation overheads which can crash the node.

## 3. Dealing with Tunnels and Timeouts
When exposing your SLURM job to the outside world via Cloudflare Tunnels (or similar proxies):
- Standard proxies have hardcoded timeouts (e.g., Cloudflare limits HTTP requests to 100 seconds).
- If your model generation takes 105 seconds, the proxy will return an error (like `context canceled` or 504), even if the SLURM job successfully finishes generation locally.
- **Mitigation:** Use streaming responses (`stream=True`) so the proxy keeps the connection alive, or implement asynchronous background queues.
