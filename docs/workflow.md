# Workflow

The recommended daily workflow is to edit files locally in Antigravity and run Node.js commands from inside the Docker container. Splitting editing from execution like this is easier to reason about and keeps the runtime environment isolated from the host machine.

## Daily process

1. Make sure the development container is running.
2. Open `~/Development/CodingTest/web` locally in Antigravity.
3. Enter the running container.
4. Change into `/workspace/web`.
5. Run the Next.js development server.
6. Validate changes in the browser at `http://localhost:3000`.

## Main commands

Enter the running container:

```bash
docker exec -it codingtest_devcontainer-app-1 bash
```

Go to the project directory:

```bash
cd /workspace/web
```

Start the development server:

```bash
npm run dev -- -H 0.0.0.0 -p 3000
```

Install additional packages when needed:

```bash
npm install <package-name>
```

## Validation step

A simple client component was used during setup to confirm that Next.js, Tailwind CSS, Lucide React, and Framer Motion were all working together correctly. The test component used `"use client"`, a Lucide icon, and a Framer Motion animation block, which confirmed that the base environment was ready for page development.
