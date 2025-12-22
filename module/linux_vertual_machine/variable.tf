variable "vms" {
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    tags = optional(map(string))
    nic_name                        = string

    os_disk = map(object({
      name                 = string
      caching              = string
      storage_account_type = string
    }))
    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
  }))
}
