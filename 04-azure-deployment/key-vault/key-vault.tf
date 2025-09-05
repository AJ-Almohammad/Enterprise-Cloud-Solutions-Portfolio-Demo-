Write-Output '# Azure Key Vault Configuration
# Secure storage for secrets and keys for e-commerce app

resource "azurerm_key_vault" "ecommerce_kv" {
  name                        = "kv-ecommerce-prod-XXXX"  # must be globally unique; modify if needed
  location                    = azurerm_resource_group.ecommerce_production.location
  resource_group_name         = azurerm_resource_group.ecommerce_production.name
  tenant_id                   = "********-****-****-****-************"  # Your Azure Tenant ID
  sku_name                    = "standard"
  soft_delete_enabled         = true
  purge_protection_enabled    = false

  access_policy {
    tenant_id = "********-****-****-****-************"
    object_id = "********-****-****-****-************"  # Your primary Azure AD Object ID

    key_permissions = [
      "get",
      "list",
      "create",
      "delete",
      "update",
      "backup",
      "restore",
      "recover"
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "recover"
    ]
  }

  tags = {
    Environment = "production"
    Project     = "legacy-migration"
  }
}

# Optional: Create a sample secret (masked value)
resource "azurerm_key_vault_secret" "db_connection_string" {
  name         = "DatabaseConnectionString"
  value        = "Server=tcp:azure-db-server.database.windows.net,1433;Database=ecommerce_db;User ID=admin;Password=********;Encrypt=true;"
  key_vault_id = azurerm_key_vault.ecommerce_kv.id
}

output "key_vault_uri" {
  value = azurerm_key_vault.ecommerce_kv.vault_uri
}
' | Out-File -FilePath "key-vault.tf" -Encoding UTF8
