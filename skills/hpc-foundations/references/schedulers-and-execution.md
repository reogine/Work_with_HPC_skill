> [!NOTE]
> For specific UM6P Toubkal cluster policies, limits, and storage paths, always refer to the official documentation: https://crc4.gitlab.io/um6p/operations/um6p-sysops/

# Schedulers And Execution

Use this reference when the task is about queue systems, resource requests, batch scripts, arrays, MPI launch patterns, job accounting, or comparing Slurm, PBS Pro, and LSF.

Related references:

- Concepts: [foundations-architecture-and-programming.md](foundations-architecture-and-programming.md)
- OS prerequisites: [linux-and-os.md](linux-and-os.md)
- Future split plan: [skillization-roadmap.md](skillization-roadmap.md)

## Scope

The hpclib scheduler material is strongest on Slurm and lighter on PBS Pro and LSF. Treat it as a layered index:

1. start from the scheduler overview page
2. route to Slurm quick start or MPI guidance
3. use command-specific pages for accounting or admin-oriented subcommands
4. fall back to official vendor manuals before changing a real cluster

## Scheduler Landscape

### Overview page

- `Scheduler` covers:
  - scheduler overview
  - mainstream HPC scheduler comparison
  - LSF
  - Slurm
  - PBS
  - SGE

Use it to decide which branch to load next.

### Slurm coverage

- `Slurm Quick Start - User Guide`
  - overview
  - architecture
  - commands
  - examples
  - best practices for batch jobs
  - MPI
- `Slurm MPI User Guide`
  - PMIx
  - OpenMPI
  - Intel MPI
  - Hydra-based `mpirun`
  - `srun`
  - MPICH
  - MVAPICH2
  - HPE Cray PMI support
- `Job Arrays Support`
  - array IDs and environment variables
  - filename patterns
  - queue, cancel, control, and dependency usage
- `Commands, Configuration and Processes`
  - commands
  - configuration files
  - daemons and related processes
- `mpi.conf`
  - parameter-level MPI plugin configuration
- `sacct`
  - job accounting fields and state codes
- `sacctmgr`
  - accounting and entity management

### PBS Pro coverage

- `PBS Pro`
  - what PBS Pro is
  - architecture and components
- `PBSPro Cluster User Manual`
  - login
  - submit
  - query
  - cancel
  - dependencies

### LSF coverage

- `LSF Quick Reference`
  - install directories
  - user commands
  - `bsub`
  - admin and accounting commands
  - config files and daemon logs

## Source Pages

| Source page | Main sections | Use it for |
| --- | --- | --- |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | overview, major schedulers, LSF, Slurm, PBS, SGE | initial branch selection |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | basic concepts, Slurm intro, submission and management, resources | conceptual bridge from HPC basics into scheduling |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | overview, architecture, commands, examples, best practices, MPI | first Slurm page for users |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | PMIx, OpenMPI, Intel MPI, MPICH, MVAPICH2, `srun` | MPI launch and integration detail |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | arrays, env vars, filenames, dependencies | batch ensembles and parameter sweeps |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | commands, configs, daemons | operator and reference lookup |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | parameters, details | MPI plugin config lookup |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | accounting fields, states | runtime forensics and reporting |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | commands, entities | accounting administration |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | concept and architecture | PBS Pro orientation |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | submit, query, cancel, dependencies | PBS Pro user workflow |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | `bsub`, accounting, config, logs | LSF command map |

## Routing Rules

- If the user asks how to submit or monitor a real job, load this reference and then switch to `hpc-orchestration`.
- If the user asks why `mpirun` and `srun` differ, load `Slurm MPI User Guide`.
- If the user is managing large job farms, load `Job Arrays Support`.
- If the user needs accounting or state interpretation, load `sacct`.
- If the user is comparing scheduler families, start from `Scheduler`, then branch to the specific family.

## Guardrails

- Slurm command pages include user and admin material. Do not assume admin-level commands are safe for ordinary users.
- MPI launch guidance is cluster-sensitive. PMIx, PMI2, Hydra, and vendor-specific MPI stacks differ across sites.
- For live operations, prefer the relevant upstream documentation and local cluster policy over this summary.
