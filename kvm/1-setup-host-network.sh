#!/bin/bash

sudo apt-get install qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker
modprobe vhost_net 
lsmod | grep vhost 
echo vhost_net >> /etc/modules 


# vim /etc/network/interfaces
# edit your /etc/network/interfaces file. Make sure to update the network device name to your PC's device name

#-----------------------------
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
#auto eno1
#iface eno1 inet dhcp
# This is an autoconfigured IPv6 interface
#iface eno1 inet6 auto

auto br0
iface br0 inet dhcp
bridge_ports eno1
bridge_stp off
bridge_fd 0
bridge_maxwait 0
#--------------------------

sudo systemctl restart networking

