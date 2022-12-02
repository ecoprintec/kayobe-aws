#!/bin/bash
set -x #echo on

# sudo ip l add br0 type bridge
# sudo ip l set br0 up
# sudo ip a add 172.31.22.105/20 dev br0
# sudo ip l add dummy0 type dummy
# sudo ip l set dummy0 up
# sudo ip l set dummy0 master br0

cd ~/kayobe/src
git clone https://opendev.org/openstack/kayobe-config.git -b stable/yoga
cd kayobe-config

# cp ~/kayobe/src/kayobe-config/etc/kayobe/inventory/hosts.example ~/Work/kayobe-aws/config/hosts.example.ori
git rm etc/kayobe/inventory/hosts.example
cp ~/Work/kayobe-aws/config/hosts ~/kayobe/src/kayobe-config/etc/kayobe/inventory/hosts

# cp ~/kayobe/src/kayobe-config/etc/kayobe/inventory/group_vars/controllers/network-interfaces ~/Work/kayobe-aws/config/network-interfaces.ori
cp ~/Work/kayobe-aws/config/network-interfaces ~/kayobe/src/kayobe-config/etc/kayobe/inventory/group_vars/controllers/network-interfaces

# cp ~/kayobe/src/kayobe-config/etc/kayobe/networks.yml ~/Work/kayobe-aws/config/networks.yml.ori
cp ~/Work/kayobe-aws/config/networks.yml ~/kayobe/src/kayobe-config/etc/kayobe/networks.yml

cp ~/Work/kayobe-aws/config/network-allocation.yml ~/kayobe/src/kayobe-config/etc/kayobe/network-allocation.yml

# cp ~/kayobe/src/kayobe-config/etc/kayobe/globals.yml ~/Work/kayobe-aws/config/globals.yml.ori
cp ~/Work/kayobe-aws/config/globals.yml ~/kayobe/src/kayobe-config/etc/kayobe/globals.yml

# cp ~/kayobe/src/kayobe-config/etc/kayobe/controllers.yml ~/Work/kayobe-aws/config/controllers.yml.ori
cp ~/Work/kayobe-aws/config/controllers.yml ~/kayobe/src/kayobe-config/etc/kayobe/controllers.yml

# cp ~/kayobe/src/kayobe-config/etc/kayobe/kolla/globals.yml ~/Work/kayobe-aws/config/kolla-globals.yml.ori
cp ~/Work/kayobe-aws/config/kolla-globals.yml ~/kayobe/src/kayobe-config/etc/kayobe/kolla/globals.yml

git config --global user.email "ceo@ecoprintec.kr"
git config --global user.name "ecoprintec"

cd ~/kayobe/src/kayobe-config
git add etc/kayobe/inventory/hosts etc/kayobe/network-allocation.yml
git add --update
git commit -m "All in one scenario config"
