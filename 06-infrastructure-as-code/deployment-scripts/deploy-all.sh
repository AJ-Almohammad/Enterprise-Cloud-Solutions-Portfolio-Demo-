#!/bin/bash
# Master Deployment Script for All Clouds

echo "Multi-Cloud Infrastructure Deployment"
echo "===================================="

echo "Available deployment options:"
echo "1. AWS (eu-central-1)"
echo "2. Azure (Germany North)" 
echo "3. GCP (europe-west3)"
echo "4. All clouds"

read -p "Select deployment option (1-4): " choice

case $choice in
    1) ./deploy-aws.sh ;;
    2) ./deploy-azure.sh ;;
    3) ./deploy-gcp.sh ;;
    4) 
        ./deploy-aws.sh
        ./deploy-azure.sh
        ./deploy-gcp.sh
        ;;
    *) echo "Invalid option" ;;
esac
