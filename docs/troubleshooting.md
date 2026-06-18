# Troubleshooting

This page documents the main issues encountered during the initial environment setup and the resolutions that proved practical. Keeping troubleshooting notes in a dedicated page is a common documentation pattern because it separates recurring support knowledge from installation or usage instructions.

## `create-next-app` conflict at the repository root

### Problem

Creating the application directly in `/workspace` failed because `create-next-app` detected conflicting existing content such as `.devcontainer/` and `node_modules/`.

### Resolution

Keep `.devcontainer/` at the repository root and create the Next.js application inside a dedicated `web/` subfolder instead.

## Antigravity remote attach instability

### Problem

The container itself was working, but Antigravity's remote connection to the running container was unstable during attach attempts.

### Resolution

Use Antigravity locally on the bind-mounted files and use `docker exec` to run commands in the container. This produced a simpler and more reliable workflow.

## Permission issues with the container user

### Problem

Using the `node` user during Dev Container setup caused permission errors during `chown` operations on temporary setup files.

### Resolution

Set both `remoteUser` and `containerUser` to `root` in `.devcontainer/devcontainer.json`.

## Moderate `npm audit` warnings

### Problem

Moderate vulnerability warnings appeared in transitive dependencies during the initial installation process.

### Resolution

Do not apply `npm audit fix --force` blindly during early setup. The project was allowed to proceed because the warnings did not block execution, and force-fixing JavaScript dependency trees can introduce unwanted breaking changes.
