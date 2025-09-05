Set-Location "..\containerization"
Write-Output '# Containerization Strategy

## Docker Implementation

### Base Images
- **Node.js Services**: node:18-alpine
- **Database**: Official PostgreSQL, MongoDB images
- **Reverse Proxy**: nginx:alpine
- **Message Queue**: confluentinc/cp-kafka

### Dockerfile Best Practices
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 3000
USER node
CMD ["node", "server.js"]

---
**Container Strategy By: AJ Almohammad, 2025-09-03