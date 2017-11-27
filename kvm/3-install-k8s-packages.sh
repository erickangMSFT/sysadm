#!/bin/bash

#run virsh
#run start k8snode in virsh prompt
#run console k8snode in virsh promt
#run following in k8snode as sudo su
#exit k8snode with CTRL+]
#run shutdown k8snode in virsh prompt

# ------------ script to run in k8snode

apt install ebtables ethtool

apt-get update
apt-get install -y docker.io

apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl nfs-common

sudo usermod -aG docker $USER

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