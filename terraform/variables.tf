variable "libvirt_url" {
    default = "qemu:///system"
    type = string
    description = "Path to connect to libvirt host" 
}

variable "count_nodes" {
    default = 2
    type = number
    description = "The number of nodes that will be created"
}
variable "base_image" {
    type = string
    description = "OS image file"
}
variable "pool" {
    default = "default"
    type = string
    description = "Image pool name"  
}
variable "volume_size" {
    type = number
    description = "Volume size"  
}
variable "volume_format" {
    default = "raw"
    type = string
    description = "Image format"
}

variable "vcpu" {
    default = 1
    type = number
    description = "Count of vcpu"
}
variable "memory" {
    default = 2048
    type = number
    description = "Size of RAM"
}

variable "ssh_authorized_keys" {
    type = list(string)
    description = "ssh public keys"
}