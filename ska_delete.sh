delvm=(bk8s-1 bk8s-2 ek8s-1 ek8s-2 ek8s-3  hk8s-1 hk8s-2 hk8s-3 ik8s-1 ik8s-2 ik8s-3  k8s-1 k8s-2 k8s-3  wk8s-1 wk8s-2 wk8s-3)
for t in ${delvm[@]}; do
  lxc delete -f $t
done
