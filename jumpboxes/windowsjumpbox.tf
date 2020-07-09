resource "azurerm_network_interface" "win_network_interface" {
  count = var.vm_win_count
  name                = "${var.prefix}_win_nic_${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "win_nic_ip_configuration"
    subnet_id                     = var.jumpboxes_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "win_vm" {
  count = var.vm_win_count
  name                = "${var.prefix}winvm${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.win_network_interface[count.index].id]
  size               = var.vm_win_size
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "20h1-pro"
    version   = "latest"
  }
}
