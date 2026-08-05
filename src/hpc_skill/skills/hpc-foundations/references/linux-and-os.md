> [!NOTE]
> For specific UM6P Toubkal cluster policies, limits, and storage paths, always refer to the official documentation: https://crc4.gitlab.io/um6p/operations/um6p-sysops/

# Linux And Operating Systems

Use this reference when the user needs Linux fluency for cluster work, package installation, login methods, compatibility fixes, or a Linux versus Windows comparison.

Related references:

- Foundations: [foundations-architecture-and-programming.md](foundations-architecture-and-programming.md)
- Schedulers: [schedulers-and-execution.md](schedulers-and-execution.md)
- Environments: [software-environments.md](software-environments.md)

## Role In The Knowledge Graph

This topic is the operational substrate below scheduler usage and software environment management. If the user cannot navigate Linux, most HPC workflow advice will not stick.

## Main Threads

### OS overview

- `Operating System`
  - overview-level page that routes into Linux and Windows material

### Linux foundations

- `Linux Overview`
  - overview
  - usage
  - learning direction
- `A Guide to Familiarize with Basic Linux Operations`
  - general CLI fluency and daily commands
- `Summary of Linux User Login Methods`
  - local login
  - remote login
  - productivity tools

### Installation and package management

- `Summary of Linux Installation Methods`
  - hardware
  - OS selection
  - personal suggestions
- `Linux Software Installation and Management`
  - `yum` syntax
  - common `yum` commands
  - repository configuration

### Compatibility and toolchain edge cases

- `Compile and Install Higher Version of glibc Without Overwriting Original System Version`
  - preparation
  - checking system glibc
  - build environment
  - isolated install workflow

This page is especially useful when prebuilt binaries or modern Python packages are blocked by old enterprise distributions.

### Linux versus Windows

- `Differences Between Linux and Windows`
  - major differences
  - filesystem comparison
  - Linux file types
  - user model comparison
- `Windows`
  - Windows overview page
- `Collection of Original Windows System Image Resources`
  - Windows image resource index

The Windows pages are peripheral to core HPC cluster usage, but still relevant for workstation setup, dual-environment users, or training material.

## Source Pages

| Source page | Main sections | Use it for |
| --- | --- | --- |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | overview | entry point into OS material |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | overview, usage, how to learn Linux | first Linux orientation page |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | basic Linux operations | CLI fundamentals |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | local and remote login, tools | SSH and access habits |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | hardware, OS choice, advice | workstation or test-node setup |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | `yum`, repos | package management basics |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | isolated glibc build and usage | compatibility rescue path |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | filesystem and user differences | onboarding Windows users into Linux |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | overview | Windows context page |
| `https://crc4.gitlab.io/um6p/operations/um6p-sysops/ | image resources | Windows installation references |

## Routing Rules

- If the user is new to clusters, load Linux overview and Linux basic usage before scheduler details.
- If the user cannot log in or transfer files, load the login page before any execution workflow.
- If the blocker is package installation or missing runtime libraries, load `Linux Software Installation and Management` and the glibc page.
- If the user is transitioning from Windows to Linux, start from the Linux versus Windows comparison.

## Guardrails

- Package manager examples are distribution-specific and may not match `dnf`, `apt`, `zypper`, or site-managed module stacks.
- glibc replacement work is risky. Prefer isolated installs and local prefixes; never overwrite system libraries on shared clusters.
