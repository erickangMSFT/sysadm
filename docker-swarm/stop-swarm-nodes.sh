#!/bin/bash

lxc stop worker-node-1
lxc stop worker-node-2
lxc stop master
lxc stop jumpbox
lxc list

#lxc-destroy -n <node>
