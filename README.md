# N8N Automation Server

Este projeto configura um servidor N8N usando Docker para automação de workflows.

## Configuração Segura

### 1. Configure as variáveis de ambiente
```bash
# Copie o arquivo de exemplo
cp .env.example .env

# Edite o arquivo .env com suas credenciais
nano .env
```

### 2. Inicie o servidor

**Opção A: Docker Compose (Recomendado)**
```bash
docker-compose up -d
```

**Opção B: Docker build manual**
```bash
# Build da imagem
docker build -t n8n-server .

# Execute com variáveis de ambiente
docker run -d \
  --name n8n-server \
  -p 5678:5678 \
  -e N8N_BASIC_AUTH_ACTIVE=true \
  -e N8N_BASIC_AUTH_USER=seu_usuario \
  -e N8N_BASIC_AUTH_PASSWORD=sua_senha \
  -v n8n_data:/home/node/.n8n \
  n8n-server
```

### 3. Acesse o N8N
- URL: http://localhost:5678
- Usuário: conforme configurado no .env
- Senha: conforme configurado no .env

## Segurança

- ✅ Credenciais não são expostas no Dockerfile
- ✅ Use o arquivo .env para configurações sensíveis
- ✅ Volume persistente para dados dos workflows
- ✅ Usuário não-root no container

## Comandos Úteis

```bash
# Ver logs
docker-compose logs -f n8n

# Parar o serviço
docker-compose down

# Remover volumes (cuidado: apaga dados!)
docker-compose down -v
```

## Caso esqueça a senha utilize os comandos abaixao para resetar

```bash
# Reset no Node.js
n8n user-management:reset

# Reset no Docker (via Portainer)
n8n user-management:reset

# Reset no Docker Puro
docker exec -it <nome_do_container> n8n user-management:reset
docker restart <nome_do_container>
```
