variable "resource_group" {
  type        = string
  description = "The resource group"
}

variable "application_name" {
  type        = string
  description = "The name of your application"
}

variable "environment" {
  type        = string
  description = "The environment (dev, test, prod...)"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "The Azure region where all resources in this example should be created"
}

variable "vault_id" {
  type        = string
  description = "The Azure Key Vault ID"
}

variable "azurecr_url" {
  type        = string
  description = "The Azure Container Registry URL"
}

variable "azurecr_password" {
  type        = string
  description = "The Azure Container Registry password. It can be a key vault reference"
}

variable "azurecr_username" {
  type        = string
  description = "The Azure Container Registry username. It can be a key vault reference"
}

variable "docker_image" {
  type        = string
  description = "The Docker image to use"
}

variable "docker_image_tag" {
  type        = string
  description = "The Docker image tag"
}
