terraform {
  required_providers {
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "1.2.16"
    }
  }
}

resource "azurecaf_name" "container_registry" {
  name          = var.application_name
  resource_type = "azurerm_container_registry"
  suffixes      = [var.environment]
}

resource "azurerm_container_registry" "container-registry" {
  name                = azurecaf_name.container_registry.result
  resource_group_name = var.resource_group
  location            = var.location
  admin_enabled       = true
  sku                 = "Basic"

  tags = {
    "environment"      = var.environment
    "application-name" = var.application_name
  }
}

# resource "azurecaf_name" "azurecr_username" {
#   resource_type = "azurerm_key_vault_secret"
#   name          = "azurecr-username"
#   suffixes      = [var.application_name, var.environment]
# }

resource "azurerm_key_vault_secret" "azurecr_username" {
  name         = "azurecr-username"
  value        = azurerm_container_registry.container-registry.admin_username
  key_vault_id = var.vault_id
}

# resource "azurecaf_name" "azurecr_password" {
#   resource_type = "azurerm_key_vault_secret"
#   name          = "azurecr-password"
#   suffixes      = [var.application_name, var.environment]
# }

resource "azurerm_key_vault_secret" "azurecr_password" {
  name         = "azurecr-password"
  value        = azurerm_container_registry.container-registry.admin_password
  key_vault_id = var.vault_id
}