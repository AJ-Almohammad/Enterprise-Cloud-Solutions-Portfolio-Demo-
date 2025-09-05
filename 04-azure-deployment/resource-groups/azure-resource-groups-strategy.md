# Azure Resource Groups Strategy

## Overview
Resource organization strategy for e-commerce application deployment in Azure Germany North region with proper governance and cost management.

**Azure Subscription**: ********-****-****-****-************  
**Primary Region**: Germany North (Berlin)  
**DR Region**: Germany West Central

## Resource Group Design

### Production Resource Group
- **Name**: rg-ecommerce-prod-germanynorth
- **Location**: Germany North
- **Purpose**: Production application resources
- **Tags**: Environment=Production, Project=EcommerceApp, CostCenter=IT

### Development Resource Group
- **Name**: rg-ecommerce-dev-germanynorth
- **Location**: Germany North
- **Purpose**: Development and testing resources
- **Tags**: Environment=Development, Project=EcommerceApp

### Shared Services Resource Group
- **Name**: rg-ecommerce-shared-germanynorth
- **Location**: Germany North
- **Purpose**: Key Vault, Log Analytics, shared storage
- **Tags**: Environment=Shared, Project=EcommerceApp

### Disaster Recovery Resource Group
- **Name**: rg-ecommerce-dr-germanywestcentral
- **Location**: Germany West Central
- **Purpose**: DR backups and failover resources
- **Tags**: Environment=DR, Project=EcommerceApp

## Resource Allocation Strategy

### Production Resources
- App Service Plan
- App Services (Web and API)
- Cosmos DB account
- Storage accounts
- Application Gateway
- Key Vault access policies

### Governance and Tagging
- **Cost Tracking**: By environment and project
- **Lifecycle Management**: Automated resource cleanup
- **Access Control**: RBAC at resource group level
- **Compliance**: GDPR requirements for German regions

---
**Resource Strategy By**: AJ Almohammad  
**Date**: 2025-09-03
