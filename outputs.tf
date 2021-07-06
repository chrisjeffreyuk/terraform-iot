output  "Resource_Group" {
  value = azurerm_resource_group.main.name
}

output  "IoT_Hub_Name" {
  value = azurerm_iothub.iot-hub.name
}

output  "DPS_Name" {
  value = azurerm_iothub_dps.dps.name
}
