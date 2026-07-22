> [!NOTE]
> For specific UM6P Toubkal cluster policies, limits, and storage paths, always refer to the official documentation: https://crc4.gitlab.io/um6p/operations/um6p-sysops/

# Storage, Network, Cloud, And Admin

Use this reference when the task touches storage tiers, RDMA, hardware, cloud deployment, site security, SSL, or maintenance actions that sit near platform administration.

Related references:

- Concepts: [foundations-architecture-and-programming.md](foundations-architecture-and-programming.md)
- Environments: [software-environments.md](software-environments.md)
- Future skill split: [skillization-roadmap.md](skillization-roadmap.md)

## Main Threads

### Storage and filesystems

- `From Hard Disks to Cluster Storage`
  - hardware chapter
  - disks
  - hardware storage solutions
  - software chapter
- `Network & Storage`
  - landing page for this branch

This is the right entry when the user needs to reason about local disks, shared storage, or how cluster storage stacks differ from workstation disks.

### Network and RDMA

- `HPC Network - RDMA`
  - page focused on RDMA-oriented HPC networking
- `HPC System Architecture`
  - network architecture section complements the RDMA page

Use this pair when the question is really about data movement, latency, or why network architecture changes scaling behavior.

### Hardware background

- `Computer Hardware`
  - landing page for hardware
- `HPC System Architecture`
  - hardware architecture section

The dedicated hardware page is light, so use it mainly as a routing node rather than a full knowledge source.

### Cloud and site administration

- `HPC Cloud Platform`
  - cloud-oriented HPC overview
- `HPC Security and Management`
  - cluster security and management context
- `WEB Server Auto Request and Renew Free SSL Certificate`
  - web certificate automation
- `Hyper-V Virtual Machine Disk Expansion`
  - virtualization maintenance operation

These are mixed-granularity pages. Treat them as seeds for future admin-facing skills rather than a finished admin manual.

## Source Pages

| Source page | Main sections | Use it for |
| --- | --- | --- |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | landing page | entry into storage branch |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | hardware, disks, storage solutions, software | storage taxonomy |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | RDMA | network-performance background |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | landing page | hardware routing |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | network and hardware architecture | complement to storage and RDMA |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | cloud page | HPC cloud orientation |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | security and management | security and admin framing |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | overview, certificate application and renewal | web admin micro-playbook |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | Hyper-V disk expansion | virtualization maintenance micro-playbook |

## Routing Rules

- If the user asks about parallel filesystem performance or shared storage choices, start with the storage page and then cross-load HPC architecture.
- If the user asks about low-latency fabric or MPI scaling pain, load the RDMA page and HPC architecture together.
- If the user asks about cloud-hosted HPC or site-level services, load the cloud and admin pages but keep expectations narrow because this part of hpclib is relatively shallow.

## Guardrails

- RDMA, storage stacks, and cluster security are highly implementation-specific. Use this reference for orientation only.
- SSL and Hyper-V pages are admin micro-guides, not generic HPC user material.
- Before applying any admin procedure, verify the exact platform, distribution, service manager, and backup or rollback path.
- **Networking/Tunneling on Toubkal**: Outbound UDP (QUIC) traffic is blocked or fails on the cluster network. If you are running cloud tunneling solutions (like `cloudflared`) to expose services (like vLLM) from a compute node, you must configure the tunnel to fallback to TCP (`http2`) by either letting the QUIC precheck fail gracefully or forcing the protocol flag (`--protocol http2`).
