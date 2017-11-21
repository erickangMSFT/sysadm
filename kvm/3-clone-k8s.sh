virt-clone --original k8snode --name master --file /var/kvm/images/master.img --replace
guestmount -d master -i /mnt
sed -i '2s/.*/127.0.1.1     k8s-master-erickang/' /mnt//etc/hosts
sed -i '1s/.*/k8s-master-erickang/' /mnt/etc/hostname
umount /mnt


virt-clone --original k8snode --name agent1 --file /var/kvm/images/agent1.img --replace
guestmount -d agent1 -i /mnt
sed -i '2s/.*/127.0.1.1     k8s-agent1-erickang/' /mnt/etc/hosts
sed -i '1s/.*/k8s-agent1-erickang/' /mnt/etc/hostname
umount /mnt

virt-clone --original k8snode --name agent2 --file /var/kvm/images/agent2.img --replace
guestmount -d agent2 -i /mnt
sed -i '2s/.*/127.0.1.1     k8s-agent2-erickang/' /mnt/etc/hosts
sed -i '1s/.*/k8s-agnet2-erickang/' /mnt/etc/hostname
umount /mnt

virt-clone --original k8snode --name agent3 --file /var/kvm/images/agent3.img --replace
guestmount -d agent3 -i /mnt
sed -i '2s/.*/127.0.1.1     k8s-agent3-erickang/' /mnt/etc/hosts
sed -i '1s/.*/k8s-agent3-erickang/' /mnt/etc/hostname
umount /mnt

