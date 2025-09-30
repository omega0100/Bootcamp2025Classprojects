# Base name for Resource Groups
variable "resource_group_name" {
  type    = string
  default = "letsgo"
}

# Multiple locations for deployment
variable "locations" {
  type    = list(string)
  default = ["northeurope", "westeurope"]
}

# Container Registry base name (must be globally unique!)
variable "acr_name" {
  type    = string
  default = "tacrmyacr"
}

# ACR SKU: Basic, Standard, Premium
variable "acr_sku" {
  type    = string
  default = "Basic"
}
