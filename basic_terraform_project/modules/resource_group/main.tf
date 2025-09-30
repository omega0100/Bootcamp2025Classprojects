resource "azurerm_resource_group" "this" {
  for_each = toset(var.locations)

  name     = "${var.resource_group_name}-${each.key}"
  location = each.key
}
