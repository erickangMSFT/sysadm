#!/bin/bash


#optional: monitoring tool

kubectl apply --namespace kube-system -f "https://cloud.weave.works/k8s/scope.yaml?k8s-version=$(kubectl version | base64 | tr -d '\n')"
kubectl port-forward -n kube-system "$(kubectl get -n kube-system pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040


# outdated
#flannel network - do not use flannel with kubeadm
#kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.0/Documentation/kube-flannel.yml

##Important to enable Kubernetes with kubeadm - do not use flannel pod network
# wget https://docs.projectcalico.org/v2.5/getting-started/kubernetes/installation/hosted/kubeadm/1.6/calico.yaml -O calico.yaml
#sed -i "s/192.168.0.0/'"$CALICO_IPV4POOL_CIDR"'/g" calico.yaml
#kubectl apply -f calico.yaml

