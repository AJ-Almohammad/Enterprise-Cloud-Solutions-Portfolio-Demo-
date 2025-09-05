# Azure Storage Accounts Strategy

## Overview
Multi-tier storage solution with blob storage, file shares, and backup.

**Subscription**: ********-****-****-****-************  
**Region**: Germany North

## Primary Storage Account
- **Name**: stecommerceprodnorth
- **Performance**: Standard
- **Replication**: GRS (Geo-redundant)
- **Access Tier**: Hot

## Containers
- **web-assets**: Static website files
- **product-images**: Product catalog images
- **backups**: Application and database backups

## CDN Integration
- **Azure CDN**: Global content delivery
- **Custom Domain**: cdn.ecommerce.example.com
- **Caching Rules**: Optimized for static content

---
**By**: AJ Almohammad  
**Date**: 2025-09-03
