
resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space = lookup(each.value, "address_space", null)
  dns_servers = lookup(each.value, "dns_servers", [])
    tags = lookup(each.value, "tags", {})


  dynamic "subnet" {
    for_each = lookup(each.value, "subnets", {})
    content {
      name                                      = subnet.value.name
      address_prefixes                          = subnet.value.address_prefixes

    }
  }
}


