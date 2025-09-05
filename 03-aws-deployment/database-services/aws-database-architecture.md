# AWS Database Services Architecture

## Overview
Highly available RDS MySQL architecture with automated backups and monitoring for production e-commerce workload.

**AWS Account**: XXXX-XXXX-5889 (masked for security)
**Region**: eu-central-1 (Frankfurt)

## Current Database Deployment Status (September 2025)

### Active RDS Instance ✅

#### Primary MySQL Database
- **Instance Identifier**: cloudmigratepro-mysql-db
- **Instance ID**: db-XXXXXXXXX (masked for security)
- **Engine**: MySQL 8.0.42
- **Instance Class**: db.t3.micro (1 vCPU, 1GB RAM)
- **Storage**: 20GB gp2 SSD (encrypted)
- **Multi-AZ**: Disabled (cost optimization)
- **Status**: AVAILABLE
- **Endpoint**: cloudmigratepro-mysql-db.XXXXXXXXX.eu-central-1.rds.amazonaws.com (masked)

#### Database Configuration
- **DB Subnet Group**: cloudmigratepro-db-subnet-group
- **VPC**: vpc-XXXXXXXXX (masked)
- **Subnets**: Private subnets across eu-central-1a, eu-central-1b
- **Security Group**: cloudmigratepro-db-server-sg
- **Port**: 3306 (MySQL default)
- **Parameter Group**: default.mysql8.0

### Deployment Summary
- **Database Engine**: MySQL 8.0.42 (latest stable)
- **High Availability**: Subnet group across multiple AZs
- **Security**: VPC isolation with security group controls
- **Backup**: 7-day automated backup retention
- **Encryption**: Storage encryption enabled

---

## RDS MySQL Configuration

### Production Database Instance
- **Engine**: MySQL 8.0.42 (current deployment)
- **Instance Class**: db.t3.micro (current) → db.t3.medium (planned scaling)
- **Storage**: 20GB gp2 SSD (current) → 100GB gp3 SSD (planned)
- **Multi-AZ**: Planned for production scaling
- **Subnet Group**: Database subnets (private)
- **Security Group**: Database access from app tier only

### Planned Scaling Strategy
- **Read Replica Count**: 2 instances (future implementation)
- **Instance Class**: db.t3.small (1 vCPU, 2GB RAM)
- **Placement**: Different AZ from primary
- **Purpose**: Read scaling and reporting queries

### Database Security
- **Encryption**: At rest enabled (KMS)
- **VPC**: Private database subnets only
- **Access**: Application security groups only
- **Port**: 3306 (MySQL default)
- **SSL**: Connection encryption supported

## Backup and Recovery

### Automated Backups (Current)
- **Retention Period**: 7 days
- **Backup Window**: 00:21-00:51 UTC (automated)
- **Point-in-time Recovery**: Enabled
- **Storage Backup Redundancy**: Geo-redundant

### Maintenance Configuration
- **Preferred Window**: wed:23:05-wed:23:35 UTC
- **Auto Minor Version**: Enabled
- **Deletion Protection**: Disabled (development environment)

## Performance Monitoring

### CloudWatch Integration
- **Database Insights**: Standard mode
- **Performance Insights**: Disabled (cost optimization)
- **Monitoring Interval**: Standard (60-second intervals)
- **Enhanced Monitoring**: Planned for production

### Planned Monitoring Enhancements
- **CPU Utilization**: Alert at >80%
- **Database Connections**: Monitor connection pool
- **Read/Write Latency**: Performance baselines
- **Free Storage Space**: Alert at <20%

## Database Connectivity

### Application Integration
- **Connection Method**: VPC internal DNS
- **Security Group**: cloudmigratepro-db-server-sg
- **Allowed Sources**: Web server security group only
- **Connection Pooling**: Application-level management

### Network Configuration
- **DB Subnet Group**: cloudmigratepro-db-subnet-group
- **Availability Zones**: eu-central-1a, eu-central-1b
- **Public Access**: Disabled (private subnets only)
- **VPC Security**: Network isolation from internet

---
**Database Architecture By**: AJ Almohammad  
**Deployment Date**: 2025-09-05  
**Status**: Production database operational  
**Achievement**: Secure, scalable MySQL deployment with automated backups