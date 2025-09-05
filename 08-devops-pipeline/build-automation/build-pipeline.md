# Build Automation Pipeline

## GitHub Actions Workflow

### CI Pipeline (Pull Requests)
name: CI Pipeline
on:
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: 18
      - run: npm ci
      - run: npm test
      - run: npm run lint
      - run: npm run build

### CD Pipeline (Main Branch)
name: CD Pipeline
on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Build and Deploy
        run: |
          docker build -t app:latest .
          docker push registry/app:latest
          kubectl apply -f k8s/

## Multi-Platform Builds
Docker Buildx: Multi-architecture images  
Target Platforms: linux/amd64, linux/arm64  
Registry: Multi-platform image push  
Optimization: Layer caching and parallel builds  

## Artifact Management
Container Registry: GitHub Container Registry  
Versioning: Git SHA + semantic tags  
Retention: 90-day artifact retention  
Security: Vulnerability scanning with Trivy  

---
Build Automation By: Amer Almohammaeed, 2025-09-03
