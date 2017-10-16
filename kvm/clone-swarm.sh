virt-clone --original template --name swarm-master --file /var/kvm/images/swarm-master.img 
virt-clone --original template --name swarm-agent1 --file /var/kvm/images/swarm-agent1.img
virt-clone --original template --name swarm-agent2 --file /var/kvm/images/swarm-agent2.img 



#vim /etc/hosts
#vim /etc/hostname
