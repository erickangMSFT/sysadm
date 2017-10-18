

apt-get install nfs-kernel-server


# update /etc/exports
/k8svolumes  *(rw,all_squash)

sudo chown -R nobody:nogroup /k8svolumes
sudo exportfs -a

showmount -e kube

sudo systemctl start nfs-kernel-server.service