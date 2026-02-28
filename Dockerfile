# We use the 'debian' based version of n8n because it has 'apt' built-in.
# This avoids the complex 'apk' copy process that crashed your RAM.
FROM n8nio/n8n:latest-debian

USER root

# Install ffmpeg using the standard Debian package manager
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

USER node
