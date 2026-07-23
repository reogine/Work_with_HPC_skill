# Work_with_HPC_skill

A collection of custom AI agent skills tailored specifically for interacting with the **UM6P Toubkal Supercomputer**. These skills guide AI coding agents on how to safely navigate the cluster, write Slurm batch scripts, and avoid common hardware and quota pitfalls.

## Included Skills

### 1. `work_with_hpc` (Orchestration & Guardrails)
This skill governs how the agent should behave when orchestrating jobs on the cluster. It serves as the primary operational playbook.
- **Cluster Monitoring & Quotas (`cluster-monitoring.md`)**: Instructs the agent on how to use `sinfo` and `sacctmgr` to inspect available resources and understand strict QOS constraints before drafting job submissions.
- **Storage and Environments (`storage-and-environments.md`)**: Forces the agent to use Lustre/Scratch storage for intensive tasks, enforces proper environment module loading (`module purge` followed by explicit versions), and guides the deployment of Python Virtual Environments on compute nodes without `conda activate` failures.
- **Guardrails (`guardrails-and-rules.md`)**: Enforces critical rules:
  - Local dry-runs and pre-flight checks on the login node.
  - Proper SLURM naming conventions and isolated output logging (`logs/`).
  - Accurate baseline resource estimation (RAM/Time constraints) to preserve queue priority.
  - Strict adherence to the "Golden Rule of Login Nodes" (never run heavy computations on login nodes).

### 2. `hpc-foundations` (Knowledge Hub)
A deep foundational knowledge base customized to the exact specs of the Toubkal cluster. It sits below `work_with_hpc` to provide the "why" behind the "how".
- **Hardware Architecture (`foundations-architecture-and-programming.md`)**: Details the heterogeneous nature of the cluster. Explains that the Intel Xeon Platinum processors on the login/compute nodes natively support `AVX-512`, while the older Xeons on the `gpu` partition do not. It provides concrete solutions to avoid the notorious `Illegal instruction (core dumped)` compilation trap.
- **Schedulers & Execution (`schedulers-and-execution.md`)**: Explicit mappings of Quality of Service (QOS) limits tailored for typical user accounts on Toubkal:
  - `gpu`: Max 2 A100 GPUs, 24-hour limit.
  - `compute`: Max 64 nodes, 36-hour limit.
  - `himem`: Max 112 CPUs, 36-hour limit.

## Installation & Usage

This repository is designed to be injected into your favorite AI coding agent's context. Here is how to install and use the skills across the most popular agents:

### 1. Claude Code (CLI)
Claude Code natively supports custom skills to extend its capabilities.
1. Clone this repository: `git clone https://github.com/reogine/Work_with_HPC_skill.git`
2. Copy the contents of the `skills/` directory into your global or project-level `.claude/skills/` directory:
   ```bash
   mkdir -p ~/.claude/skills
   cp -r Work_with_HPC_skill/skills/* ~/.claude/skills/
   ```
3. **Usage**: Claude Code will detect the `SKILL.md` files. You can trigger the skill manually in the CLI by typing its command (e.g., `/work_with_hpc`) or Claude will automatically invoke it when it recognizes you are working on an HPC task.

### 2. Cursor (IDE)
Cursor supports custom Agent Skills out of the box.
1. In your project's root folder, create a `.cursor/skills/` directory.
2. Copy the specific skill folders into it:
   ```bash
   mkdir -p .cursor/skills
   cp -r Work_with_HPC_skill/skills/* .cursor/skills/
   ```
3. **Usage**: Ask the Cursor Agent (Cmd+L or Composer) to "Deploy this model on the cluster". It will automatically detect and follow the rules laid out in the `SKILL.md` files.

### 3. Hermes AI Agent
Hermes relies on a persistent memory system and codified Markdown skills.
1. Clone the repository into a temporary location.
2. Copy the skills into your Hermes global skills directory:
   ```bash
   mkdir -p ~/.hermes/skills
   cp -r Work_with_HPC_skill/skills/* ~/.hermes/skills/
   ```
3. **Usage**: Hermes will automatically identify and integrate these playbooks into its behavior. Whenever you ask Hermes to interact with the HPC or write a SLURM script, it will reference these skills to avoid common pitfalls.

### 4. General Agents (OpenDevin, AutoGPT, ChatGPT, Claude)
If your agent does not support a dedicated "skills" folder:
1. Provide the main `SKILL.md` file as an attachment or system prompt context.
2. **Example Prompt**: *"Please write a SLURM script to train my model. Before you write any code, read the attached `SKILL.md` file and follow its cluster guardrails strictly."*
