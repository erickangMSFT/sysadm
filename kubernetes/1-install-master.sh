#!/bin/bash

sudo kubeadm init --pod-network-cidr=111.111.0.0/16

# Make sure save the output from this kubeadm init and follow the instruction.
