#!/usr/bin/env bash
### every exit != 0 fails the script
set -e


export http_proxy=http://192.168.4.1:7890
export https_proxy=http://192.168.4.1:7890
apt-get update
apt-get install -y apt-transport-https ca-certificates
export -n http_proxy
export -n https_proxy

echo -e "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ sid main contrib non-free\n" > /etc/apt/sources.list
apt-get update
echo "Install some common tools for further installation"
apt-get install -y vim wget net-tools locales bzip2 procps \
    python3-numpy #used for websockify/novnc
apt-get clean -y

echo "generate locales für en_US.UTF-8"
locale-gen en_US.UTF-8
