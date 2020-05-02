# k8s-baremetal
Running Kubernetes on bare metal servers


Commands
========

kubectl get nodes
kubectl get pods --all-namespaces



Uninstall
=========
/usr/local/bin/k3s-uninstall.sh
/usr/local/bin/k3s-agent-uninstall.sh



Rancher
=======

install
-------
helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=rancher.local.dev --kubeconfig ./k3s.yaml

