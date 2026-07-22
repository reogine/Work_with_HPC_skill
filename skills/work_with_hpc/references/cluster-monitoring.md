# Cluster Monitoring & Quota Management

This guide covers how to inspect available resources, check your personal access limits, and monitor your jobs.

## 1. Inspecting Partitions and Hardware
Use `sinfo` to view available partitions (queues) and the state of the nodes.
- **`compute`**: Standard CPU nodes. High core counts (e.g., 56 CPUs/node), good for parallel processing.
- **`himem`**: High memory nodes. For jobs needing >1TB RAM.
- **`gpu`**: Nodes equipped with accelerators (e.g., A100s).

## 2. Checking Your Account Limits
Always check your QOS (Quality of Service) and limits using `sacctmgr`.
Jobs exceeding these hard limits will remain pending indefinitely or be instantly rejected.

```bash
sacctmgr show user $USER withassoc format=user,account,partition,qos,maxwall,maxnodes,maxcpus,maxgres
```

### Common QOS Limits Example:
- **`default-gpu`**: Max 24 hours, Max 1 Node, Max 2 GPUs (`gres/gpu=2`). Even if a node has 4 GPUs, you may only be allowed to request 2.
- **`default-cpu` / `himem-cpu`**: Typically 36 hours maximum wall time.

## 3. Monitoring Active Jobs
Use `squeue` to monitor your jobs in real-time.
```bash
squeue -u $USER
```
If your job is pending (PD), check the `REASON` column. "QOSMaxGresPerUser" means you have hit your GPU limit.
