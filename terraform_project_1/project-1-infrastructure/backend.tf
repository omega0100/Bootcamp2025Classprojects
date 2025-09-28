  backend "azurerm" {
  terraform {
  resource_group_name   = "weekend-rg"
    storage_account_name  = "weekendtfstateacct"   # must match what you created
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
