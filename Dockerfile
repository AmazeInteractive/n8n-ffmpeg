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

# ---------- Restore non-root user ----------
USER node

ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
