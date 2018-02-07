#!/bin/bash

apt-get -y install libosinfo-bin libguestfs-tools virt-top

# create a storage pool
mkdir -p /var/kvm/images 

#k8smaster
virt-install \
--name k8smaster \
--ram 2048 \
--disk path=/var/kvm/images/k8smaster.img,size=50 \
--vcpus 2 \
--os-type linux \
--os-variant ubuntu16.04 \
--network bridge=virbr0 \
--graphics none \
--console pty,target_type=serial \
--location 'http://us.archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/' \
--extra-args 'console=ttyS0,115200n8 serial'

# During the installation do not enable SWAP. Kubernetes will not run if swap is enabled.

# after installation, back to KVM host and shutdown the guest like following
virsh shutdown k8smaster 

# mount guest's disk and enable a service like following
sudo guestmount -d k8smaster -i /mnt 
sudo ln -s /mnt/lib/systemd/system/getty@.service /mnt/etc/systemd/system/getty.target.wants/getty@ttyS0.service 
sudo umount /mnt

#k8snode
virt-install \
--name k8sworker \
--ram 4096 \
--disk path=/var/kvm/images/k8sworker.img,size=50 \
--vcpus 2 \
--os-type linux \
--os-variant ubuntu16.04 \
--network bridge=virbr0 \
--graphics none \
--console pty,target_type=serial \
--location 'http://us.archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/' \
--extra-args 'console=ttyS0,115200n8 serial'

# During the installation do not enable SWAP. Kubernetes will not run if swap is enabled.

# after installation, back to KVM host and shutdown the guest like following
virsh shutdown k8sworker 

# mount guest's disk and enable a service like following
sudo guestmount -d k8sworker -i /mnt 
sudo ln -s /mnt/lib/systemd/system/getty@.service /mnt/etc/systemd/system/getty.target.wants/getty@ttyS0.service 
sudo umount /mnt

