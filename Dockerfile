FROM node:18-bookworm-slim

# Install ffmpeg
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Install n8n
RUN npm install -g n8n

# Create n8n user
RUN useradd -m node
USER node

EXPOSE 5678

CMD ["n8n"]
