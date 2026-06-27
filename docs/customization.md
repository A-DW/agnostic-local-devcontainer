# Customization

The Dev Container configuration can be adapted to any project stack. This page covers common adjustments for Node.js, Next.js, Vite, and Python.

## Where to make changes

All environment configuration lives in `.devcontainer/`:

```text
.devcontainer/
├── devcontainer.json      # Container settings, extensions, and lifecycle commands
├── docker-compose.yml     # Service definition, volumes, ports, and environment
├── Dockerfile             # Base image and installed tools
└── post-create.sh         # Commands that run once after the container is created
```

## Node.js / Next.js / Vite

### Install Node.js in the container

Use a Node.js base image directly in `Dockerfile`:

```dockerfile
FROM mcr.microsoft.com/devcontainers/javascript-node:1-20-bookworm
```

Or install via the package manager:

```dockerfile
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
  && apt-get install -y nodejs
```

### Auto-install dependencies on container create

In `post-create.sh`:

```bash
if [ -f package-lock.json ]; then
  npm ci
elif [ -f package.json ]; then
  npm install
fi
```

### Useful VS Code extensions for Node/Next/Vite

Add to `devcontainer.json` under `customizations.vscode.extensions`:

```json
"dbaeumer.vscode-eslint",
"esbenp.prettier-vscode",
"bradlc.vscode-tailwindcss"
```

## Python

### Install Python in the container

In `Dockerfile`:

```dockerfile
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv
```

### Auto-create a virtual environment

In `post-create.sh`:

```bash
if [ -f requirements.txt ]; then
  python3 -m venv .venv
  source .venv/bin/activate
  pip install -r requirements.txt
fi
```

### Useful VS Code extensions for Python

```json
"ms-python.python",
"ms-python.pylance",
"ms-python.black-formatter"
```

## General tips

- **After any change to `Dockerfile`, `docker-compose.yml`, or `devcontainer.json`**, reset and rebuild the container:
  ```bash
  docker compose -f .devcontainer/docker-compose.yml down -v
  docker compose -f .devcontainer/docker-compose.yml up -d
  ```
- **`post-create.sh`** is the right place for one-time setup commands that should run automatically after the container is created.
- **VS Code extensions** declared in `devcontainer.json` apply when opening the container via the Dev Containers integration. They do not affect the host VS Code installation.
- The `.gitignore` at the root is a multi-stack baseline. Review and extend it for your specific project.
