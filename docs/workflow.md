# Workflow

The daily development workflow using this template.

## The development loop

1. **Start the container** from the system terminal — Docker Desktop must be running:
   ```bash
   docker compose -f .devcontainer/docker-compose.yml up -d
   ```
2. **Attach a shell** inside the container:
   ```bash
   docker exec -it devcontainer-app-1 bash
   ```
3. **Work from the container shell** — all package installs, builds, and dev server commands run here.
4. **Edit files with your editor** — the repository root is mounted into the container at `/workspace`, so changes are reflected immediately on both sides.
5. **Commit and push** — Git is available inside the container; commits are attributed normally.

## Key points

- All package installs, builds, and dev server commands run **inside the container**, not on the host.
- The repository root is the working directory. Project files live here alongside the template files.
- The host machine only needs Docker Desktop and an editor — no runtimes or package managers required.

## Container management

| Action | Command |
|---|---|
| Start container | `docker compose -f .devcontainer/docker-compose.yml up -d` |
| Attach a shell | `docker exec -it devcontainer-app-1 bash` |
| Stop and remove (with volumes) | `docker compose -f .devcontainer/docker-compose.yml down -v` |

## Git (inside the container shell)

```bash
git status
git add .
git commit -m "your message"
git push
```

## Adding a project

When using this template for a new project, initialise or clone the project at the repository root from inside the container shell. See [Setup](setup.md) for examples.

For stack-specific commands and tooling setup, see [Customization](customization.md).
