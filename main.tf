provider "azurerm" {
  version = "~>2.1.0"
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = var.location
  tags     = var.tags
}


module "foundation" {
  source              = "./foundation"
  prefix              = var.prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.tags
}

module "jumpboxes" {
  source              = "./jumpboxes"
  prefix              = var.prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.tags
  vnet_name           = module.foundation.vnet_name
  jumpboxes_subnet_id = module.foundation.jumpboxes_subnet_id
  vm_win_count        = var.vm_win_count
  vm_lnx_count        = var.vm_lnx_count
  vm_admin_password   = var.vm_admin_password
  vm_admin_username   = var.vm_admin_username
  vm_lnx_size         = var.vm_lnx_size
  vm_win_size         = var.vm_win_size
}
