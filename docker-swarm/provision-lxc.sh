#!/bin/bash

sudo apt-get install lxc

echo 'erickang veth lxcbr0 10' | tee -a /etc/lxc/lxc-usernet
mkdir ~/.config/lxc
cp /etc/lxc/default.conf ~/.config/lxc
echo 'lxc.id_map = u 0 165536 65536' | tee -a ~/.config/lxc/default.conf
echo 'lxc.id_map = g 0 165536 65536' | tee -a ~/.config/lxc/default.conf
lxc-create -t download -n master
lxc-create -t download -n worker-node-1
lxc-create -t download -n worker-node-2

lxc-ls -f
