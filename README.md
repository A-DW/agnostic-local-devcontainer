# Agnostic-Local-DevContainer

A language-agnostic Dev Container template for isolated, reproducible, and convenient local development.

## What it is

This repository provides a reusable local development environment built on [Dev Containers](https://containers.dev/). It is not a starter app or framework scaffold. The container setup is the product — a consistent, isolated workspace that can host any project regardless of language or framework.

Project files for any given use case live directly at the repository root alongside `.devcontainer/` and `docs/`.

## Why use it

- **Isolated** — dependencies, runtimes, and tooling live inside the container, not on the host machine
- **Reproducible** — every team member and machine gets the same environment
- **Secure** — experimentation happens inside a sandboxed container, not against the host system
- **Convenient** — start the container with one command and attach a shell

## Repository structure

```text
.
├── .devcontainer/          # Dev Container configuration
│   ├── devcontainer.json
│   ├── docker-compose.yml
│   ├── Dockerfile
│   └── post-create.sh
├── docs/                   # Documentation
├── .gitignore              # Multi-stack baseline (Node, Next, Vite, Python)
└── README.md
```

When this template is used for a real project, that project's files are added directly at the root.

## Getting started

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (running)
- A terminal
- Any editor — [VS Code](https://code.visualstudio.com/) is recommended

No language runtimes, package managers, or project-specific tools need to be installed on the host. Everything runs inside the container.

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/A-DW/agnostic-local-devcontainer.git
   cd agnostic-local-devcontainer
   ```

2. Start the container:
   ```bash
   docker compose -f .devcontainer/docker-compose.yml up -d
   ```

3. Attach a shell inside the container:
   ```bash
   docker exec -it devcontainer-app-1 bash
   ```

4. Add or initialise your project files at the repository root from inside the container shell.

5. To stop and remove the container and its volumes (full reset):
   ```bash
   docker compose -f .devcontainer/docker-compose.yml down -v
   ```

## Documentation

| Page | Description |
|---|---|
| [Setup](docs/setup.md) | Prerequisites, container setup, and first steps |
| [Workflow](docs/workflow.md) | Daily development workflow inside the container |
| [Customization](docs/customization.md) | Adapting the environment for Node, Next, Vite, or Python |
| [Structure](docs/structure.md) | Repository layout and file purposes |
| [Troubleshooting](docs/troubleshooting.md) | Common issues and resolutions |

## License

[GPL-3.0](LICENSE)
