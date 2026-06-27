# Workflow

The daily development workflow using this template.

## The development loop

1. **Open the repo in VS Code** — Docker Desktop must be running.
2. **Reopen in Container** — VS Code reconnects to the existing container or starts it.
3. **Work from the integrated terminal** — all commands run inside the container.
4. **Edit files normally** — the repository root is mounted into the container, so changes are reflected immediately on both sides.
5. **Commit and push** — Git is available inside the container; commits are attributed normally.

## Key points

- All package installs, builds, and dev server commands run **inside the container**, not on the host.
- The repository root is the working directory. Project files live here alongside the template files.
- The host machine only needs Docker Desktop and VS Code — no runtimes or package managers required.

## Common commands

### Container management

| Action | Command Palette entry |
|---|---|
| Open in container | `Dev Containers: Reopen in Container` |
| Rebuild container | `Dev Containers: Rebuild Container` |
| Open new terminal inside container | `Terminal: New Terminal` |

### Git (inside container)

```bash
git status
git add .
git commit -m "your message"
git push
```

## Adding a project

When using this template for a new project, initialise or clone the project at the repository root from inside the container terminal. See [Setup](setup.md) for examples.

For stack-specific commands and tooling setup, see [Customization](customization.md).
