# 1. Pull the official, unblocked n8n image from GitHub Packages
FROM ghcr.io/n8n-io/n8n:latest

# 2. Switch to the 'root' user so we have permission to install software
USER root

# 3. Install ffmpeg using Alpine Linux's package manager
RUN apk update && apk add --no-cache ffmpeg

# 4. Switch back to the 'node' user for security (required by n8n)
USER node
