# AWS Load Balancer Configuration

## Overview
Application Load Balancer setup for high availability and traffic distribution across multiple availability zones.

**AWS Account**: XXXX-XXXX-5889
**Region**: eu-central-1 (Frankfurt)

## Application Load Balancer Setup

### ALB Configuration
- **Name**: ecommerce-prod-alb
- **Scheme**: Internet-facing
- **IP Address Type**: IPv4
- **Subnets**: Public subnets in eu-central-1a, 1b, 1c
- **Security Groups**: ecommerce-alb-sg

### Listeners Configuration
**HTTP Listener (Port 80)**:
- Action: Redirect to HTTPS (301 permanent redirect)
- Preserves query parameters and path

**HTTPS Listener (Port 443)**:
- SSL Certificate: AWS Certificate Manager
- SSL Policy: ELBSecurityPolicy-TLS-1-2-2017-01
- Action: Forward to target group

## Target Group Configuration

### Primary Target Group
- **Name**: ecommerce-app-targets
- **Target Type**: Instance
- **Protocol**: HTTP
- **Port**: 80
- **VPC**: ecommerce-prod-vpc

### Health Check Settings
- **Protocol**: HTTP
- **Path**: /health
- **Port**: 80
- **Healthy Threshold**: 2 consecutive checks
- **Unhealthy Threshold**: 3 consecutive checks
- **Timeout**: 5 seconds
- **Interval**: 30 seconds
- **Success Codes**: 200

## SSL Certificate Management

### AWS Certificate Manager
- **Domain**: ecommerce-app.example.com
- **Validation**: DNS validation
- **Renewal**: Automatic renewal
- **Encryption**: RSA-2048 or ECDSA P-256

## Traffic Routing Rules

### Path-Based Routing
- `/api/*` → API target group
- `/static/*` → Static content (S3 via CloudFront)
- `/*` → Main application target group

### Sticky Sessions
- **Disabled**: Stateless application design
- **Load Balancing**: Round robin algorithm
- **Cross-Zone**: Enabled for even distribution

## Monitoring and Logging

### CloudWatch Metrics
- **RequestCount**: Total requests per minute
- **TargetResponseTime**: Average response time
- **HTTPCode_Target_2XX**: Successful responses
- **UnHealthyHostCount**: Failed health checks

### Access Logs
- **S3 Bucket**: ecommerce-alb-logs-eu-central
- **Prefix**: AWSLogs/1711582658989/elasticloadbalancing/eu-central-1/
- **Interval**: 5 minutes

---
**Load Balancer Config By**: AJ Almohammad
**Date**: 2025-09-03

