FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine

# Install gcsfuse and dependencies
RUN apk --no-cache add fuse && \
    curl -sSL https://github.com/GoogleCloudPlatform/gcsfuse/releases/download/v0.38.0/gcsfuse-v0.38.0-linux-amd64 -o /usr/local/bin/gcsfuse && \
    chmod +x /usr/local/bin/gcsfuse

# Default command to mount GCS bucket and run your application
CMD ["/bin/sh", "-c", "gcsfuse ${BUCKET_NAME} /mnt/shared && /your-application-command"]
