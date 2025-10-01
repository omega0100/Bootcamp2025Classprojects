terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.46.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "80646857-9142-494b-90c5-32fea6acbc41"
  # أو بدل هذا السطر بـ use_cli = true إذا بتستخدم az login
}

# Resource Groups Module
module "resource_groups" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  locations           = var.locations
}

# Azure Container Registry Module
module "acr" {
  source          = "./modules/acr"
  acr_name        = var.acr_name
  acr_sku         = var.acr_sku
  resource_groups = module.resource_groups.resource_groups
}

# Virtual Networks Module (Azure Verified Module)
module "vnets" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.5.0"

  for_each = module.resource_groups.resource_groups

  resource_group_name = each.value.name
  location            = each.value.location
  name                = "vnet-${each.key}"

  address_space = [
    "10.${100 + index(keys(module.resource_groups.resource_groups), each.key)}.0.0/16"
  ]

  subnets = {
    web = {
      name             = "web-subnet"
      address_prefixes = ["10.${100 + index(keys(module.resource_groups.resource_groups), each.key)}.1.0/24"]
    }
    db = {
      name             = "db-subnet"
      address_prefixes = ["10.${100 + index(keys(module.resource_groups.resource_groups), each.key)}.2.0/24"]
    }
  }
}
