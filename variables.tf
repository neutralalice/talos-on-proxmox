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
  default     = "v1.8.1"
  description = "Pick release from https://github.com/siderolabs/talos/releases"
}

variable "talos_architecture" {
  type = string
  default = "amd64"
  description = "The architecture of the talos image"
}

variable "talos_platform" {
  type = string
  default = "nocloud"
  description = "The platform offering of the image(metal or cloud)"
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
  description = "Hostname prefix of the control planes"
}

variable "ctrl_startup" {
  type = string
  default = "1"
  description = "Startup priority for control planes. This should be a lower value than node_startup"
}

variable "ctrl_cpu_cores" {
  type = number
  default = 2
  description = "The cpu cores allocated to control planes"
}

variable "ctrl_cpu_type" {
  type = string
  default = "x86-64-v3"
  description = "The microarchitecture level assigned to control planes"
}

variable "ctrl_memory" {
  type = number
  default = 5120
  description = "The memory allocated to control planes"
}

variable "ctrl_disk" {
  type = map(object({
    interface = string
    datastore_id = string
    size = number
    ssd = bool
  }))
  description = "The disk parameters to use for control planes"
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

variable "node_startup" {
  type = string
  default = "3"
  description = "Startup priority for worker nodes. This should be a higher value than ctrl_startup"
}

variable "node_cpu_cores" {
  type = number
  default = 2
  description = "The cpu cores allocated to worker nodes"
}

variable "node_cpu_type" {
  type = string
  default = "x86-64-v3"
  description = "The microarchitecture level assigned to worker nodes"
}
variable "node_memory" {
  type = number
  default = 6144
  description = "The memory allocated to worker nodes"
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
