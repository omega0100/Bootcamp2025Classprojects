output "resource_groups" {
  description = "Resource groups by region"
  value       = module.resource_groups.resource_groups
}


output "acr_login_servers" {
  description = "ACR login servers by region"
  value       = module.acr.acr_login_servers
}

output "acr_admin_usernames" {
  description = "ACR admin usernames by region"
  value       = module.acr.acr_admin_usernames
}

output "acr_admin_passwords" {
  description = "ACR admin passwords by region"
  value       = module.acr.acr_admin_passwords
  sensitive   = true
}

output "vnet_ids" {
  description = "IDs of the created VNets by location"
  value       = { for loc, vnet in module.vnets : loc => vnet.resource_id }
}


output "subnet_ids" {
  description = "Subnet IDs by VNet and location"
  value       = { for loc, vnet in module.vnets : loc => { for name, subnet in vnet.subnets : name => subnet.resource_id } }
}
