# 1. Grab a temporary image that has the 'apk' package manager
FROM alpine:latest AS alpine_tools

# 2. Use the official n8n image as the actual base
FROM ghcr.io/n8n-io/n8n:latest

# 3. Copy the package manager and its necessary files into the n8n image
COPY --from=alpine_tools /sbin/apk /sbin/apk
COPY --from=alpine_tools /usr/lib/libapk.so* /usr/lib/
COPY --from=alpine_tools /etc/apk /etc/apk

# 4. Switch to 'root' to perform the installation
USER root

# 5. Now 'apk' will work! Install ffmpeg
RUN apk update && apk add --no-cache ffmpeg

# 6. Switch back to the 'node' user for security (required by n8n)
USER node
