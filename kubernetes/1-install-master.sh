#!/bin/bash

export CALICO_IPV4POOL_CIDR=172.16.0.0
kubeadm init --pod-network-cidr=$CALICO_IPV4POOL_CIDR/16

#sudo kubeadm init --pod-network-cidr=111.111.0.0/16 --network-plugin=cni #--token-ttl 0

# Make sure save the output from this kubeadm init and follow the instruction.
