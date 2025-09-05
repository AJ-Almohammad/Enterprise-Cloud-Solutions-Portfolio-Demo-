# Azure Application Gateway Configuration

## Overview
Layer 7 load balancer with WAF protection and SSL termination.

**Subscription**: ********-****-****-****-************  
**Region**: Germany North

## Application Gateway Setup
- **Name**: agw-ecommerce-prod
- **SKU**: WAF_v2
- **Capacity**: Auto-scaling (2–10 instances)
- **Public IP**: Static IP address

## Listeners and Rules
- **HTTPS Listener**: Port 443 with SSL certificate
- **HTTP Listener**: Port 80 redirect to HTTPS
- **Backend Pools**: App Service backend targets

## Web Application Firewall
- **Mode**: Prevention
- **Rule Set**: OWASP 3.2
- **Custom Rules**: Rate limiting and geo-blocking

---
**By**: AJ Almohammad, 2025-09-03


