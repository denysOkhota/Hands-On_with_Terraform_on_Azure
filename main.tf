terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {
    organization = "DenysKoooKoo"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg"{
  name     = "813-40ca82e1-hands-on-with-terraform-on-azure"
  location = "westus"
}

module "denmodule" {
  source               = "app.terraform.io/DenysKoooKoo/denmodule/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "dslopsikdaqetum"
}