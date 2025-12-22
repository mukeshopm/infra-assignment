resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.vms
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size           # "Standard_F2"
  admin_username      = each.value.admin_username #"adminuser"
  admin_password      = each.value.admin_password #"P@ssword1234!"
  network_interface_ids = [data.
    azurerm_network_interface.nic_data[each.key].id,
  ]
  disable_password_authentication = each.value.disable_password_authentication
  tags = each.value.tags

  #   admin_ssh_key {
  #     username   = "adminuser"
  #     public_key = file("~/.ssh/id_rsa.pub")
  #   }

  dynamic "os_disk" {
    for_each = each.value.os_disk
    content {
      name                 = lookup(os_disk.value, "name", null)
      caching              = os_disk.value.caching                               #ReadWrite
      storage_account_type = lookup(os_disk.value, "storage_account_type", null) #"Standard_LRS"
    }
  }

  dynamic "source_image_reference" {
    for_each = lookup(each.value , "source_image_reference" , {})
    content {
      publisher = source_image_reference.value.publisher #each#"Canonical"
      offer     = source_image_reference.value.offer     #"0001-com-ubuntu-server-jammy"
      sku       = source_image_reference.value.sku       #"22_04-lts"
      version   = source_image_reference.value.version   #"latest"
    }
  }
}

data "azurerm_network_interface" "nic_data" {
  for_each = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

