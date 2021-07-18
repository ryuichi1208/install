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
  golang \
  the_silver_searcher \
  nkf

if [[ ! -e /usr/local/bin/fzf ]]; then
  git clone https://github.com/junegunn/fzf.git ~/.fzf
  yes y | ~/.fzf/install
  mv ~/.fzf/bin/fzf /usr/local/bin/fzf
fi

cat << 'EOF' > ~/.bashrc

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
EOF
