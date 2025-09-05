# Google Compute Engine Configuration

## Overview
VM instances for application hosting with managed instance groups.

**Project ID**: fleet-rite-XXXXXX-u1  
**Region**: europe-west3

## Instance Template
- **Name**: ecommerce-app-template
- **Machine Type**: e2-medium (2 vCPU, 4GB RAM)
- **OS**: Ubuntu 22.04 LTS
- **Boot Disk**: 20GB SSD persistent disk

## Managed Instance Group
- **Name**: ecommerce-app-mig
- **Target Size**: 2–6 instances
- **Auto-scaling**: CPU utilization >70%
- **Health Check**: HTTP /health endpoint

---
**By**: AJ Almohammad, 2025-09-03
