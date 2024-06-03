resource "libvirt_volume" "drive" {
    name             = "flatcar${count.index + 1}.${var.volume_format}"
    count            = var.count_nodes
    base_volume_name = var.base_image
    pool             = var.pool
    size             = var.volume_size
    format           = var.volume_format
}

resource "libvirt_ignition" "ignition" {
    name    = "flatcar${count.index + 1}-ignition.json"
    pool    = var.pool
    count   = var.count_nodes
    content = element(data.ignition_config.ignition.*.rendered, count.index)
}

resource "libvirt_domain" "node" {
    count  = var.count_nodes
    name   = "flatcar${count.index + 1}"
    vcpu   = var.vcpu
    memory = var.memory

    disk {
      volume_id = element(libvirt_volume.drive.*.id, count.index)
    }

    coreos_ignition = element(libvirt_ignition.ignition.*.id, count.index)
    fw_cfg_name     = "opt/org.flatcar-linux/config"
}
