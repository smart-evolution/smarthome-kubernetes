su -
sudo swapoff -a

#generate join comman on master and paste here

#hack to fix https://github.com/kubernetes/kubernetes/issues/39823
iptables -A FORWARD -j ACCEPT
