resource "azurerm_container_registry" "this" {
  for_each = var.resource_groups

  name                = "${var.acr_name}${each.key}"
  resource_group_name = each.value.name
  location            = each.value.location
  sku                 = var.acr_sku
  admin_enabled       = true
}
