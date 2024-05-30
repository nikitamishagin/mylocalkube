# My local Kubernetes

## Prepare ubuntu server

Create network bridge

```bash
sudo cp ./server/01-network-manager-all.yaml /etc/netplan/01-network-manager-all.yaml
sudo chmod 600 /etc/netplan/00-bridge.yaml
sudo netplan apply
```

## Add ignition to server

Create ignition directory

```bash
sudo mkdir /var/lib/libvirt/ignition/
```

Add base ignition file

```bash
cp ./ignition/base.json /var/lib/libvirt/ignition/base.json
```

Add AppArmor rules, allow qemu to access the config files:

```bash
echo "  # For ignition files" >> /etc/apparmor.d/abstractions/libvirt-qemu
echo "  /var/lib/libvirt/ignition/** r," >> /etc/apparmor.d/abstractions/libvirt-qemu
```

## Build and deploy nginx server

Build docker image

```bash
cd ./nginx
docker build -t nginx-file-server .
```

Run nginx container

```bash
docker run --rm -d --name nginx-file-server -p 80:80 nginx-file-server:latest
```

## Build ignition files from butane files (Optional)

Create ignition files

```bash
cat ./butane/flatcar0.yaml | docker run --rm -i quay.io/coreos/butane:release > ./ignition/flatcar0.json
```

## Upload ignition files to nginx server

```bash
curl -T ./ignition/flatcar0.json http://localhost/flatcar0.json
```

## Delete file from nginx server (Optional)

Delete with curl

```bash
curl -X DELETE http://localhost/flatcar0.json
```

## Create vms

Get flatcar image

```bash
cd /var/lib/libvirt/images/
sudo wget https://stable.release.flatcar-linux.net/amd64-usr/current/flatcar_production_qemu_image.img{,.sig}
gpg --verify flatcar_production_qemu_image.img.sig
```
Create a snapshot image

```bash
qemu-img create -f qcow2 -F qcow2 -b flatcar_production_qemu_image.img flatcar0.qcow2
```

Create new vm

```bash
virt-install \
  --name flatcar0 \
  --memory 3072 \
  --vcpus 2 \
  --os-variant generic \
  --disk /var/lib/libvirt/images/flatcar0.qcow2,bus=virtio,format=qcow2 \
  --vnc \
  --noautoconsole \
  --import \
  --qemu-commandline="-fw_cfg name=opt/org.flatcar-linux/config,file=/var/lib/libvirt/ignition/flatcar0.ign"
```
