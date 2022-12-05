# kayobe-aws
- 20221202 실패 | first commit 버전(3f71d16) | Asnsible 배포 중 네트워크 끊김 | AWS Console로 확인 해 볼것

## git
```
mkdir Work
cd Work
git clone https://github.com/ecoprintec/kayobe-aws.git
cd kayobe-aws
```

## Install openstack with all-in-one of kayobe
https://docs.openstack.org/kayobe/latest/installation.html
```
sh 0_network.sh
sh 1_python.sh

source ~/kayobe/venvs/kayobe/bin/activate
sh 2_kayobe.sh

cd ~/kayobe
kayobe complete > kayobe-complete
source kayobe-complete

cd ~/Work/kayobe-aws/
sh 3_configure.sh

source ~/kayobe/src/kayobe-config/kayobe-env
sh 4_all-in-one.sh

cat ~/kayobe/src/kayobe-config/etc/kayobe/kolla/passwords.yml
cp ~/kayobe/src/kayobe-config/etc/kayobe/kolla/passwords.yml ~/kayobe/passwords.yml
```

## Openstack Post Deploy
```
pip install python-openstackclient
export EXT_NET_CIDR=172.31.16.0/20
export EXT_NET_GATEWAY=172.31.16.1
export EXT_NET_RANGE="start=172.31.22.4,end=172.31.22.254"
kayobe kolla ansible run post-deploy -ke node_config_directory=${KOLLA_CONFIG_PATH}
kayobe playbook run ~/kayobe/src/kayobe/ansible/public-openrc.yml
source "${KOLLA_CONFIG_PATH:-/etc/kolla}/admin-openrc.sh"
${KOLLA_SOURCE_PATH}/tools/init-runonce
```

## Openstack Command
```
source "${KOLLA_CONFIG_PATH:-/etc/kolla}/admin-openrc.sh"
openstack user list
openstack endpoint list
openstack network list
openstack subnet list
openstack image list
openstack host list
openstack volume list
openstack volume type list
openstack volume service list
openstack volume group list --os-volume-api-version 3.13
openstack volume group type list
openstack volume group type list --os-volume-api-version 3.13
openstack availability zone list
```

## Horizon
```
http://172.31.22.105
User Name : admin
Password : passwords.yml -> keystone_admin_password
```
