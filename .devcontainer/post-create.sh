#!/usr/bin/env bash
set -euo pipefail

mkdir -p /workspace/node_modules /home/node/.npm
chown -R node:node /workspace/node_modules /home/node/.npm /workspace

su -s /bin/bash node -c "cd /workspace && if [ -f package-lock.json ]; then npm ci; elif [ -f package.json ]; then npm install; fi"
