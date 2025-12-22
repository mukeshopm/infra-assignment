
variable "pips" {
  type = map(object({
    name                    = string
    location                = string
    resource_group_name     = string
    allocation_method       = string
    tags                    = optional(map(string))
    # zones                   = optional(list(string))
    sku                     = optional(string)
    sku_tier                = optional(string)
    ip_version              = optional(string)
    idle_timeout_in_minutes = optional(number)
    edge_zone               = optional(string)
    reverse_fqdn            = optional(string)
    public_ip_prefix_id     = optional(string)
    domain_name_label       = optional(string)
    domain_name_label_scope = optional(string)
    ddos_protection_mode    = optional(string)
    ddos_protection_plan_id = optional(string)
    ip_tags                 = optional(map(string))
  }))

}
