
# Provider
provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "letsgo" {
  name     = var.resource_group_name
  location = var.location
}

# Azure Container Registry
resource "azurerm_container_registry" "tacrmyacr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.letsgo.name
  location            = azurerm_resource_group.letsgo.location
  sku                 = var.acr_sku
  admin_enabled       = true
}
