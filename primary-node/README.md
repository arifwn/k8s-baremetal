K3S
===

Install
-------
`curl -sfL https://get.k3s.io | sh -`

- A kubeconfig file will be written to /etc/rancher/k3s/k3s.yaml and the kubectl installed by K3s will automatically use it
- To install on worker nodes and add them to the cluster:
    - `curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -`
    - K3S_TOKEN is stored at
        /var/lib/rancher/k3s/server/node-token

Wrong interface selection issue in vagrant
------------------------------------------
It will always use default interface, which causes issue in vagran where agent can't connect.

start server with `sudo k3s server --flannel-iface=192.168.50.2 --node-ip=192.168.50.2`
or
`curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--no-deploy=traefik --flannel-iface=192.168.50.2 --node-ip=192.168.50.2" sh -`

If `--flannel-iface=192.168.50.2` is set, the master node somehow can't start its own worker, but agent nodes can connect. Without it, the master node CAN start its own worker, but agent nodes CAN'T connect.

Possible Fix:
run `sudo ifconfig eth0 down` on agent instance?



Node Passwords
--------------
/var/lib/rancher/k3s/server/cred/passwd
/var/lib/rancher/k3s/server/cred/node-passwd
/var/lib/rancher/k3s/agent/node-password.txt

Upgrading
---------
simply re-run `curl -sfL https://get.k3s.io | sh -`



Test Deployment
---------------

sudo kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4
sudo kubectl get deployments --all-namespaces
sudo kubectl expose deployment hello-node --type=LoadBalancer --port=8080
sudo kubectl get services
sudo kubectl delete service hello-node
sudo kubectl delete deployment hello-node


Deploying Service with Traefic annotation config
------------------------------------------------
sudo kubectl apply -f echoserver.yaml

