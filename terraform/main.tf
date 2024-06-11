terraform {
  required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = ">= 0.6.2"
    }
    ignition = {
      source = "community-terraform-providers/ignition"
    }
  }
}

provider "libvirt" {
  uri = var.libvirt_url
}
