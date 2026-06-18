# Setup

This project uses a split workflow: Antigravity edits the files locally on the host, while Node.js, npm, and the Next.js runtime stay inside a Docker container. That approach keeps the host machine cleaner, keeps the environment reproducible, and avoids relying on Antigravity's less stable remote container integration.

## Goal

The goal of the setup is to support a modern Next.js project with TypeScript, Tailwind CSS, Lucide React, and Framer Motion without installing the JavaScript toolchain directly on the host. The final arrangement is local editing on the host with containerized execution and dependency management inside Docker.

## Container configuration

### `.devcontainer/devcontainer.json`

```json
{
  "name": "antigravity-node-web",
  "build": {
    "dockerfile": "Dockerfile"
  },
  "workspaceFolder": "/workspace",
  "remoteUser": "root",
  "containerUser": "root",
  "customizations": {
    "vscode": {
      "extensions": [
        "dbaeumer.vscode-eslint",
        "esbenp.prettier-vscode",
        "ms-vscode.vscode-typescript-next"
      ],
      "settings": {
        "editor.formatOnSave": true,
        "files.eol": "\n",
        "terminal.integrated.defaultProfile.linux": "bash"
      }
    }
  },
  "postCreateCommand": "bash .devcontainer/post-create.sh",
  "forwardPorts": [3000]
}
```

Key points:
- The workspace root inside the container is `/workspace`.
- Both `remoteUser` and `containerUser` are set to `root` to avoid permission problems during setup.
- Port `3000` is forwarded for the Next.js development server.

### `.devcontainer/Dockerfile`

```Dockerfile
FROM mcr.microsoft.com/devcontainers/javascript-node:1-20-bookworm

WORKDIR /workspace

CMD ["sleep", "infinity"]
```

This image provides the containerized Node.js toolchain used by the project while keeping the container alive for repeated development use.

### `.devcontainer/post-create.sh`

```bash
#!/usr/bin/env bash
set -e
node -v
npm -v
```

This script validates that `node` and `npm` are available after the container is created.

## Application scaffolding

The Next.js application is created in the `web/` subfolder instead of the repository root. This separation avoids conflicts with `.devcontainer/` and other root-level files, which can cause `create-next-app` to refuse project creation in a non-empty directory.

```bash
cd /workspace/web
npx create-next-app@latest . --ts --tailwind --eslint --app --use-npm --import-alias "@/*"
```

## Additional packages

After scaffolding, the following packages were added:

```bash
npm install lucide-react framer-motion
```

These provide a React icon library and lightweight animation support for client components.

## Start the development server

```bash
npm run dev -- -H 0.0.0.0 -p 3000
```

Using `0.0.0.0` allows the app running in the container to be reached from the host at `http://localhost:3000`.
