# Repository structure

This page describes the permanent layout of the `agnostic-local-devcontainer` template and explains where project files belong.

## Permanent template files

```text
.
├── .devcontainer/          # Dev Container configuration
│   ├── devcontainer.json   # Container features, settings, and extensions
│   ├── Dockerfile          # Base image and installed tools
│   └── post-create.sh      # One-time setup commands run after container creation
├── docs/                   # Documentation
│   ├── README.md           # Docs index
│   ├── setup.md            # Prerequisites and container setup
│   ├── workflow.md         # Daily development workflow
│   ├── customization.md    # Adapting the environment for different stacks
│   ├── structure.md        # This file
│   └── troubleshooting.md  # Common issues and resolutions
├── .gitignore              # Multi-stack baseline (Node, Next, Vite, Python)
└── README.md               # Repository overview
```

## Where project files live

When this template is used for a real project, that project's files are added directly at the **repository root**, alongside the template files above. There is no `web/`, `workspace/`, `app/`, or other subdirectory abstraction.

For example, a Next.js project would add:

```text
.
├── .devcontainer/
├── docs/
├── app/                    # Next.js app directory
├── public/
├── package.json
├── tsconfig.json
├── next.config.ts
├── .gitignore
└── README.md
```

And a Python project would add:

```text
.
├── .devcontainer/
├── docs/
├── src/                    # Python source
├── tests/
├── requirements.txt
├── .gitignore
└── README.md
```

This keeps the container configuration and project files in one unified workspace, which is the standard Dev Container model.

## .devcontainer/ in detail

| File | Purpose |
|---|---|
| `devcontainer.json` | Declares the container image, features, VS Code extensions, settings, and lifecycle commands |
| `Dockerfile` | Defines the container image — base OS, installed runtimes, and tools |
| `post-create.sh` | Shell script that runs once when the container is first created — used for dependency installs and environment setup |

See [Customization](customization.md) to adapt these files for a specific stack.
