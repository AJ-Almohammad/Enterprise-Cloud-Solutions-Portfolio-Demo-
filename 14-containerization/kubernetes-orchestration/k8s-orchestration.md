# Kubernetes Orchestration

## GKE Cluster Configuration
**Project**: fleet-rite-470708-u1
**Region**: europe-west3

## Deployment Manifests
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ecommerce-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: ecommerce
  template:
    spec:
      containers:
      - name: app
        image: gcr.io/fleet-rite-470708-u1/ecommerce:latest
        ports:
        - containerPort: 3000

K8s Orchestration By: AJ Almohammad, 2025-09-03

