FROM node:20-bookworm-slim

# Install ffmpeg
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install n8n
RUN npm install -g n8n

# Create n8n data directory
RUN mkdir /home/node/.n8n && chown -R node:node /home/node

USER node

EXPOSE 5678

CMD ["n8n"]
