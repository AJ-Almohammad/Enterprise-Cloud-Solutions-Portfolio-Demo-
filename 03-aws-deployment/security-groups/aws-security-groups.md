# AWS Security Groups Configuration

## Overview
Layered security group architecture implementing least privilege access for e-commerce application tiers.

**AWS Account**: XXXX-XXXX-5889
**Region**: eu-central-1 (Frankfurt)

## Web Tier Security Group

### ALB Security Group (ecommerce-alb-sg)
**Inbound Rules**:
- Port 80 (HTTP): XX.XXX.XXX.XXX/0 - Public web traffic
- Port 443 (HTTPS): XX.XXX.XXX.XXX/0 - Secure web traffic

**Outbound Rules**:
- Port 80: Application tier security group
- Port 443: Application tier security group

## Application Tier Security Group

### App Server Security Group (ecommerce-app-sg)
**Inbound Rules**:
- Port 80: ALB security group only
- Port 443: ALB security group only
- Port 22: Bastion host security group (SSH access)

**Outbound Rules**:
- Port 3306: Database security group (MySQL)
- Port 80: XX.XXX.XXX.XXX/0 (package updates, external APIs)
- Port 443: XX.XXX.XXX.XXX/0 (secure external connections)

## Database Tier Security Group

### RDS Security Group (ecommerce-db-sg)
**Inbound Rules**:
- Port 3306: Application tier security group only

**Outbound Rules**:
- None (database servers do not initiate outbound connections)

## Management Access Security Group

### Bastion Host Security Group (ecommerce-bastion-sg)
**Inbound Rules**:
- Port 22: Your public IP only (administrative access)

**Outbound Rules**:
- Port 22: Application tier security group
- Port 3306: Database security group (for database administration)

## Security Group Rules Matrix

| Source | Destination | Port | Purpose |
|--------|-------------|------|---------|
| Internet (XX.XXX.XXX.XXX/0) | ALB SG | 80, 443 | Web traffic |
| ALB SG | App SG | 80, 443 | Load balancer to apps |
| Bastion SG | App SG | 22 | SSH administration |
| App SG | DB SG | 3306 | Database connections |
| Admin IP | Bastion SG | 22 | Remote administration |

## Best Practices Implementation

### Principle of Least Privilege
- No direct internet access to application or database tiers
- SSH access only through bastion host
- Database accessible only from application tier

### Defense in Depth
- Multiple security group layers
- Network ACLs as backup (if needed)
- VPC Flow Logs for monitoring

### Access Logging
- VPC Flow Logs capture all traffic
- CloudTrail logs security group changes
- CloudWatch alerts for unusual patterns

---
**Security Configuration By**: AJ Almohammad
**Date**: 2025-09-03

