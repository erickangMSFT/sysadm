apt-get -y install libosinfo-bin libguestfs-tools virt-top

# create a storage pool
mkdir -p /var/kvm/images 

virt-install \
--name template \
--ram 4096 \
--disk path=/var/kvm/images/template.img,size=50 \
--vcpus 2 \
--os-type linux \
--os-variant ubuntu16.04 \
--network bridge=br0 \
--graphics none \
--console pty,target_type=serial \
--location 'http://us.archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/' \
--extra-args 'console=ttyS0,115200n8 serial'


Starting install...     # installation starts

# after installation, back to KVM host and shutdown the guest like follows
virsh shutdown template 

# mount guest's disk and enable a service like follows
guestmount -d template -i /mnt 
ln -s /mnt/lib/systemd/system/getty@.service /mnt/etc/systemd/system/getty.target.wants/getty@ttyS0.service 
umount /mnt

virsh start template --console 
