# AWS Auto Scaling Configuration

## Overview
Dynamic scaling configuration for e-commerce application to handle variable traffic loads while optimizing costs.

**AWS Account**: XXXX-XXXX-5889
**Region**: eu-central-1 (Frankfurt)

## Launch Template Configuration

### Launch Template Details
- **Name**: ecommerce-app-launch-template
- **Version**: Latest
- **AMI**: Amazon Linux 2023 (ami-XXXXXXXXX)
- **Instance Type**: t3.medium
- **Key Pair**: ecommerce-keypair
- **Security Groups**: ecommerce-app-sg
- **IAM Instance Profile**: ecommerce-ec2-role

### User Data Script
```bash
#!/bin/bash
yum update -y
yum install -y nodejs npm
yum install -y amazon-cloudwatch-agent
# Application deployment commands
aws s3 cp s3://ecommerce-deployments/latest/app.tar.gz /opt/
tar -xzf /opt/app.tar.gz -C /opt/
cd /opt/ecommerce-app
npm install --production
systemctl enable ecommerce-app
systemctl start ecommerce-app
