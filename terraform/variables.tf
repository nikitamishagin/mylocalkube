variable "libvirt_url" {
  default     = "qemu:///system"
  type        = string
  description = "Path to connect to libvirt host"
}

variable "count_nodes" {
  default     = 2
  type        = number
  description = "The number of nodes that will be created"
}

variable "volume_base_image" {
  type        = string
  description = "OS image file"
}
variable "volume_pool" {
  default     = "default"
  type        = string
  description = "Image pool name"
}
variable "volume_size" {
  type        = number
  description = "Volume size"
}
variable "volume_format" {
  default     = "raw"
  type        = string
  description = "Image format"
}

variable "domain_vcpu" {
  default     = 1
  type        = number
  description = "Count of vcpu"
}
variable "domain_memory" {
  default     = 2048
  type        = number
  description = "Size of RAM"
}

variable "network_name" {
  default     = "default"
  type        = string
  description = "Network name"
}
variable "network_autostart" {
  default     = true
  type        = bool
  description = "Enable network autostart"
}
variable "network_mode" {
  default     = "nat"
  type        = string
  description = "Mode of network"
}
variable "network_bridge" {
  default     = ""
  type        = string
  description = "Beidge name"
}
variable "network_domain" {
  default     = ""
  type        = string
  description = "Domain name"
}
variable "network_addresses" {
  default     = [""]
  type        = list(string)
  description = "IP addresses for vm"
}

variable "ssh_authorized_keys" {
  type        = list(string)
  description = "ssh public keys"
}

variable "dns_enabled" {
  default     = false
  type        = bool
  description = "Enable dns service"
}
variable "dns_local_only" {
  default     = true
  type        = bool
  description = "Local only"
}
variable "dns_forwarders" {
  type = list(object({
    address = string
    domain  = string
  }))
  default = [
    {
      address = "1.1.1.1"
      domain  = ""
    },
    {
      address = "1.0.0.1"
      domain  = ""
    }
  ]
  description = "List of dns servers"

}

variable "ignition_url_kubeadm" {
  default     = ""
  type        = string
  description = "URL to kubeadm file"
}
variable "ignition_url_kubelet" {
  default     = ""
  type        = string
  description = "URL to kubelet file"
}
variable "ignition_url_kubectl" {
  default     = ""
  type        = string
  description = "URL to kubectl file"
}
variable "ignition_url_10_kubeadm_conf" {
  default     = ""
  type        = string
  description = "URL to 10-kubeadm.conf file"
}
