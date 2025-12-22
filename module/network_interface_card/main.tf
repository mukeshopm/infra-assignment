resource "azurerm_network_interface" "nic" {
  for_each                       = var.nics
  name                           = each.value.name
  location                       = each.value.location
  resource_group_name            = each.value.resource_group_name
  auxiliary_mode                 = lookup(each.value, "auxiliary_mode", null)
  auxiliary_sku                  = lookup(each.value, "auxiliary_sku", null)
  dns_servers                    = lookup(each.value, "dns_servers", null)
  edge_zone                      = lookup(each.value, "edge_zone", null)
  ip_forwarding_enabled          = lookup(each.value, "ip_forwarding_enabled", null)
  accelerated_networking_enabled = lookup(each.value, "accelerated_networking_enabled", null)

  tags = lookup(each.value, "tags", null)

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
      name                          = ip_configuration.value.name #"internal"
      subnet_id                     = data.azurerm_subnet.data_subnet.id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation #"Dynamic"
    }
  }
}

data "azurerm_subnet" "data_subnet" {
  name                 = "backend"
  virtual_network_name = "dev-vnet-001"
  resource_group_name  = "dev-rg-001"

}
