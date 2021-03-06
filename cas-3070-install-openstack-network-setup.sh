#!/bin/bash

echo "Create router"
openstack router create router
echo "Create provider network"
./esmsagent.py --createprovidernetwork 192.168.2.0/24 192.168.2.101 192.168.2.150 192.168.2.200 8.8.8.8
echo "Create private nework"
openstack subnet create --network private_network --subnet-range 192.168.3.0/24 --gateway 192.168.3.1 private_subnet
openstack router add subnet router private_subnet
openstack floating ip create provider
