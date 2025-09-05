# Azure Virtual Network Architecture

## Overview
VNet design for e-commerce application in Germany North with hub-spoke topology.

**Subscription**: ********-****-****-****-************  
**Region**: Germany North (Berlin)

## VNet Configuration
- **Name**: vnet-ecommerce-prod-germanynorth
- **Address Space**: XXX.XXX.XXX.XXX/16
- **Subnets**:
  - App Subnet: XXX.XXX.XXX.XXX/24
  - Database Subnet: XXX.XXX.XXX.XXX/24
  - Gateway Subnet: XXX.XXX.XXX.XXX/27

## Network Security Groups
- Web tier: HTTP/HTTPS from internet
- App tier: Internal traffic only
- Database tier: App subnet access only

---
**By**: AJ Almohammad  
**Date**: 2025-09-03


