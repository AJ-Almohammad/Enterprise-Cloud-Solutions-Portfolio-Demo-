# CloudMigrate Pro - Setup Guide

## Project Overview
This guide helps you replicate the CloudMigrate Pro portfolio demonstrating multi-cloud Solutions Architect capabilities across AWS, Azure, and GCP.

## Prerequisites

### Required Accounts
- GitHub account (free)
- AWS account (free tier eligible)
- Microsoft Azure account (free tier eligible)
- Google Cloud Platform account (free tier eligible)
- Vercel account (free)

### Required Tools
- Git for Windows
- PowerShell 7+
- Text editor (VS Code recommended)
- AWS CLI
- Azure CLI
- Google Cloud CLI

## Step-by-Step Setup

### Phase 1: Repository Setup

```powershell
# Create project directory
mkdir CloudMigrate-Pro
cd CloudMigrate-Pro

# Initialize Git repository
git init
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git

# Create basic project structure
mkdir 01-legacy-assessment, 02-migration-strategy, 03-aws-deployment
mkdir 04-azure-deployment, 05-gcp-deployment
# Continue for all 23 phases...

#Phase 2: Cloud Provider Authentication
# AWS CLI Configuration
aws configure
# Enter: Access Key ID, Secret Access Key, Region (eu-central-1), Output format (json)

# Azure CLI Login
az login
# Follow browser authentication

# Google Cloud CLI Setup
gcloud auth login
gcloud config set project YOUR-PROJECT-ID

#Phase 3: AWS Infrastructure Deployment
# VPC Creation
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=cloudmigratepro-main-vpc}]'

# Subnet Creation
aws ec2 create-subnet --vpc-id vpc-XXXXXXXXX --cidr-block 10.0.1.0/24 --availability-zone eu-central-1a

# Security Groups
aws ec2 create-security-group --group-name cloudmigratepro-web-server-sg --description "Web server security group" --vpc-id vpc-XXXXXXXXX

# EC2 Instance Launch
aws ec2 run-instances --image-id ami-XXXXXXXXX --count 1 --instance-type t3.micro --key-name YOUR-KEY --security-group-ids sg-XXXXXXXXX --subnet-id subnet-XXXXXXXXX

# RDS Database
aws rds create-db-subnet-group --db-subnet-group-name cloudmigratepro-db-subnet-group --db-subnet-group-description "DB subnet group" --subnet-ids subnet-XXXXXXXXX subnet-XXXXXXXXX

aws rds create-db-instance --db-instance-identifier cloudmigratepro-mysql-db --db-instance-class db.t3.micro --engine mysql --master-username admin --master-user-password YOUR-PASSWORD --allocated-storage 20

# S3 Bucket
aws s3 mb s3://cloudmigratepro-storage-$(Get-Random)

# Load Balancer
aws elbv2 create-load-balancer --name cloudmigratepro-alb --subnets subnet-XXXXXXXXX subnet-XXXXXXXXX

# Auto Scaling
aws ec2 create-launch-template --launch-template-name cloudmigratepro-template --version-description "Initial version" --launch-template-data file://launch-template.json

aws autoscaling create-auto-scaling-group --auto-scaling-group-name cloudmigratepro-asg --launch-template LaunchTemplateId=lt-XXXXXXXXX,Version=1 --min-size 1 --max-size 3 --desired-capacity 2

#Phase 4: Azure Infrastructure Deployment
# Resource Group
az group create --name rg-telus-solutions-architect --location eastus

# Virtual Network
az network vnet create --resource-group rg-telus-solutions-architect --name vnet-cloudmart --address-prefix 10.0.0.0/16

# Storage Account
az storage account create --name cloudmigrateprostore$(Get-Random -Maximum 9999) --resource-group rg-telus-solutions-architect --location eastus --sku Standard_LRS

# Cosmos DB
az cosmosdb create --name cloudmigratepro-cosmos --resource-group rg-telus-solutions-architect --locations regionName=eastus --enable-free-tier true

#Phase 5: GCP Infrastructure Deployment
# Set project
gcloud config set project YOUR-PROJECT-ID

# VPC Network
gcloud compute networks create ecommerce-vpc --subnet-mode custom

# Subnets
gcloud compute networks subnets create web-subnet --network ecommerce-vpc --range 10.0.1.0/24 --region europe-west3
gcloud compute networks subnets create app-subnet --network ecommerce-vpc --range 10.0.2.0/24 --region europe-west3

# VM Instance
gcloud compute instances create ecommerce-demo-vm --zone europe-west3-a --machine-type e2-micro --subnet web-subnet

# GKE Cluster
gcloud container clusters create my-cluster --zone europe-west3-a --num-nodes 2 --machine-type e2-medium

#Phase 6: Portfolio Website Creation
# Create index.html (main landing page)
# Create devops-dashboard.html (interactive dashboard)
# Create cost-calculator.html (cost analysis tool)
# Create architecture-diagrams.html (visual architecture)


#Phase 7: Security Implementation
# Create security masking script
$patterns = @{
    'YOUR-ACCOUNT-ID' = 'XXXX-XXXX-XXXX'
    'vpc-[a-f0-9]{17}' = 'vpc-XXXXXXXXX'
    'i-[a-f0-9]{17}' = 'i-XXXXXXXXX'
    # Add more patterns as needed
}

# Run masking across all documentation
Get-ChildItem -Path "." -Filter "*.md" -Recurse | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    foreach ($pattern in $patterns.GetEnumerator()) {
        $content = $content -replace $pattern.Key, $pattern.Value
    }
    Set-Content -Path $_.FullName -Value $content
}

#Phase 8: Deployment
# Commit to GitHub
git add .
git commit -m "Initial CloudMigrate Pro portfolio deployment"
git push origin main

# Deploy to Vercel
# 1. Go to vercel.com
# 2. Import GitHub repository
# 3. Deploy with default settings

#Cost Management
Monthly Estimates

AWS: ~$45/month (t3.micro instances, db.t3.micro RDS, S3 storage)
Azure: ~$22/month (B1s VMs, Cosmos DB free tier, storage)
GCP: ~$35/month (e2-micro VMs, GKE cluster)
Total: ~$102/month

Cost Optimization Tips

Use free tier resources where possible
Shut down non-essential resources when not demonstrating
Set up billing alerts for each cloud provider
Use auto-scaling to optimize compute costs
Consider spot instances for development workloads

Troubleshooting
Common Issues

Quota Limitations: Request quota increases or use smaller instance types
Authentication Errors: Verify CLI configurations and credentials
Network Connectivity: Check security groups and firewall rules
Resource Naming: Ensure globally unique names for storage accounts/buckets

Security Best Practices

Never commit credentials to Git
Use IAM roles instead of access keys where possible
Implement least privilege access
Enable MFA on all cloud accounts
Regularly rotate access keys

Documentation Standards

Mask all sensitive information (account IDs, resource IDs, IP addresses)
Use consistent naming conventions
Include deployment dates and status
Link documentation to actual deployed resources
Maintain clean commit history with descriptive messages

Portfolio Enhancement Ideas

Add CI/CD pipelines with GitHub Actions
Implement Infrastructure as Code with Terraform
Add monitoring and alerting
Create disaster recovery procedures
Implement automated testing
Add compliance frameworks (SOC2, ISO27001)

Support Resources

AWS Documentation: https://docs.aws.amazon.com/
Azure Documentation: https://docs.microsoft.com/azure/
GCP Documentation: https://cloud.google.com/docs/
Terraform Documentation: https://www.terraform.io/docs/
GitHub Documentation: https://docs.github.com/


Note: This setup requires active cloud resources that incur costs. Monitor usage and shut down resources when not needed for demonstrations.