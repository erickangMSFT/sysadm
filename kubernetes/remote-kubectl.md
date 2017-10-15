scp root@<master ip>:/etc/kubernetes/admin.conf .
kubectl --kubeconfig ./admin.conf proxy

mkdir .kube
cp admin.conf .kube/config
