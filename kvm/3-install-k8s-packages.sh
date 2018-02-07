#!/bin/bash

#run virsh
#run start k8snode in virsh prompt
#run console k8snode in virsh promt
#run following in k8snode as sudo su
#exit k8snode with CTRL+]
#run shutdown k8snode in virsh prompt

# ------------ script to run in k8snode

sudo apt install -y ebtables ethtool

sudo apt-get update
sudo apt-get install -y docker.io
sudo apt-get install -y apt-transport-https

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo deb http://apt.kubernetes.io/ kubernetes-xenial main | sudo tee -a -i /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl nfs-common

sudo usermod -aG docker $USER

sudo sysctl net.bridge.bridge-nf-call-iptables=1
# ufw enable
# ufw allow 22
# ufw allow 80
# ufw allow 6443
# ufw allow 2379:2380/tcp
# ufw allow 10250	
# ufw allow 10251
# ufw allow 10252
# ufw allow 10255
# ufw allow 30000:32767/tcp

#------end of script
