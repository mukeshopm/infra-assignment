rgs = {
  rg1 = {
    name       = "dev-rg-001"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      team    = "devteam"
      company = "Netflix"
    }
  }
}


# stgs = {
#   "stg1" = {
#     stg_name                 = "devstg04321"
#     rg_name                  = "dev-rg-001"
#     location                 = "centralindia"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
#     network_rules = {
#       rule1 = {
#         default_action = "Deny"
#         ip_rules       = ["122.181.101.101"]
#         bypass         = ["AzureServices"]
#       }
#     }
#   }
# }


vnets = {
  vnet1 = {
    name                = "dev-vnet-001"
    location            = "centralindia"
    resource_group_name = "dev-rg-001"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]

    subnets = {
      subnet1 = {
        name             = "frontend"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "backend"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
    tags = {
      environment = "dev"
      owner       = "network-team"
    }
  }
}

nsgs = {
  nsg1 = {
    name                = "dev-nsg-001"
    location            = "centralindia"
    resource_group_name = "dev-rg-001"
    tags = {
      environment = "dev"
      owner       = "security-team"
    }

    security_rule = {
      name                       = "security-rule-1"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

asgs = {
  "asg1" = {
    name                = "dev-asg-001"
    location            = "East US"
    resource_group_name = "dev-rg-001"
    tags = {
      Environment = "Dev"
    }
  }
}

pips = {
  "pip1" = {
    name                = "pip-frontend"
    location            = "centralindia"
    resource_group_name = "dev-rg-001"
    allocation_method   = "Static"

    sku        = "Standard"
    sku_tier   = "Regional"
    ip_version = "IPv4"
    # zones      = ["1", "2"]

    domain_name_label       = "frontend-app"
    domain_name_label_scope = "ResourceGroupReuse"
    idle_timeout_in_minutes = 10
    edge_zone               = null

    ddos_protection_mode = "Enabled"

    # ip_tags = {
    #   RoutingPreference = "Internet" ye pichhna hai ki ip-tag or zones ek sath kyu nahi use kr sakte?
    # }

    tags = {
      environment = "dev"
      owner       = "network-team"
    }
  }
}

kvs = {
  kv1 = {
    name                        = "shashikv001"
    location                    = "centralindia"
    resource_group_name         = "dev-rg-001"
    enabled_for_disk_encryption = true
    tenant_id                   = "1449fb85-6c94-4b5d-bcf2-9410cee07ba5"
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false

    sku_name = "standard"

    # network_acls = {
    #   bypass         = "AzureServices"
    #   default_action = "Deny"
    # }

    access_policy = [{
      tenant_id = "1449fb85-6c94-4b5d-bcf2-9410cee07ba5"
      object_id = "d81d4b96-bb8e-4649-b7ee-95f1048a729c"

      key_permissions = [
        "Get",
      ]

      secret_permissions = [
        "Get",
      ]

      storage_permissions = [
        "Get",
      ]
    }]
  }
}

vms = {
  "vm1" = {
    name                            = "dev-vm-001"
    location                        = "centralindia"
    resource_group_name             = "dev-rg-001"
    size                            = "Standard_F2"
    admin_username                  = "adminuser"
    admin_password                  = "Password@12345"
    disable_password_authentication = false
    nic_name                        = "dev-nic-001"

    os_disk = {
      osdisk1 = {
        name                 = "dev-os-disk-001"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }
    source_image_reference = {
      image1 = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    }

    tags = {
      environment = "dev"
      owner       = "compute-team"
    }
  }
}

nics = {
  nic1 = {
    name                           = "dev-nic-001"
    location                       = "centralindia"
    resource_group_name            = "dev-rg-001"
    auxiliary_mode                 = null
    auxiliary_sku                  = null
    dns_servers                    = null
    edge_zone                      = null
    ip_forwarding_enabled          = false
    accelerated_networking_enabled = true
    tags = {
      environment = "dev"
      owner       = "dev-team"
    }
    ip_configuration = [
      {
        name                          = "ipconfig-001"
        private_ip_address_allocation = "Dynamic"
      }
    ]
  }
}
