#!/bin/bash

apt-get install nfs-kernel-server


# update /etc/exports
/k8svolumes  10.135.0.0/16(rw,async,no_subtree_check,no_root_squash)

sudo chown -R nobody:nogroup /k8svolumes
sudo exportfs -ra

showmount -e kube

sudo systemctl start nfs-kernel-server.service
