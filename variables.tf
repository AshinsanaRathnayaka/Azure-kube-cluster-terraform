variable "serviceprinciple_id" {
}

variable "serviceprinciple_key" {
}

variable "tenant_id" {
  description = "tenant_id"
  default     = "9a7d6675-0247-4a97-a8bc-3be84803d7da"
}

variable "subscription_id" {
  description = "subscription_id"
  default     = "b67a67b2-042e-4a96-bdc4-e645c3bfb6f2"
}

variable "node_count" {
  description = "number of nodes to deploy"
  default     = 2
}

variable cluster_name {
  description = "AKS cluster name"
  default     = "aks-cluster"
}

variable resource_group_name {
  description = "name of the resource group to deploy AKS cluster in"
  default     = "akscluster-rg"
}

variable location {
  description = "azure location to deploy resources"
  default     = "westeurope"
}

variable subnet_name {
  description = "subnet id where the nodes will be deployed"
  default     = "akscluster-subnet"
}

variable vnet_name {
  description = "vnet id where the nodes will be deployed"
  default     = "akscluster-vnet"
}

variable subnet_cidr {
  description = "the subnet cidr range"
  default     = "10.2.32.0/24"
}

variable kubernetes_version {
  description = "version of the kubernetes cluster"
  default     = "1.16.10"
}

variable "vm_size" {
  description = "size/type of VM to use for nodes"
  default     = "Standard_D2_v2"
}

variable "os_disk_size_gb" {
  description = "size of the OS disk to attach to the nodes"
  default     = 512
}

variable "max_pods" {
  description = "maximum number of pods that can run on a single node"
  default     = "100"
}

variable "address_space" {
  description = "The address space that is used the virtual network"
  default     = "10.2.0.0/16"
}
variable "min_count" {
  default     = 1
  description = "Minimum Node Count"
}
variable "max_count" {
  default     = 4
  description = "Maximum Node Count"
}