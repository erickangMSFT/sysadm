#!/bin/bash

sudo sysctl net.ipv4.conf.all.forwarding=1
sudo systemctl stop kubelet
sudo systemctl stop docker
sudo iptables --flush
sudo iptables -tnat --flush
sudo systemctl start kubelet
sudo systemctl start docker