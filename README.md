# Risk-Free Next.js

A Next.js website project developed with Antigravity locally and Node.js/npm isolated inside Docker.

## Overview

This repository contains a website project built with Next.js, React, Tailwind CSS, Lucide React, and Framer Motion. It also documents the development workflow used to edit files locally while keeping the JavaScript runtime and package management inside a Docker container.

The current environment has been validated with a working development server and a test page rendered successfully in the browser.

## Why this setup

This repository uses a split development model:

- Antigravity is used locally to edit project files.
- Docker contains Node.js, npm, and the application runtime.
- The website project lives in the `web/` subfolder.
- The host machine does not need a local npm installation for day-to-day development.

This approach keeps the host environment clean while preserving a practical and reproducible workflow.

## Tech stack

- Next.js
- React
- Tailwind CSS
- Lucide React
- Framer Motion
- Docker
- Antigravity

## Repository structure

```text
.
├── .devcontainer/          # Dev Container configuration
│   ├── devcontainer.json
│   ├── Dockerfile
│   └── post-create.sh
├── docs/                   # Setup notes and troubleshooting
├── web/                    # Next.js application
│   ├── app/
│   ├── public/
│   ├── package.json
│   ├── tsconfig.json
│   ├── next.config.ts
│   └── ...
├── .gitignore
└── README.md
```

The main application code lives in `web/`, while repository-level configuration and supporting documentation stay at the top level.

## Prerequisites

Before working on this project, make sure the following are available:

- Docker installed and running
- Antigravity installed locally
- Access to the project repository on the host machine
- A browser available to open `http://localhost:3000`

## Quick start

1. Open the project locally in Antigravity:

   ```text
   ~/Development/CodingTest/web
   ```

2. Enter the running development container:

   ```bash
   docker exec -it <container-name> bash
   ```

3. Go to the project directory inside the container:

   ```bash
   cd /workspace/web
   ```

4. Start the development server:

   ```bash
   npm run dev -- -H 0.0.0.0 -p 3000
   ```

5. Open the application in the browser:

   ```text
   http://localhost:3000
   ```

## Development workflow

Use Antigravity locally to edit files in the `web/` folder. Run Node.js and npm commands from inside the Docker container. View the running application in the browser through the mapped local port.

In practice, this means:

- Edit locally.
- Run commands in the container.
- Validate changes in the browser.

## Troubleshooting

- If Antigravity cannot attach to the container, continue editing locally and run commands with `docker exec`.
- If `create-next-app` conflicts with root-level files, create the application inside the `web/` subfolder.
- If `npm audit` shows moderate vulnerabilities after installation, avoid using `npm audit fix --force` blindly.

## Documentation

Additional project documentation is available in the repository documentation files, including setup notes, Docker and Dev Container configuration, troubleshooting details, and file-level explanations of the initial environment.

## Status

The development environment is working and has been validated with a running Next.js application. The project is currently in the base setup stage, with UI and page development continuing from this foundation.
