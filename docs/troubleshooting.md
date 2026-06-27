# Troubleshooting

Common issues when setting up or using the Dev Container, and how to resolve them.

## Docker is not running

**Symptom:** VS Code shows an error like `Cannot connect to Docker daemon` or the Reopen in Container prompt does not appear.

**Resolution:** Start Docker Desktop and wait until the Docker icon in the system tray shows it is running. Then try reopening in the container.

## Container fails to build

**Symptom:** The container build fails with an error during the image build step.

**Resolution:**
1. Open the build log in VS Code (`Show Log` in the notification).
2. Identify the failing step in the `Dockerfile` or `devcontainer.json`.
3. Fix the error, then run **Dev Containers: Rebuild Container**.

Common causes: a `RUN` command in the `Dockerfile` fails due to a missing package name or network issue during build.

## Container opens but tools are missing

**Symptom:** The container opens but expected tools (e.g. Node, Python, Git) are not available in the terminal.

**Resolution:** The tool is likely not installed in the container image. Add it to the `Dockerfile` or via a feature in `devcontainer.json`. See [Customization](customization.md). After making changes, run **Dev Containers: Rebuild Container**.

## post-create.sh did not run

**Symptom:** Dependencies were not installed or setup commands did not execute after the container was created.

**Resolution:**
1. Confirm `post-create.sh` is referenced in `devcontainer.json` under `postCreateCommand`.
2. Confirm the script has execute permissions: `chmod +x .devcontainer/post-create.sh`.
3. Run **Dev Containers: Rebuild Container** to trigger the script again from a fresh container state.

## Changes to devcontainer.json or Dockerfile are not reflected

**Symptom:** After editing container configuration files, the environment still behaves as before.

**Resolution:** Reopening the container reuses the existing image. To apply configuration changes, a rebuild is required:
```
Dev Containers: Rebuild Container
```

## File permission issues inside the container

**Symptom:** Commands fail with `Permission denied` errors on files in the repository root.

**Resolution:** This usually means the container user does not own the mounted files. Check the `Dockerfile` for the user configuration, or add a `postCreateCommand` in `devcontainer.json` to fix ownership:
```bash
sudo chown -R $(whoami) /workspaces/agnostic-local-devcontainer
```

## Port not accessible on the host

**Symptom:** A dev server running inside the container is not reachable in the host browser.

**Resolution:** Ensure the port is forwarded. VS Code usually auto-forwards ports when a server starts. If not, open the **Ports** panel in VS Code (`Cmd/Ctrl+Shift+P` → `Focus on Ports View`) and add the port manually.
