#/bin/bash

lxc delete master
lxc delete worker-node-1
lxc delete worker-node-2
lxc delete jumpbox
lxc list
