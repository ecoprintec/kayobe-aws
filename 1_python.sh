#!/bin/bash
set -x #echo on

sudo apt update
sudo apt install -y python3-dev python3-virtualenv gcc libffi-dev

sudo apt install -y git
sudo apt install -y python-is-python3

mkdir ~/kayobe

cd ~/kayobe/
mkdir -p src venvs

cd ~/kayobe/src
git clone https://opendev.org/openstack/kayobe.git -b stable/yoga

virtualenv ~/kayobe/venvs/kayobe
