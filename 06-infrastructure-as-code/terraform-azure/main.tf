terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1fb43053-89ff-4884-b157-ce696402a434"
}

# Resource Group
resource "azurerm_resource_group" "ecommerce_rg" {
  name     = "rg-ecommerce-prod-germanynorth"
  location = "Germany North"
  
  tags = {
    Environment = "Production"
    Project     = "EcommerceApp"
  }
}

# Virtual Network
resource "azurerm_virtual_network" "ecommerce_vnet" {
  name                = "vnet-ecommerce-prod"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.ecommerce_rg.location
  resource_group_name = azurerm_resource_group.ecommerce_rg.name
  
  tags = {
    Environment = "Production"
  }
}

# App Subnet
resource "azurerm_subnet" "app_subnet" {
  name                 = "subnet-app"
  resource_group_name  = azurerm_resource_group.ecommerce_rg.name
  virtual_network_name = azurerm_virtual_network.ecommerce_vnet.name
  address_prefixes     = ["10.1.1.0/24"]
}
