provider "azurerm" {
  features {}
}

# Resource Group - one per location
resource "azurerm_resource_group" "letsgo" {
  for_each = toset(var.locations)

  name     = "${var.resource_group_name}-${each.key}"
  location = each.key
}

# Azure Container Registry - one per location
resource "azurerm_container_registry" "tacrmyacr" {
  for_each = azurerm_resource_group.letsgo

  name                = "${var.acr_name}${each.key}"
  resource_group_name = each.value.name
  location            = each.value.location
  sku                 = var.acr_sku
  admin_enabled       = true
}
