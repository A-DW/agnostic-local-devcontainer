# Setup

This page covers everything needed to get the Dev Container running on a new machine.

## Prerequisites

Install the following tools on the **host machine** before opening the container:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) — must be running before opening the container
- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) (`ms-vscode-remote.remote-containers`)

No language runtimes, package managers, or project-specific tools need to be installed on the host. Everything runs inside the container.

## Opening the container

1. Clone the repository:
   ```bash
   git clone https://github.com/A-DW/agnostic-local-devcontainer.git
   cd agnostic-local-devcontainer
   ```

2. Open the folder in VS Code:
   ```bash
   code .
   ```

3. VS Code will detect the `.devcontainer/` folder and prompt **Reopen in Container**. Click it.

   Alternatively, open the Command Palette (`Cmd/Ctrl+Shift+P`) and run:
   ```
   Dev Containers: Reopen in Container
   ```

4. The container image will build on first run. This takes a few minutes. Subsequent opens are fast.

5. Once the container is open, the integrated terminal is running **inside** the container. The host filesystem is mounted at the repository root.

## Confirming the environment

After the container opens, verify the environment from the terminal:

```bash
# Confirm Docker is accessible from inside the container (if Docker-in-Docker is configured)
docker --version

# Confirm Git is available
git --version

# Confirm Node.js is available (if installed in the container)
node --version

# Confirm Python is available (if installed in the container)
python3 --version
```

The exact tools available depend on the container image defined in `.devcontainer/Dockerfile`.

## Starting a project

Add or initialise your project files directly at the repository root. For example:

```bash
# Next.js
npx create-next-app@latest .

# Vite
npm create vite@latest .

# Python
python3 -m venv .venv && source .venv/bin/activate

# Clone an existing project into the root
git clone <project-url> .
```

Project files coexist at the root alongside `.devcontainer/`, `docs/`, `.gitignore`, and `README.md`.

## Rebuilding the container

If the container configuration changes (e.g. `Dockerfile` or `devcontainer.json` is updated), rebuild it:

```
Dev Containers: Rebuild Container
```

See [Troubleshooting](troubleshooting.md) if the build or reopen fails.
