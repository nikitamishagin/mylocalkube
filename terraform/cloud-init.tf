data "template_file" "user_data" {
  template = file("${path.module}/cloud-init.yaml")
}

data "template_file" "network_config" {
  template = file("${path.module}/network-config.yaml")
}
