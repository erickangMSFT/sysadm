#!/bin/bash

#export POD_IPV4POOL_CIDR=172.16.0.0
export POD_IPV4POOL_CIDR=192.168.0.0
export MASTER_NODE_IP=192.168.1.129
kubeadm init --pod-network-cidr=$POD_IPV4POOL_CIDR/16 --apiserver-advertise-address=$MASTER_NODE_IP

#install weabe-net pod network
sysctl net.bridge.bridge-nf-call-iptables=1
export kubever=$(kubectl version | base64 | tr -d '\n')
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"

#sudo kubeadm init --pod-network-cidr=111.111.0.0/16 --network-plugin=cni #--token-ttl 0
#kubectl apply -f https://docs.projectcalico.org/v2.6/getting-started/kubernetes/installation/hosted/kubeadm/1.6/calico.yaml

# Make sure save the output from this kubeadm init and follow the instruction.