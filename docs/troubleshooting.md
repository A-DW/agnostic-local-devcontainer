# Troubleshooting

Common issues when setting up or using the Dev Container, and how to resolve them.

## Docker is not running

**Symptom:** Running `docker compose up` fails with `Cannot connect to Docker daemon` or a similar error.

**Resolution:** Start Docker Desktop and wait until the Docker icon in the system tray shows it is running. Then try again.

## Container fails to build

**Symptom:** `docker compose up -d` fails with an error during the image build step.

**Resolution:**
1. Read the error output in the terminal.
2. Identify the failing step in `Dockerfile` or `docker-compose.yml`.
3. Fix the error, then run a full reset:
   ```bash
   docker compose -f .devcontainer/docker-compose.yml down -v
   docker compose -f .devcontainer/docker-compose.yml up -d
   ```

Common causes: a `RUN` command in the `Dockerfile` fails due to a missing package name or a network issue during build.

## Container starts but tools are missing

**Symptom:** The container starts but expected tools (e.g. Node, Git) are not available in the shell.

**Resolution:** The tool is likely not installed in the container image. Add it to the `Dockerfile`, then reset and rebuild:
```bash
docker compose -f .devcontainer/docker-compose.yml down -v
docker compose -f .devcontainer/docker-compose.yml up -d
```

See [Customization](customization.md) for examples.

## post-create.sh did not run

**Symptom:** Dependencies were not installed or setup commands did not execute after the container was created.

**Resolution:**
1. Confirm `post-create.sh` is referenced in `devcontainer.json` under `postCreateCommand`.
2. Confirm the script is executable: `chmod +x .devcontainer/post-create.sh`.
3. Reset and rebuild the container:
   ```bash
   docker compose -f .devcontainer/docker-compose.yml down -v
   docker compose -f .devcontainer/docker-compose.yml up -d
   ```

## Changes to Dockerfile or docker-compose.yml are not reflected

**Symptom:** After editing container configuration files, the environment still behaves as before.

**Resolution:** The running container uses a cached image. To apply changes, reset and rebuild:
```bash
docker compose -f .devcontainer/docker-compose.yml down -v
docker compose -f .devcontainer/docker-compose.yml up -d
```

## File permission issues inside the container

**Symptom:** Commands fail with `Permission denied` errors on files or directories inside `/workspace`.

**Resolution:** This usually means a named volume (e.g. `node_modules`) was initialised as root-owned before the ownership fix could apply. Reset and rebuild the container to recreate volumes cleanly:
```bash
docker compose -f .devcontainer/docker-compose.yml down -v
docker compose -f .devcontainer/docker-compose.yml up -d
```

The container is configured to start as root and repair ownership on named volumes before switching to the `node` user, so a clean rebuild resolves this reliably.

## Port not accessible on the host

**Symptom:** A dev server running inside the container is not reachable in the host browser.

**Resolution:** Ensure the port is declared in `docker-compose.yml` under `ports`. If it is already there, confirm the dev server is binding to `0.0.0.0` (not `127.0.0.1`) inside the container, otherwise it will not be reachable from the host.
