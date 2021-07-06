variable "subscription_id" { 
  description = "Subscription ID Details"
  default     = "XXXX"
}

variable "client_id" {
  description = "The Client ID Details"
  default     = "XXXX"
}

variable "client_secret" {
  description = "The Client Secret Details"
  default     = "XXXX"
}

variable "tenant_id" {
  description = "The Tenant ID Details"
  default     = "XXXX"
}

variable "prefix" {
  description = "The prefix used for all resources in this example"
  default     = "azureforall"
}

variable "location" {
  description = "The Azure location where all resources in this example should be created"
  default     = "eastus2"
}

variable "tags" {
  type          = map
  description   = "Defines the tags used in Azure"
  default       = {
    environment   = "azureforall"
    use           = "test"
  }
}