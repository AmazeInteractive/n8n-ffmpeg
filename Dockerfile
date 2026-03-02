FROM n8nio/n8n:1.121.0

USER root
RUN apk add --no-cache ffmpeg bash tini fontconfig ttf-dejavu imagemagick
USER node

ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
