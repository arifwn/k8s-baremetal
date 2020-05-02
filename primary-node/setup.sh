#!/bin/sh

echo "setting up node"

# install docker
# curl https://releases.rancher.com/install-docker/18.09.2.sh | sh

# add user to docker group
# usermod -aG docker vagrant

# RKE
# curl -LJO https://github.com/rancher/rke/releases/download/v0.2.10/rke_linux-amd64
# chmod +x rke_linux-amd64
# mv rke_linux-amd64 /usr/local/bin/rke

# install helm
curl -LJO https://get.helm.sh/helm-v3.2.0-linux-amd64.tar.gz
tar -xf helm-v3.2.0-linux-amd64.tar.gz
rm helm-v3.2.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/
rm -rf linux-amd64

# K3S
curl -sfL https://get.k3s.io | K3S_EXTERNAL_IP=192.168.50.2 sh -
