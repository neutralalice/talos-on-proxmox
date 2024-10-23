variable "talos_version" {
  description = "Pick release from https://github.com/siderolabs/talos/releases"
  type        = string
  default     = "v1.8.1"
}

variable "talos_architecture" {
  description = "The architecture of the talos image"
  type = string
  default = "amd64"
}

variable "talos_platform" {
  description = "The platform offering of the image(metal or cloud)"
  type = string
  default = "nocloud"
}

variable "talos_extensions" {
  description = "The default extensions for the talos image"
  type = list(string)
  default = ["i915-ucode","intel-ucode","qemu-guest-agent"]
}

variable "talos_image_datastore_id" {
  description =  "Datastore to use for talos image"
  type = string
  default = "local"
}

variable "talos_image_datastore_nodename" {
  description =  "node to connect to for datastore"
  type = string
  default = "pve1"
}
