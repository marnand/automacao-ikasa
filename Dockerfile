FROM n8nio/n8n:latest

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV WEBHOOK_URL=http://n8n:5678/
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_HOST=host.docker.internal
ENV GENERIC_TIMEZONE=America/Sao_Paulo

# Create data directory and set correct permissions
USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod 750 /home/node/.n8n

WORKDIR /home/node

EXPOSE 5678

USER node
