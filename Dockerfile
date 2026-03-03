FROM n8nio/n8n:1.121.0

USER root

# Install system tools needed for your pipeline
RUN apk add --no-cache \
    ffmpeg \
    bash \
    tini \
    fontconfig \
    ttf-dejavu \
    imagemagick

USER node

EXPOSE 5678
