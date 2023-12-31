
#!/bin/bash
# source code partially taken from https://github.com/justmeandopensource/kubernetes
# load $MASTER_IP that was copied from host to vm
source  /root/master_ip.sh
echo "join"
apt install -qq -y sshpass >/dev/null 2>&1
sshpass -p "1234" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $MASTER_IP:/join.sh /join.sh 2>/tmp/joincluster.log
bash -x /join.sh >> /tmp/joincluster.log 2>&1
