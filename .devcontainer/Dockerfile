FROM mcr.microsoft.com/devcontainers/javascript-node:1-20-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ca-certificates \
    curl \
    bash \
    procps \
    less \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

USER node
WORKDIR /workspace
