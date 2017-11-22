#!/bin/bash

virsh destroy agent3
virsh undefine agent3
virsh destroy agent2
virsh undefine agent2
virsh destroy agent1
virsh undefine agent1
virsh destroy master
virsh undefine master

