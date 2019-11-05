su -
kubeadm init
exit

sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

#hack to fix https://github.com/kubernetes/kubernetes/issues/39823
sudo iptables -A FORWARD -j ACCEPT

su -
kubeadm token create --print-join-command
exit
