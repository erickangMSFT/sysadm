virt-clone --original template --name master --file /var/kvm/images/master.img --replace
virt-clone --original template --name agent1 --file /var/kvm/images/agent1.img --replace
virt-clone --original template --name agent2 --file /var/kvm/images/agent2.img --replace



#vim /etc/hosts
#vim /etc/hostname
