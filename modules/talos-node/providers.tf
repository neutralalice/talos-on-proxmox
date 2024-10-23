terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = ">= 0.66.1"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.12.1"
    }
  }
  required_version = ">= 1.8.2"
}
