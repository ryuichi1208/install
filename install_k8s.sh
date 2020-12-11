#!/bin/bash

# Update software
yum update -y

# SELinux and Swap off
setenforce 0
swapoff -a
sed -e "/\/dev\/mapper\/centos-swap/s/^/#/g" /etc/fstab

# Disable Firewalld
systemctl disable firewalld

# Disable IPv6
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf

# Setting iptables
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

# Enable ip_forward
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
sysctl --system

# Install Docker
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io -y
systemctl enable --now docker

# Install K8s
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF
yum install kubelet kubeadm kubectl --disableexcludes=kubernetes -y
systemctl enable --now kubelet

# Init kubeadm
kubeadm init --apiserver-advertise-address $(hostname -I | cut -f1 -d' ') --pod-network-cidr 10.240.0.0/16
mkdir -p $HOME/.kube
cp /etc/kubernetes/admin.conf $HOME/.kube/config

# Deploy CNI
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
