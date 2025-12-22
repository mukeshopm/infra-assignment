resource "azurerm_public_ip" "public_ip" {
  for_each = var.pips

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  tags                = each.value.tags

  # zones    = lookup(each.value, "zones", null)
  sku      = lookup(each.value, "sku", "Standard")
  sku_tier = lookup(each.value, "sku_tier", "Regional")

  ip_version              = lookup(each.value, "ip_version", "IPv4")
  idle_timeout_in_minutes = lookup(each.value, "idle_timeout_in_minutes", null)
  edge_zone               = lookup(each.value, "edge_zone", null)
  reverse_fqdn            = lookup(each.value, "reverse_fqdn", null)
  public_ip_prefix_id     = lookup(each.value, "public_ip_prefix_id", null)

  domain_name_label       = lookup(each.value, "domain_name_label", null)
  domain_name_label_scope = lookup(each.value, "domain_name_label_scope", null)

  ddos_protection_mode    = lookup(each.value, "ddos_protection_mode", "VirtualNetworkInherited")
  ddos_protection_plan_id = lookup(each.value, "ddos_protection_plan_id", null)

  ip_tags = lookup(each.value, "ip_tags", null)
}
