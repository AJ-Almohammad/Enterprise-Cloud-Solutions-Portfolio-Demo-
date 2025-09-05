# AWS Compute Services Architecture

## Overview
Scalable compute architecture for e-commerce application using EC2, Auto Scaling, and container services in eu-central-1.

**AWS Account**: XXXX-XXXX-5889 (masked for security)
**Region**: eu-central-1 (Frankfurt)

## Current Deployment Status (September 2025)

### Active EC2 Instances ✅

#### Instance #1: E-commerce Application VM
- **Instance ID**: i-XXXXXXXXX (masked for security)
- **Instance Type**: t3.micro
- **State**: RUNNING
- **Public IP**: XX.XXX.X.XX (masked for security)
- **Name**: ecommerce-aws-vm
- **Purpose**: Primary e-commerce application

#### Instance #2: Auto-Scaled Instance A
- **Instance ID**: i-XXXXXXXXX (masked for security)
- **Instance Type**: t3.micro
- **State**: RUNNING
- **Public IP**: None (private subnet)
- **Name**: cloudmigratepro-auto-instance
- **Purpose**: Auto Scaling Group member

#### Instance #3: Auto-Scaled Instance B
- **Instance ID**: i-XXXXXXXXX (masked for security)
- **Instance Type**: t3.micro
- **State**: RUNNING
- **Public IP**: XX.XXX.XXX.XXX (masked for security)
- **Name**: cloudmigratepro-auto-instance
- **Purpose**: Auto Scaling Group member

### Deployment Summary
- **Total Running Instances**: 3
- **Auto-Scaled Instances**: 2 (managed by ASG)
- **Manual Instances**: 1 (original deployment)
- **Instance Types**: t3.micro (cost-optimized)
- **High Availability**: Multi-AZ deployment

---

## EC2 Instance Strategy

### Production Application Servers
**Instance Type**: t3.micro (1 vCPU, 1GB RAM) - Current deployment
**Planned**: t3.medium (2 vCPU, 4GB RAM) - Future scaling
**AMI**: Amazon Linux 2023
**Storage**: 20GB gp3 SSD
**Placement**: Private subnets across multiple AZs
**Auto Scaling**: 1-3 instances based on demand

### Web Tier Configuration
- **Security Groups**: HTTP/HTTPS from ALB only
- **Instance Profile**: EC2 role with CloudWatch, S3 access
- **User Data**: Automated application deployment
- **Monitoring**: CloudWatch detailed monitoring enabled

### Database Connection
- **RDS Endpoint**: Internal DNS resolution
- **Connection Pooling**: Application-level pooling
- **Security**: Database security group access only

## Auto Scaling Configuration

### Launch Template
- **Name**: cloudmigratepro-launch-template
- **Template ID**: lt-XXXXXXXXX (masked for security)
- **Instance Type**: t3.micro
- **Security Groups**: Application tier SG
- **IAM Role**: EC2-CloudWatch-S3-Role
- **Key Pair**: MASKED (security policy)

### Auto Scaling Group
- **Name**: cloudmigratepro-asg
- **Min Size**: 1 instance
- **Desired**: 2 instances
- **Max Size**: 3 instances
- **Target Group**: ALB target group attachment
- **Health Checks**: ELB + EC2 health checks
- **Status**: ACTIVE with 2 running instances

### Scaling Policies
- **Scale Out**: CPU > 70% for 5 minutes
- **Scale In**: CPU < 30% for 10 minutes
- **Cooldown**: 300 seconds

## Load Balancer Integration

### Application Load Balancer
- **Name**: cloudmigratepro-alb
- **DNS**: cloudmigratepro-alb-XXXXXXXXX.eu-central-1.elb.amazonaws.com (masked)
- **Scheme**: Internet-facing
- **Subnets**: Public subnets in multiple AZs
- **Security Group**: HTTP/HTTPS from internet
- **Target Group**: EC2 instances health check
- **Status**: ACTIVE

### Health Check Configuration
- **Protocol**: HTTP
- **Path**: /health
- **Interval**: 30 seconds
- **Timeout**: 5 seconds
- **Healthy Threshold**: 2
- **Unhealthy Threshold**: 3

## Security Considerations
- Private SSH keys managed through AWS Systems Manager
- Instance access via Session Manager (no direct SSH)
- Security groups configured for least privilege access
- CloudWatch monitoring enabled for all instances

---
**Compute Architecture By**: AJ Almohammad
**Date**: 2025-09-05
**Status**: Production deployment operational