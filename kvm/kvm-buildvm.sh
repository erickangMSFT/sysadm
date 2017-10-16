#!/bin/bash

sudo adduser `id -un` kvm
sudo adduser `id -un` libvirtd

ubuntu-vm-builder kvm xenial \
    --domain template \
    --dest template \
    --arch amd64 \
    --hostname template \
    --mem 4096 \
    --cpus 2 \
    --swapsize 0 \
    --user erickang \
    --pass passwd \
    --mirror http://archive.localubuntumirror.net/ubuntu \
    --components 'main,universe,restricted' \
    --addpkg acpid \ 
    --addpkg vim \
    --addpkg openssh-server \
    --libvirt qemu:///system ;