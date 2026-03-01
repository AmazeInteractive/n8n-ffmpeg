# ---------- Base ----------
FROM node:20-bookworm-slim

# ---------- System Dependencies ----------
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ffmpeg \
        ca-certificates \
        openssl \
        tini \
    && rm -rf /var/lib/apt/lists/*

# ---------- Install n8n ----------
RUN npm install -g n8n

# ---------- Prepare n8n directory ----------
RUN mkdir -p /home/node/.n8n \
    && chown -R node:node /home/node

USER node

EXPOSE 5678

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["n8n"]
