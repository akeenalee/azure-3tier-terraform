terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "allitfstate"
    container_name       = "tfstate"
    key                  = "3tier.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}