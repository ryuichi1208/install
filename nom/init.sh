#!/bin/bash
# usage:
# curl -s https://raw.githubusercontent.com/ryuichi1208/install/main/nom/init.sh | bash

systemctl stop firewalld
setenforce 0
