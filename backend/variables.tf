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
