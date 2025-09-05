# Google Cloud VPC Network Architecture

## Overview
VPC design for e-commerce application in europe-west3 (Frankfurt) region.

**Project ID**: fleet-rite-XXXXXX-u1  
**Region**: europe-west3 (Frankfurt)

## VPC Configuration
- **Name**: ecommerce-prod-vpc
- **Subnet Mode**: Custom
- **Global Dynamic Routing**: Regional

## Subnets
- **Web Subnet**: XXX.XXX.XXX.XXX/24 (europe-west3-a)
- **App Subnet**: XXX.XXX.XXX.XXX/24 (europe-west3-b)
- **Database Subnet**: XXX.XXX.XXX.XXX/24 (europe-west3-c)

## Firewall Rules
- **Allow HTTP/HTTPS**: Web tier from internet
- **Allow SSH**: Bastion host access
- **Allow Internal**: Inter-subnet communication

---
**By**: AJ Almohammad, 2025-09-03
