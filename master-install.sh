su -
kubeadm init
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
exit

kubectl create deployment smarthome-server --image=oszura/smarthome-server-prod
kubectl expose deployment smarthome-server --type=NodePort --port 3222 --target-port 3222
kubectl patch svc smarthome-server -p '{"spec":{"externalIPs":["<rpi-ip>"]}}

# kubeadm token create --print-join-command - generate joining command
