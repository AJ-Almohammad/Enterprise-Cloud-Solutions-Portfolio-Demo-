# Azure Cosmos DB Configuration

## Overview
NoSQL database service for global distribution and multi-model data.

**Subscription**: ********-****-****-****-************  
**Primary Region**: Germany North

## Cosmos DB Account
- **Name**: cosmos-ecommerce-prod
- **API**: Core (SQL)
- **Consistency Level**: Session
- **Multi-region**: Germany North + Germany West Central

## Database Design
- **Database**: EcommerceDB
- **Containers**:
  - Products (10,000 RU/s)
  - Orders (5,000 RU/s)
  - Users (2,000 RU/s)

## Security
- **Network Access**: VNet service endpoints
- **Encryption**: At rest and in transit
- **Access Keys**: Managed in Key Vault

---
**By**: AJ Almohammad, 2025-09-03
