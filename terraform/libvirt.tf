resource "libvirt_volume" "drive" {
  name             = "flatcar${count.index + 1}.${var.volume_format}"
  count            = var.count_nodes
  base_volume_name = var.volume_base_image
  pool             = var.volume_pool
  size             = var.volume_size
  format           = var.volume_format
}

resource "libvirt_volume" "ubuntu_drive" {
  name             = "ubuntu_gobgp"
  base_volume_name = var.ubuntu_base_image
  pool             = var.volume_pool
  size             = var.volume_size
  format           = var.volume_format
}

resource "libvirt_cloudinit_disk" "ubuntu_init" {
  name           = "ubuntu_init.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = var.volume_pool
}

resource "libvirt_ignition" "ignition" {
  name    = "flatcar${count.index + 1}-ignition.json"
  pool    = var.volume_pool
  count   = var.count_nodes
  content = element(data.ignition_config.ignition.*.rendered, count.index)
}

resource "libvirt_network" "network" {
  name      = var.network_name
  autostart = var.network_autostart
  mode      = var.network_mode
  bridge    = var.network_bridge
  domain    = var.network_domain
  addresses = var.network_addresses
  dns {
    enabled    = var.dns_enabled
    local_only = var.dns_local_only
    dynamic "forwarders" {
      for_each = var.dns_forwarders
      content {
        address = forwarders.value["address"]
        domain  = forwarders.value["domain"]
      }
    }
  }
}

resource "libvirt_domain" "node" {
  count  = var.count_nodes
  name   = "flatcar${count.index + 1}"
  vcpu   = var.domain_vcpu
  memory = var.domain_memory
  disk {
    volume_id = element(libvirt_volume.drive.*.id, count.index)
  }
  network_interface {
    network_id = libvirt_network.network.id
  }
  coreos_ignition = element(libvirt_ignition.ignition.*.id, count.index)
  fw_cfg_name     = "opt/org.flatcar-linux/config"
}

resource "libvirt_domain" "ubuntu" {
  name   = "ubuntu-gobgp"
  vcpu   = var.ubuntu_vcpu
  memory = var.ubuntu_memory
  disk {
    volume_id = libvirt_volume.ubuntu_drive.id
  }
  network_interface {
    network_id = libvirt_network.network.id
  }
  cloudinit = libvirt_cloudinit_disk.ubuntu_init.id
}
