# This shell script can be used to create a Kubernetes Cluster in a Linux Environment(ubuntu).
# Author: Arjun B Nair
# Last updated: 10/04/2020

#!/bin/bash

sudo apt-get update
sudo apt-get install docker.io -y
docker ––version
sudo systemctl enable docker
sudo systemctl start docker
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-get install curl -y
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get install kubeadm kubelet kubectl -y
sudo apt-mark hold kubeadm kubelet kubectl 
kubeadm version
swapoff –a

sudo hostnamectl set-hostname master-node
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

#kubectl taint nodes --all node-role.kubernetes.io/master- #Disables the Master's taints
