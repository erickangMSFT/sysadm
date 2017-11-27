#!/bin/bash
#on each agent node,
sudo sysctl net.bridge.bridge-nf-call-iptables=1

# run kubeadm --join commnad by pasting it from master's kubeadm --init command result.