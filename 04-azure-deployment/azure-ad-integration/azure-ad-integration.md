# Azure Active Directory Integration

## Overview
Identity and access management for e-commerce application users and administrators.

**Tenant ID**: ********-****-****-****-************  
**Region**: Germany North

## App Registration
- **Name**: EcommerceApp
- **Sign-on URL**: https://ecommerce.example.com
- **Reply URLs**: Configured for app service
- **API Permissions**: Microsoft Graph basic profile

## Authentication Flow
- **Protocol**: OpenID Connect
- **Token Lifetime**: 1 hour access, 24 hour refresh
- **Multi-factor**: Enabled for admin accounts
- **Conditional Access**: Location-based policies

## User Management
- **Customer Users**: B2C integration
- **Admin Users**: B2B with role-based access
- **Guest Access**: Limited partner access

---
**By**: AJ Almohammad, 2025-09-03
