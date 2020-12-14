resource "azuread_group" "aks-admin-group" {
  name = "AKS-Aadmins"
}


resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                  = var.cluster_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  dns_prefix            = var.dns_prefix            
  kubernetes_version    = var.kubernetes_version
  
  default_node_pool {
    name       = var.default_pool_name
    vnet_subnet_id = var.vnet_subnet_id
    node_count = var.node_count
    vm_size    = var.vm_size
    max_pods        = var.max_pods
    type       = var.default_pool_type
    enable_auto_scaling   = true
    max_count             = var.max_count
    min_count             = var.min_count
    os_disk_size_gb = var.os_disk_size_gb
  }

  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed                = true
      admin_group_object_ids = [azuread_group.aks-admin-group.id]
    }
  }

  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "Standard"
  }

  addon_profile {
    aci_connector_linux {
      enabled = false
    }

    azure_policy {
      enabled = true
    }

    http_application_routing {
      enabled = false
    }

    kube_dashboard {
      enabled = true
    }
  }
}


