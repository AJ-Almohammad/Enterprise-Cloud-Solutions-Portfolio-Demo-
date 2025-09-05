#!/bin/bash
# AWS Infrastructure Deployment Script

echo "Deploying AWS infrastructure..."

# Initialize Terraform
cd terraform-aws
terraform init

# Plan deployment
terraform plan -out=tfplan

# Apply if approved
read -p "Deploy AWS infrastructure? (yes/no): " response
if [ "$response" = "yes" ]; then
    terraform apply tfplan
    echo "AWS deployment complete"
else
    echo "AWS deployment cancelled"
fi
