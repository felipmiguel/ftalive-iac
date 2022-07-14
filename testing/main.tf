terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.11.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "1.2.16"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-ftalive-iac"
    storage_account_name = "tfstate8337"
    container_name       = "tfstate"
    key                  = "terraform.tfstate.testing"
  }

}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

locals {
  // If an environment is set up (dev, test, prod...), it is used in the application name
  environment = var.environment == "" ? "dev" : var.environment
}

resource "azurecaf_name" "resource_group" {
  name          = var.application_name
  resource_type = "azurerm_resource_group"
  suffixes      = [local.environment]
}

resource "azurerm_resource_group" "main" {
  name     = azurecaf_name.resource_group.result
  location = var.location

  tags = {
    "terraform"        = "true"
    "environment"      = local.environment
    "application-name" = var.application_name
    "nubesgen-version" = "0.12.1"
  }
}



module "application" {
  source           = "./modules/app-service"
  resource_group   = azurerm_resource_group.main.name
  application_name = var.application_name
  environment      = local.environment
  location         = var.location
  vault_id         = var.vault_id
  azurecr_url      = var.azurecr_url
  azurecr_username = var.azurecr_username
  azurecr_password = var.azurecr_password
  docker_image     = var.docker_image
  docker_image_tag = var.docker_image_tag
}