echo "Creating ignite master node..."
lxc launch ubuntu:20.04 wk8s-1 --vm --profile default --profile vm
lxc launch ubuntu:20.04 wk8s-2 --vm --profile default --profile vm
echo "Creating ignite worker nodes..."
lxc launch ubuntu:20.04 wk8s-3 --vm --profile default --profile vm
echo "Creating ignite worker nodes..."
sleep 90
export MASTER_IP=$(lxc exec wk8s-1 -- sudo  --user ubuntu --login sudo -s hostname -I | awk '{print $1}')
echo "export MASTER_IP=$MASTER_IP" > master_ip.sh
cat common.sh | lxc exec wk8s-1 -- sudo  --user ubuntu --login sudo -s
cat master.sh | lxc exec wk8s-1 -- sudo  --user ubuntu --login sudo -s
lxc file push  master_ip.sh wk8s-2/root/master_ip.sh
lxc file push  master_ip.sh wk8s-3/root/master_ip.sh
cat common.sh | lxc exec wk8s-2 -- sudo  --user ubuntu --login sudo -s
cat worker.sh | lxc exec wk8s-2 -- sudo  --user ubuntu --login sudo -s
cat common.sh | lxc exec wk8s-3 -- sudo  --user ubuntu --login sudo -s
cat worker.sh | lxc exec wk8s-3 -- sudo  --user ubuntu --login sudo -s




