# Azure App Services Configuration

## Overview
Scalable web application hosting using Azure App Service in Germany North.

**Subscription**: ********-****-****-****-************  
**Region**: Germany North

## App Service Plan
- **Name**: asp-ecommerce-prod
- **SKU**: P1v3 (Premium)
- **Scaling**: Auto-scale 1–5 instances
- **OS**: Linux

## Web App Configuration
- **Name**: app-ecommerce-prod-germanynorth
- **Runtime**: Node.js 18 LTS
- **Deployment**: GitHub Actions CI/CD
- **Custom Domain**: ecommerce.example.com

## API App Configuration
- **Name**: api-ecommerce-prod-germanynorth
- **Runtime**: Node.js 18 LTS
- **Authentication**: Azure AD integration
- **CORS**: Configured for web app domain

---
**By**: AJ Almohammad, 2025-09-03
