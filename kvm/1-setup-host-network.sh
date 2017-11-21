#!/bin/bash

sudo apt-get install qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker
modprobe vhost_net 
lsmod | grep vhost 

echo vhost_net >> /etc/modules 
vim /etc/network/interfaces

# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto ens33
# change like follows
iface ens33 inet manual
#iface ens33 inet static
#address 10.0.0.30
#network 10.0.0.0
#netmask 255.255.255.0
#broadcast 10.0.0.255
#gateway 10.0.0.1
#dns-nameservers 10.0.0.30
# add bridge interface
iface br0 inet static
address 10.0.0.30
network 10.0.0.0
netmask 255.255.255.0
broadcast 10.0.0.255
gateway 10.0.0.1
dns-nameservers 10.0.0.30
bridge_ports ens33
bridge_stp off
auto br0

#

sudo systemctl restart networking

