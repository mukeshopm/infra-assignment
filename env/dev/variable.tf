variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

# variable "stgs" {
#   type = map(object({
#     stg_name                 = string
#     rg_name                  = string
#     location                 = string
#     account_tier             = string
#     account_replication_type = string
#     # min_tls_version                  = optional(number)
#     nfsv3_enabled                    = optional(bool, false) #false
#     cross_tenant_replication_enabled = optional(bool, true)  #true
#     access_tier                      = optional(bool, )      #hot
#     https_traffic_only_enabled       = optional(bool, true)  #true
#     allow_nested_items_to_be_public  = optional(bool, false) #false
#     shared_access_key_enabled        = optional(bool, true)  #false
#     public_network_access_enabled    = optional(bool, true)  #true
#     default_to_oauth_authentication  = optional(bool, false) #false
#     is_hns_enabled                   = optional(bool, false) #false
#     large_file_share_enabled         = optional(bool, false) #false


#     network_rules = optional(map(object(
#       {
#         default_action = string
#         ip_rules       = optional(list(string))
#         bypass         = optional(list(string))
#       }
#     )))
#   }))
# }

variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = optional(list(string))
    dns_servers         = optional(list(string))
    tags                = optional(map(string))

    subnets = optional(map(object({
      name             = string
      address_prefixes = list(string)
    })))
  }))
}

variable "nsgs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
    security_rules = optional(map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = optional(string)
      destination_port_range     = optional(string)
      source_address_prefix      = optional(string)
      destination_address_prefix = optional(string)
    })))
  }))
}

variable "asgs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}


variable "pips" {
  type = map(object({
    name                      = string
    location                  = string
    resource_group_name       = string
    allocation_method         = string
    # zones                     = optional(list(string))
    sku                       = optional(string)
    sku_tier                  = optional(string)
    ip_version                = optional(string)
    idle_timeout_in_minutes   = optional(number)
    edge_zone                 = optional(string)
    reverse_fqdn              = optional(string)
    public_ip_prefix_id       = optional(string)
    domain_name_label         = optional(string)
    domain_name_label_scope   = optional(string)
    ddos_protection_mode      = optional(string)
    ddos_protection_plan_id   = optional(string)
    ip_tags                   = optional(map(string))
    tags                      = optional(map(string))
  }))
}

variable "kvs" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = optional(bool, false)
    tenant_id                   = string
    soft_delete_retention_days  = optional(number, 7)
    purge_protection_enabled    = optional(bool, false)
    sku_name                    = optional(string, "standard")

    # network_acls = optional(object({
    #   bypass                     = string
    #   default_action             = string
    #   ip_rules                   = optional(list(string))
    #   virtual_network_subnet_ids = optional(list(string))
    # }))

    access_policy = optional(list(object({
      tenant_id           = string
      object_id           = string
      application_id      = optional(string)
      key_permissions     = optional(list(string))
      secret_permissions  = optional(list(string))
      storage_permissions = optional(list(string))
    })))
  }))
}

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


variable "nics" {
  type = map(object({
    name                           = string
    location                       = string
    resource_group_name            = string
    auxiliary_mode                 = optional(string)
    auxiliary_sku                 = optional(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    ip_forwarding_enabled          = optional(bool)
    accelerated_networking_enabled = optional(bool)
    tags                           = optional(map(string))
    ip_configuration = list(object({
    name                          = string
    private_ip_address_allocation = string
  }))
  }))
}
