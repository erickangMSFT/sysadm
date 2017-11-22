#!/bin/bash

apt-get -y install libosinfo-bin libguestfs-tools virt-top

# create a storage pool
mkdir -p /var/kvm/images 

virt-install \
--name template \
--ram 4096 \
--disk path=/var/kvm/images/template.img,size=50 \
--vcpus 2 \
--os-type linux \
--os-variant ubuntu16.04 \
--network bridge=br0 \
--graphics none \
--console pty,target_type=serial \
--location 'http://us.archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/' \
--extra-args 'console=ttyS0,115200n8 serial'

#k8s-node
virt-install \
--name k8snode \
--ram 4096 \
--disk path=/var/kvm/images/k8snode.img,size=50 \
--vcpus 2 \
--os-type linux \
--os-variant ubuntu16.04 \
--network bridge=br0 \
--graphics none \
--console pty,target_type=serial \
--location 'http://us.archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/' \
--extra-args 'console=ttyS0,115200n8 serial'

# During the installation do not enable SWAP. Kubernetes will not run if swap is enabled.

# after installation, back to KVM host and shutdown the guest like following
virsh shutdown k8snode 

# mount guest's disk and enable a service like following
guestmount -d k8snode -i /mnt 
ln -s /mnt/lib/systemd/system/getty@.service /mnt/etc/systemd/system/getty.target.wants/getty@ttyS0.service 
umount /mnt

