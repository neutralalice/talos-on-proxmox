# Proxmox
variable "pve_endpoint_ip" {
  description = "The ip address associated with a pve api node"
  type = string
}

variable "pve_endpoint_port" {
  description = "The port associated with a pve api node"
  type = string
  default = "8006"
}

variable "pve_ssh_username" {
  description = "(SECRET) The username to connect for some commands over ssh"
  type = string
  sensitive = true
}

variable "pve_api_token" {
  description = "(SECRET) The api_token for provisionary user"
  type = string
  sensitive = true
}
