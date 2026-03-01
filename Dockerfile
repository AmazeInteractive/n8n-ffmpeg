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

# ---------- Create n8n user ----------
RUN useradd -m -s /bin/bash node

# ---------- Prepare n8n directory ----------
RUN mkdir -p /home/node/.n8n \
    && chown -R node:node /home/node

USER node

# ---------- Expose Port ----------
EXPOSE 5678

# ---------- Use tini for proper signal handling ----------
ENTRYPOINT ["/usr/bin/tini", "--"]

# ---------- Start n8n ----------
CMD ["n8n"]
