terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
  #subscription_id = var.subscription_id
  #client_id       = var.client_id
  #client_secret   = var.client_secret
  #tenant_id       = var.tenant_id
}

# Create the resource group
resource "azurerm_resource_group" "main" {
  name                = "${var.prefix}-rg"
  location            = var.location
  tags                = var.tags
}

# Create the Azure IoT Hub
resource "azurerm_iothub" "iot-hub" {
  name                = "${var.prefix}-iot-hub"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  tags                = var.tags

    sku {
        name     = "S1"
        capacity = 1
    }
}

# Create the IoT Hub Access Policy
data "azurerm_iothub_shared_access_policy" "iothub_iothubowner" {
  name                = "iothubowner"
  resource_group_name = azurerm_resource_group.main.name
  iothub_name         = azurerm_iothub.iot-hub.name
}

# Create a Device Provisioning Service
resource "azurerm_iothub_dps" "dps" {
  name                = "${var.prefix}-iot-hub-dps"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  tags                = var.tags

    sku {
        name     = "S1"
        capacity = 1
    }

    linked_hub {
        connection_string = data.azurerm_iothub_shared_access_policy.iothub_iothubowner.primary_connection_string
        location = azurerm_iothub.iot-hub.location
    }
}