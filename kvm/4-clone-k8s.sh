#!/bin/bash

#run as sudo su

virt-clone --original k8smaster --name master --file /var/kvm/images/master.img --replace
guestmount -d master -i /mnt
sed -i '2s/.*/127.0.1.1 master/' /mnt//etc/hosts
sed -i '1s/.*/master/' /mnt/etc/hostname
umount /mnt


virt-clone --original k8sworker --name node1 --file /var/kvm/images/node1.img --replace
guestmount -d agent1 -i /mnt
sed -i '2s/.*/127.0.1.1 node1/' /mnt/etc/hosts
sed -i '1s/.*/node1/' /mnt/etc/hostname
umount /mnt

virt-clone --original k8sworker --name node2 --file /var/kvm/images/node2.img --replace
guestmount -d agent2 -i /mnt
sed -i '2s/.*/127.0.1.1 node2/' /mnt/etc/hosts
sed -i '1s/.*/node2/' /mnt/etc/hostname
umount /mnt

# virt-clone --original k8sworker --name node3 --file /var/kvm/images/node3.img --replace
# guestmount -d agent3 -i /mnt
# sed -i '2s/.*/127.0.1.1 node3/' /mnt/etc/hosts
# sed -i '1s/.*/node3/' /mnt/etc/hostname
# umount /mnt

