#!/bin/bash
# Azure Infrastructure Deployment Script

echo "Deploying Azure infrastructure..."

# Login to Azure
az login

# Set subscription
az account set --subscription "1fb43053-89ff-4884-b157-ce696402a434"

# Initialize Terraform
cd terraform-azure
terraform init

# Plan deployment
terraform plan -out=tfplan

# Apply if approved
read -p "Deploy Azure infrastructure? (yes/no): " response
if [ "$response" = "yes" ]; then
    terraform apply tfplan
    echo "Azure deployment complete"
else
    echo "Azure deployment cancelled"
fi
