#!/bin/bash

systemctl stop firewalld
setenforce 0

yum update -y
yum install -y \
  epel-release \
  wget \
  vim \
  bash-completion \
  gcc
