#!/bin/bash

echo -e "\n################## uname -a #############################"
uname -a

echo -e "\n################## cat /proc/version ####################"
cat /proc/version

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

echo -e "\n################## id ###################################"
id
