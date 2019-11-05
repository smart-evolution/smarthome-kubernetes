su -
sudo swapoff -a

#generate join command on master and paste here

#hack to fix https://github.com/kubernetes/kubernetes/issues/39823
iptables -A FORWARD -j ACCEPT
