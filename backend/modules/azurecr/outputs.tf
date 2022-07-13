output "azurecr_url" {
  value       = azurerm_container_registry.container-registry.login_server
  description = "The Azure Container Registry URL"
}

output "azurecr_username_ref" {
  value       = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.azurecr_username.versionless_id})"
  description = "The Azure Container Registry username"
}

output "azurecr_password_ref" {
  value       = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.azurecr_password.versionless_id})"
  description = "The Azure Container Registry password. It can be a key vault reference"
}
