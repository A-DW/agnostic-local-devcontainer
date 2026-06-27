# Setup

This page covers everything needed to get the Dev Container running on a new machine.

## Prerequisites

Install the following on the **host machine** before starting the container:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) — must be running before starting the container
- A terminal
- Any editor — [VS Code](https://code.visualstudio.com/) is recommended but not required

No language runtimes, package managers, or project-specific tools need to be installed on the host. Everything runs inside the container.

## Starting the container

1. Clone the repository:
   ```bash
   git clone https://github.com/A-DW/agnostic-local-devcontainer.git
   cd agnostic-local-devcontainer
   ```

2. Start the container in the background:
   ```bash
   docker compose -f .devcontainer/docker-compose.yml up -d
   ```

   The container image will build on the first run. This takes a few minutes. Subsequent starts are fast.

3. Attach a shell inside the running container:
   ```bash
   docker exec -it devcontainer-app-1 bash
   ```

   The shell opens at `/workspace`, which maps to the repository root on the host.

## Confirming the environment

After attaching a shell, verify the environment:

```bash
# Confirm you are inside the container as the expected user
whoami

# Confirm Git is available
git --version

# Confirm Node.js is available
node --version
npm --version
```

The exact tools available depend on the container image defined in `.devcontainer/Dockerfile`.

## Starting a project

Add or initialise your project files directly at the repository root from inside the container shell. For example:

```bash
# Next.js
npx create-next-app@latest .

# Vite
npm create vite@latest .

# Clone an existing project into the root
git clone <project-url> .
```

Project files coexist at the root alongside `.devcontainer/`, `docs/`, `.gitignore`, and `README.md`.

## Stopping and resetting the container

To stop the container and remove it along with its volumes (full reset):

```bash
docker compose -f .devcontainer/docker-compose.yml down -v
```

Then run `up -d` again to start fresh. This is also the correct step after changing `Dockerfile`, `docker-compose.yml`, or `devcontainer.json`.

See [Troubleshooting](troubleshooting.md) if the build or startup fails.
