#!/bin/bash

#export POD_IPV4POOL_CIDR=172.16.0.0
export POD_IPV4POOL_CIDR=10.244.0.0
export MASTER_NODE_IP=10.135.9.19
sudo kubeadm init --pod-network-cidr=$POD_IPV4POOL_CIDR/16 --apiserver-advertise-address=$MASTER_NODE_IP > k8s.txt

