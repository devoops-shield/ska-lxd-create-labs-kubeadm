#!/bin/bash
# source code partially from https://github.com/justmeandopensource/kubernetes
echo "pull config images"
kubeadm config images pull >/dev/null 2>&1
echo "init k8s cluster"
kubeadm init --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors=all >> /root/kubeinit.log 2>&1
echo "cp config to .kube"
mkdir -p /root/.kube
cp /etc/kubernetes/admin.conf /root/.kube/config  
echo "install calico"
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.1/manifests/tigera-operator.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.1/manifests/custom-resources.yaml
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl taint nodes --all  node-role.kubernetes.io/control-plane-
echo "save join sh file"
JOIN_COMMAND=$(kubeadm token create --print-join-command 2>/dev/null) 
echo "$JOIN_COMMAND --ignore-preflight-errors=all" > /join.sh
