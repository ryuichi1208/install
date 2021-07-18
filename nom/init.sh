#!/bin/bash
# usage:
# curl -s https://raw.githubusercontent.com/ryuichi1208/install/main/nom/init.sh | bash

systemctl stop firewalld
setenforce 0

yum update -y
yum install -y \
  epel-release \
  wget \
  vim \
  bash-completion \
  gcc \
  git \
  python3 \
  yum-utils \
  jq　　\
  net-tools \
  bind-utils \
  golang
