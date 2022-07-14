variable "application_name" {
  type        = string
  description = "The name of your application"
  default     = "ftalive-backend"
}


variable "environment" {
  type        = string
  description = "The environment (dev, test, prod...)"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "The Azure region where all resources in this example should be created"
  default     = "westeurope"
}

variable "docker_image" {
  type        = string
  description = "docker image to deploy"
}

variable "docker_image_tag" {
  type        = string
  description = "docker tag to deploy"
}

variable "azurecr_url" {
  type        = string
  description = "azure container registry url"
}

variable "vault_id" {
  type        = string
  description = "The Azure Key Vault ID containing the registry secrets"  
}

variable "azurecr_username" {
  type        = string
  description = "azure container registry username. It can be a key vault secret reference"
}

variable "azurecr_password" {
  type        = string
  description = "azure container registry password. It can be a key vault secret reference"
}
