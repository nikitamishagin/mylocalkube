libvirt_url = "qemu+tcp://192.168.100.44/system"

base_image = "flatcar_production_qemu_image.img"
pool = "images"
volume_size = 16106127360
volume_format = "qcow2"

count_nodes = 3
vcpu = 2
memory = 3072

ssh_authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC0NcIPnKYnNbkoKTKSM5UYUeeFzLVsdmBikS1t3JDZT8GfSq1vUurJUSQmQPhjiVZjeMshqvIU4PuDu6cPu90XAlKcbr/+TbFf25jgw5qxnLVmN0C5+lZvHFo8lM+W669ej6eEKACJmDKBL/4oIc+zYKujlqHo3xI9SkFyyjyJFqRkL3gwCvurrgEMBuu9dhmYxfVE/WGd17wckHl3cP+Rdwk7hCK4eo3KvrJ/sii8hbwEph0oFkTv7nEuj3pKobOZArYWMamSOqou6f7IgW4w/Y0iFow8o9fKEMBuEtnZUq7YkTE9T9pPiwWR0BkmKpVFY1SWaw0utEg8FCH2uUFyS28+YlSW97gcruK/X7+9BBqSiA23iGrwRCMew4pJtV6q6MRyeK65PHupPUPybt8gmkikrDjs5b1Ol2/DnxtGoQVObXtOtl8TvKTYsJRJo8E81++EhRCl36fQ1vVkteaSZJm2p8ogo8umSy5ymu/OQdLP+d8d5stGzfV8681Xp/EJ4ruvDFuCWe9BOJ3gLyjff5Xcqd1oaMwDh0F+qPFS9iKQ0B0lyPGI4z++RRLJqKIliU2OSrK/V0yyOeG3Tg7kN/AyLo7W+D0J6J1kGLUD/7jn7RCV7aWidWduH9TP8Ajd4wfBvCZJUQ7ffwo7ssfA5LTuxep3EdD2cY2TX61Glw== n.mishagin@ubuntu-laptop"]