terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
backend "azurerm" {}
}

provider "azurerm" {
  features {}
  subscription_id = "9f8c0c9a-8b8f-430b-b1f6-b0c07c6a1f0f"
}
