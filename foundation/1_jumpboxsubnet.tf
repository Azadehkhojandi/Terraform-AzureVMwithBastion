resource "azurerm_subnet" "jumpboxes_subnet" {
  name                 = "jumpboxes_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "10.0.2.0/24"
}

output "jumpboxes_subnet_id" {
  value = azurerm_subnet.jumpboxes_subnet.id
}
