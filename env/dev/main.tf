module "rg" {
  source = "../../module/resource_group"
  rgs    = var.rgs
}

# module "stg" {
#   depends_on = [module.rg]
#   source     = "../../module/storage_account"
#   stgs       = var.stgs
# }

module "vnet" {
  depends_on = [module.rg]
  source     = "../../module/virtual_network"
  vnets      = var.vnets
}

module "nsg" {
  depends_on = [module.rg]
  source     = "../../module/network_security_group"
  nsgs       = var.nsgs 
}

module "asg" {
  depends_on = [module.rg , module.nsg]
  source     = "../../module/application_security_group"
  asgs       = var.asgs
}

module "pip" {
  depends_on = [ module.rg , module.nsg , module.asg ]
  source = "../../module/public_ip"
  pips   = var.pips   
}

module "kv" {
  depends_on = [module.rg , module.nsg , module.vnet]
  source     = "../../module/azurerm_key_voult"
  kvs        = var.kvs
  
}

module "vm" {
  depends_on = [ module.rg , module.pip , module.vnet , module.nic ]
  source = "../../module/linux_vertual_machine"
  vms    = var.vms
}

module "nic" {
  depends_on = [ module.rg , module.vnet , module.nsg ]
  source = "../../module/network_interface_card"
  nics   = var.nics
}