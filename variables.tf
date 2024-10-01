# Proxmox
variable "virtual_environment_endpoint_ip" {
  type = string
  description = "The ip address associated with a pve api node"
}

variable "virtual_environment_endpoint_port" {
  type = string
  description = "The port associated with a pve api node"
}

variable "virtual_environment_api_token" {
  type = string
  description = "(SECRET) The api_token for provisionary user"
  sensitive = true
}

variable "ssh_username" {
  type = string
  description = "(SECRET) The username to connect for some commands over ssh"
  sensitive = true
}

# Talos
variable "talos_version" {
  type        = string
  default     = "v1.8.0"
  description = "Pick release from https://github.com/siderolabs/talos/releases"
}

variable "talos_image_datastore_id" {
  type = string
  default = "local"
  description =  "Datastore to use for talos image"
}

variable "talos_image_datastore_nodename" {
  type = string
  description =  "node to connect to for datastore"
}

# Cluster Config
variable "kubernetes_version" {
  type = string
  default = "1.31.1"
  description = "Pick release from https://github.com/siderolabs/kubelet/pkgs/container/kubelet"
}

# Control Planes
variable "ctrl_num" {
  type = number
  default = 3
  description = "The number of desired control planes"
}

variable "ctrl_hostname_prefix" {
  type        = string
  default     = "k8s-cp"
  description = "Hostname prefix of the controlplane nodes"
}

variable "ctrl_memory" {
  type = number
  default = 5120
  description = "The memory allocated to controlplane vms"
}

variable "ctrl_disk" {
  type = map(object({
    interface = string
    datastore_id = string
    size = number
    ssd = bool
  }))
  description = "The disk parameters to use for the vm"
}

# Worker Nodes
variable "node_num" {
  type = number
  default = 3
  description = "The number of worker nodes"
}
variable "node_hostname_prefix" {
  type        = string
  default     = "k8s-node"
  description = "Hostname prefix of the worker nodes"
}

variable "node_memory" {
  type = number
  default = 6144
  description = "The memory allocated to node vms"
}

variable "node_disk" {
  type = map(object({
    interface = string
    datastore_id = string
    size = number
    ssd = bool
  }))
  description = "The disk parameters to use for the vm"
}

variable "kubernetes_cluster_name" {
  type = string
  default = "kubernetes"
  description = "kubernetes cluster name for talos"
}

variable "talos_virtual_ip" {
  type = string
  default = "172.16.69.16"
  description = "virtual ip address for kubernetes cluster"
}


