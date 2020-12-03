#!/bin/bash

# curl -Ls https://raw.githubusercontent.com/ryuichi1208/install/main/info.sh | sh

echo -e "\n################## uname -a #############################"
uname -a

echo -e "\n################## cat /proc/version ####################"
cat /proc/version

echo -e "\n################## cat /etc/os-release ##################"
cat /etc/os-release

echo -e "\n################## ls -l / ##############################"
ls -l /

echo -e "\n################## cat /proc/cpuinfo ####################"
cat /proc/cpuinfo

echo -e "\n################## cat /proc/meminfo ####################"
cat /proc/meminfo

echo -e "\n################## hostname -f ##########################"
hostname -f

echo -e "\n################## df -Th ###############################"
df -Th

echo -e "\n################## lsblk ################################"
lsblk

echo -e "\n################## ip a sh ##############################"
ip a sh

echo -e "\n################## ip r sh ##############################"
ip r sh

echo -e "\n################## netstat -antupo ######################"
netstat -antupo

echo -e "\n################## arp -a ###############################"
arp -a

echo -e "\n################## id ###################################"
id

echo -e "\n################## curl httpbin.org/ip ##################"
curl httpbin.org/ip

echo -e "\n################## cat /etc/sysconfig/network ###########"
cat /etc/sysconfig/network

echo -e "\n################## cat /etc/hosts #######################"
cat /etc/hosts

echo -e "\n################## cat /etc/resolv.conf #################"
cat /etc/resolv.conf

echo -e "\n################## cat /etc/nsswitch.conf ###############"
cat /etc/nsswitch.conf

echo -e "\n################## cat /etc/passwd ######################"
cat /etc/passwd

echo -e "\n################## cat /etc/group #######################"
cat /etc/group
