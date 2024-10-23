variable "kubernetes_version" {
  description = "A k8s kubelet version from https://github.com/siderolabs/kubelet/pkgs/container/kubelet"
  type = string
  default = "1.31.1"
}

variable "kubernetes_cluster_name" {
  description = "kubernetes cluster name for talos"
  type = string
  default = "kubernetes"
}

variable "talos_virtual_ip" {
  description = "virtual ip address for kubernetes cluster"
  type = string
  default = "172.16.69.16"
}

variable "talos_cluster_secrets" {
  description = "cluster secrets for talos to use"
  type = any
}

variable "node_ip" {
  description = "operating on node"
  type = string
}

variable "talos_version" {
  description = "a talos version from https://github.com/siderolabs/talos/releases"
  type = string
  default = "v1.8.1"
}

variable "talos_machine_type" {
  description = "The node type for talos"
  type = string

  validation {
    condition = contains(["controlplane", "worker"], var.talos_machine_type)
    error_message = "Invalid value. Must be controlplane or worker"
  }
}

variable "talos_patches" {
  description = "list of patches to apply to talos config"
  type = list(string)
}
