provider "azurerm" {
  version = "=2.5.0" 

  subscription_id = var.subscription_id
  client_id       = var.serviceprinciple_id
  client_secret   = var.serviceprinciple_key
  tenant_id       = var.tenant_id

  features {}
}


resource "azurerm_resource_group" "akscluster-rg" {
  name     = var.resource_group_name
  location = var.location
}

# AKS Cluster Network

module "network" {
  source              = "./modules/network/"
  subnet_name         = var.subnet_name
  vnet_name           = var.vnet_name
  resource_group_name = azurerm_resource_group.akscluster-rg.name
  subnet_cidr         = var.subnet_cidr
  location            = var.location
  address_space       = var.address_space
}

# AKS Cluster

module "cluster" {
  source                = "./modules/cluster/"
  cluster_name          = var.cluster_name
  serviceprinciple_id   = var.serviceprinciple_id
  serviceprinciple_key  = var.serviceprinciple_key
  location              = var.location
  resource_group_name   = azurerm_resource_group.akscluster-rg.name
  kubernetes_version    = var.kubernetes_version
  node_count            = var.node_count
  min_count             = var.min_count
  max_count             = var.max_count
  os_disk_size_gb       = "256"
  max_pods              = "110"
  vm_size               = var.vm_size
  vnet_subnet_id        = var.subnet_name 
}

module "istio" {
  source              = "./modules/istio/"
  location            = var.location
  cluster_name        = var.cluster_name
  resource_group_name = azurerm_resource_group.akscluster-rg.name
}





