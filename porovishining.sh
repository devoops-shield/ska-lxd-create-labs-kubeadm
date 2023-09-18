lxc profile create vm
cat ./vm-profile | lxc profile edit vm
config:
   user.user-data: |
     #cloud-config
     ssh_pwauth: yes
     
     users:
       - name: ubuntu
         passwd: "$6$iBF0eT1/6UPE2u$V66Rk2BMkR09pHTzW2F.4GHYp3Mb8eu81Sy9srZf5sVzHRNpHP99JhdXEVeN0nvjxXVmoA6lcVEhOOqWEd3Wm0"
         lock_passwd: false
         groups: lxd
         shell: /bin/bash
         sudo: ALL=(ALL) NOPASSWD:ALL
description: LXD profile for virtual machines
devices:
  config:
    source: cloud-init:config
    type: disk
name: vm
used_by:
