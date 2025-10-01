terraform {
  backend "azurerm" {
    resource_group_name  = "tf-backend-rg"
    storage_account_name = "tfbackendstore12345"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
