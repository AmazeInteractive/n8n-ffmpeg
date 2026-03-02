# ---------- Base ----------
FROM n8nio/n8n:1.86.1

USER root

# ---------- Install media + utility tools ----------
RUN apk add --no-cache \
    ffmpeg \
    bash \
    tini \
    curl \
    git \
    fontconfig \
    ttf-dejavu \
    imagemagick

# ---------- Improve FFmpeg performance ----------
# (Optional but recommended)
RUN mkdir -p /tmp/n8n-media

# ---------- Restore non-root user ----------
USER node

# ---------- Ensure proper init ----------
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
