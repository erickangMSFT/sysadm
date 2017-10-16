#!/bin/bash

lxc launch ubuntu:16.04 master -p default -p docker
lxc launch ubuntu:16.04 worker-node-1 -p default -p docker
lxc launch ubuntu:16.04 worker-node-2 -p default -p docker
lxc launch ubuntu:16:04 jumpbox -p default -p docker
lxc list
