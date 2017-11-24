#!/bin/bash
kubectl drain k8s-agent1-erickang --delete-local-data --force --ignore-daemonsets
kubectl delete node k8s-agent1-erickang
kubectl drain k8s-agent2-erickang --delete-local-data --force --ignore-daemonsets
kubectl delete node k8s-agent2-erickang
sudo kubeadm reset