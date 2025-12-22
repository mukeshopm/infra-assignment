variable "vnets" {
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name       = string
    address_space             = optional(list(string))
    dns_servers               = optional(list(string))
    tags = optional(map(string))
    subnets = optional(map(object({
      name         = string
      address_prefixes = list(string)
    })))
  }))
}
