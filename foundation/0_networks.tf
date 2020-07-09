# resource "azurerm_virtual_network" "vnet" {
#   name                = var.vnet_name
#   address_space       = ["10.0.0.0/24"]
#   location            = var.vnet_location
#   resource_group_name = var.resource_group_name
# }
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}
