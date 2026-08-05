> [!NOTE]
> For specific UM6P Toubkal cluster policies, limits, and storage paths, always refer to the official documentation: https://crc4.gitlab.io/um6p/operations/um6p-sysops/

# Software Environments

Use this reference when the question is about Python environments, Conda, container strategy, Singularity or Apptainer-style execution, or surveying common HPC software families.

Related references:

- OS prerequisites: [linux-and-os.md](linux-and-os.md)
- Storage and admin context: [storage-network-cloud-and-admin.md](storage-network-cloud-and-admin.md)
- Execution workflow: `skills/hpc-orchestration/SKILL.md`

## Main Threads

### Environment management

- `Use Conda for Cluster Python Environment Management`
  - what Conda is
  - installation
  - user usage
  - configuration management

This is the best entry point when the user needs isolated Python stacks without touching system packages.

### Containers

- `Things About Containers`
  - container overview
  - Docker
  - Singularity
- `Basic Usage of Singularity`
  - build
  - pull
  - run
  - exec
  - shell
  - inspect
  - help

This pair covers the conceptual reason to use containers and the concrete Singularity command surface commonly seen on HPC clusters.

### Software catalog

- `Summary of Common HPC Computing Applications and Software`
  - survey page for common scientific and HPC software families
- `Software & Tools`
  - category landing page for the software branch

These pages are useful for mapping the ecosystem, not for deep operational detail.

### Low-priority productivity tooling

- `Useful Chrome Extensions`
  - translation
  - tab management
  - AI assistant browser plugins

This page is ancillary. Keep it out of most skills unless browser productivity is the explicit user need.

## Source Pages

| Source page | Main sections | Use it for |
| --- | --- | --- |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | landing page | branch entry |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | Conda intro, install, user flow, config | Python stack setup |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | containers, Docker, Singularity | tool selection and conceptual grounding |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | build, pull, run, exec, shell, inspect | concrete Singularity command map |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | software summary | ecosystem survey |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | browser plugins | low-priority productivity appendix |

## Routing Rules

- If the user wants a Python environment on a cluster, start with Conda.
- If the user wants portable or reproducible runtime stacks, start with the container overview and then load the Singularity page.
- If the user needs actual launch scaffolds, leave this reference and load `hpc-orchestration`.

## Guardrails

- Cluster container policy varies widely. Some sites allow Apptainer only, some disallow unprivileged image builds, and some prefer centrally maintained module stacks.
- Conda is convenient but can be slow or storage-heavy on shared filesystems. Re-check with site policy before recommending large writable environments on home storage.
