data "ignition_config" "ignition" {
  users = [
    data.ignition_user.core.rendered,
  ]

  files = [
    element(data.ignition_file.hostname.*.rendered, count.index)
  ]

  count = var.count_nodes
}

data "ignition_file" "hostname" {
  path       = "/etc/hostname"
  mode       = 420

  content {
    content = "flatcar${count.index + 1}"
  }

  count = var.count_nodes
}

data "ignition_user" "core" {
  name = "core"

  ssh_authorized_keys = var.ssh_authorized_keys
}
