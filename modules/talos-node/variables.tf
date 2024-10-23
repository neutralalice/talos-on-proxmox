variable "num" {
  description = "The number of desired nodes"
  type = number
  default = 3
}

variable "hostname_prefix" {
  description = "Hostname prefix of the nodes"
  type        = string
  default     = "k8s"
}
variable "tags" {
  description = "tags to apply to the nodes"
  type = list(string)
  default = []
}
variable "startup" {
  description = "Startup priority for the node"
  type = string
  default = "1"
}

variable "cpu_cores" {
  description = "The cpu cores allocated to nodes"
  type = number
  default = 2
}

variable "cpu_type" {
  description = "The microarchitecture level assigned to nodes"
  type = string
  default = "x86-64-v2"
}

variable "memory" {
  description = "The memory allocated to nodes"
  type = number
  default = 5120
}

variable "bridge" {
  description = "The default network bridge of nodes"
  type = string
  default = "vmbr0"
}

variable "disk" {
  description = "The disk parameters to use for nodes"
  type = map(object({
    file_id = string
    interface = string
    datastore_id = string
    size = number
    ssd = bool
  }))
}

variable "agent" {
  description = "Set proxmox to enable the QEMU agent services"
  type = bool
  default = true
}
