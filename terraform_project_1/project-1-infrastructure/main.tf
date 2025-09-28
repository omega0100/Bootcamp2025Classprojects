terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Reference existing Resource Group
data "azurerm_resource_group" "existing" {
  name = "weekend-rg"   # your existing RG name
}

# Reference existing Azure Container Registry
data "azurerm_container_registry" "existing" {
  name                = "weekendcr"                  # your existing ACR name
  resource_group_name = data.azurerm_resource_group.existing.name
}

# Container Group using the existing image
resource "azurerm_container_group" "webapp" {
  name                = "my-nodejs-webapp"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  ip_address_type     = "Public"
  os_type             = "Linux"

  identity {
    type = "SystemAssigned"
  }


image_registry_credential {
  server   = data.azurerm_container_registry.existing.login_server
  username = var.acr_username
  password = var.acr_password
}



  container {
    name   = "webapp"
    image  = "${data.azurerm_container_registry.existing.login_server}/terraformnodejsapp:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 3000
      protocol = "TCP"
    }

        ports {
      port     = 80
      protocol = "TCP"
    }
    
  }
}



