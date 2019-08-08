su -
kubeadm init
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
exit

kubectl create deployment smarthome-server --image=oszura/smarthome-server-prod
kubectl apply -f smarthome-service.yaml

# kubeadm token create --print-join-command - generate joining command
