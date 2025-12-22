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
  