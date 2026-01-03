FROM n8nio/n8n:latest

# Create data directory and set correct permissions
USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod 750 /home/node/.n8n

WORKDIR /home/node

EXPOSE 5678

USER node
