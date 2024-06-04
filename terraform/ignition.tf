data "ignition_config" "ignition" {
  users = [
    data.ignition_user.core.rendered,
  ]
  files = [
    element(data.ignition_file.hostname.*.rendered, count.index),
    data.ignition_file.kubeadm.rendered,
    data.ignition_file.kubelet.rendered,
    data.ignition_file.kubectl.rendered,
    data.ignition_file.kubeadm_conf.rendered
  ]
  systemd = [data.ignition_systemd_unit.kubelet.rendered]
  count   = var.count_nodes
}

data "ignition_file" "hostname" {
  path = "/etc/hostname"
  mode = 420
  content {
    content = "flatcar${count.index + 1}"
  }
  count = var.count_nodes
}

data "ignition_file" "kubeadm" {
  path = "/opt/bin/kubeadm"
  mode = 493
  source {
    source = var.ignition_url_kubeadm
  }
}
data "ignition_file" "kubelet" {
  path = "/opt/bin/kubelet"
  mode = 493
  source {
    source = var.ignition_url_kubelet
  }
}
data "ignition_file" "kubectl" {
  path = "/opt/bin/kubectl"
  mode = 493
  source {
    source = var.ignition_url_kubectl
  }
}
data "ignition_file" "kubeadm_conf" {
  path = "/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  source {
    source = var.ignition_url_10_kubeadm_conf
  }
}

data "ignition_systemd_unit" "kubelet" {
  name    = "kubelet.service"
  content = "[Unit]\nDescription=kubelet: The Kubernetes Node Agent\nDocumentation=https://kubernetes.io/docs/home/\nWants=network-online.target\nAfter=network-online.target\n\n[Service]\nExecStart=/usr/bin/kubelet\nRestart=always\nStartLimitInterval=0\nRestartSec=10\n\n[Install]\nWantedBy=multi-user.target"
}

data "ignition_user" "core" {
  name = "core"

  ssh_authorized_keys = var.ssh_authorized_keys
}
