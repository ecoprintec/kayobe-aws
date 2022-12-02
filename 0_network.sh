#!/bin/bash
set -x #echo on

ip a
ip route

sudo cp /etc/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml.ori

cat << EOF | sudo tee -a /etc/netplan/50-cloud-init.yaml
    bridges:
        br0:
            dhcp4: true
            dhcp6: false
            interfaces:
                - eth0
EOF

sudo netplan --debug generate
sudo netplan apply

ip a
ip route
