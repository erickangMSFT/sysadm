#!/bin/bash

#sudo adduser `id -un` kvm
#sudo adduser `id -un` libvirtd

ubuntu-vm-builder kvm xenial \ 
    --verbose \
    --domain template \
    --dest template \
    --arch amd64 \
    --hostname template \
    --mem 4096 \
    --cpus 2 \
    --swapsize 0 \
    --user erickang \
    --pass passwd \
    --mirror http://us.archive.ubuntu.com/ubuntu \
    --components 'main,universe,restricted' \
    --addpkg acpid \ 
    --addpkg vim \
    --addpkg openssh-server \
    --addpkg avahi-daemon \
    --libvirt qemu:///system ;