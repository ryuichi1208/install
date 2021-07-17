#!/bin/bash

systemctl stop firewalld
setenforce 0

yum update -y
yum install -y \
  vim \
  bash-completion
