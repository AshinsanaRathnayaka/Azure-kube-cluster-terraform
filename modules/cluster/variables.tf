variable "serviceprinciple_id" {
}

variable "serviceprinciple_key" {
}

variable "location" {
  description = "azure location to deploy resources"
}

variable "cluster_name" {
  description = "AKS cluster name"
}

variable "kubernetes_version" {
  description = "version of the kubernetes cluster"
}

variable "resource_group_name" {
  description = "name of the resource group to deploy AKS cluster in"
}

# Node Pool config

variable "node_count" {
  description = "number of nodes to deploy"
}

variable "vm_size" {
  description = "size/type of VM to use for nodes"
}


variable "os_disk_size_gb" {
  description = "size of the OS disk to attach to the nodes"
}

variable "vnet_subnet_id" {
  description = "vnet id where the nodes will be deployed"
}

variable "max_pods" {
  description = "maximum number of pods that can run on a single node"
}

variable "min_count" {
  default     = 1
  description = "Minimum Node Count"
}

variable "max_count" {
  default     = 3
  description = "Maximum Node Count"
}

variable "default_pool_name" {
  description = "name for the agent pool profile"
  default     = "default"
}

variable "default_pool_type" {
  description = "type of the agent pool (AvailabilitySet and VirtualMachineScaleSets)"
  default     = "VirtualMachineScaleSets"
}

