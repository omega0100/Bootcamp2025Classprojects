output "resource_groups" {
  description = "Map of resource groups created by location"
  value = {
    for loc, rg in azurerm_resource_group.this :
    loc => {
      id       = rg.id
      name     = rg.name
      location = rg.location
    }
  }
}
