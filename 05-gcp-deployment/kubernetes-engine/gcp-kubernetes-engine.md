# Google Kubernetes Engine Configuration

## Overview
Container orchestration for scalable microservices deployment.

**Project ID**: fleet-rite-XXXXXX-u1  
**Region**: europe-west3

## GKE Cluster
- **Name**: ecommerce-prod-cluster
- **Version**: Latest stable Kubernetes
- **Node Pool**: 3 nodes, e2-standard-2
- **Networking**: VPC-native with alias IPs

## Workload Configuration
- **Deployment**: ecommerce-app (3 replicas)
- **Service**: LoadBalancer type
- **Ingress**: HTTPS with managed certificates
- **HPA**: Horizontal Pod Autoscaling

---
**By**: AJ Almohammad, 2025-09-03
