libvirt_url = "qemu+tcp://192.168.100.44/system"

count_nodes = 3

volume_base_image = "flatcar_production_qemu_image.img"
ubuntu_base_image = "noble-server-cloudimg-amd64.img"
volume_pool       = "images"
volume_size       = 16106127360
volume_format     = "qcow2"

domain_vcpu   = 2
domain_memory = 3072
ubuntu_vcpu   = 2
ubuntu_memory = 3072

network_name      = "main"
network_mode      = "bridge"
network_bridge    = "br0"
network_domain    = ""
network_addresses = [""]

dns_enabled    = true
dns_local_only = false
dns_forwarders = [
  {
    address = "1.1.1.1"
    domain  = ""
  },
  {
    address = "1.0.0.1"
    domain  = ""
  }
]

network_config = [
  "[Match]\nName=eth0\n\n[Network]\nAddress=192.168.100.101/24\nGateway=192.168.100.1\nDNS=1.1.1.1\nDNS=1.0.0.1",
  "[Match]\nName=eth0\n\n[Network]\nAddress=192.168.100.102/24\nGateway=192.168.100.1\nDNS=1.1.1.1\nDNS=1.0.0.1",
  "[Match]\nName=eth0\n\n[Network]\nAddress=192.168.100.103/24\nGateway=192.168.100.1\nDNS=1.1.1.1\nDNS=1.0.0.1"
]
ignition_url_kubeadm         = "http://192.168.100.44/kubeadm"
ignition_url_kubelet         = "http://192.168.100.44/kubelet"
ignition_url_kubectl         = "http://192.168.100.44/kubectl"
ignition_url_10_kubeadm_conf = "http://192.168.100.44/10-kubeadm.conf"

ssh_authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC0NcIPnKYnNbkoKTKSM5UYUeeFzLVsdmBikS1t3JDZT8GfSq1vUurJUSQmQPhjiVZjeMshqvIU4PuDu6cPu90XAlKcbr/+TbFf25jgw5qxnLVmN0C5+lZvHFo8lM+W669ej6eEKACJmDKBL/4oIc+zYKujlqHo3xI9SkFyyjyJFqRkL3gwCvurrgEMBuu9dhmYxfVE/WGd17wckHl3cP+Rdwk7hCK4eo3KvrJ/sii8hbwEph0oFkTv7nEuj3pKobOZArYWMamSOqou6f7IgW4w/Y0iFow8o9fKEMBuEtnZUq7YkTE9T9pPiwWR0BkmKpVFY1SWaw0utEg8FCH2uUFyS28+YlSW97gcruK/X7+9BBqSiA23iGrwRCMew4pJtV6q6MRyeK65PHupPUPybt8gmkikrDjs5b1Ol2/DnxtGoQVObXtOtl8TvKTYsJRJo8E81++EhRCl36fQ1vVkteaSZJm2p8ogo8umSy5ymu/OQdLP+d8d5stGzfV8681Xp/EJ4ruvDFuCWe9BOJ3gLyjff5Xcqd1oaMwDh0F+qPFS9iKQ0B0lyPGI4z++RRLJqKIliU2OSrK/V0yyOeG3Tg7kN/AyLo7W+D0J6J1kGLUD/7jn7RCV7aWidWduH9TP8Ajd4wfBvCZJUQ7ffwo7ssfA5LTuxep3EdD2cY2TX61Glw== n.mishagin@ubuntu-laptop"]
