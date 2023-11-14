#!/usr/bin/env bash

set -e

DEBIAN_FRONTEND=noninteractive sudo apt-get update -y

DEBIAN_FRONTEND=noninteractive \
  sudo apt-get install -y \
  vim git pstack strace gpg gosu \
  iputils-ping net-tools telnet unzip \
  wget curl gcc g++ cmake gdb \
  libssl-dev gnupg gnupg2 gnupg1 openssl pkg-config \
  lcov valgrind cppcheck \
  python3 python3-dev python3-pip \
  zsh tmux

DEBIAN_FRONTEND=noninteractive \
  sudo apt-get install -y locales
sudo locale-gen en_US.UTF-8

sudo rm -rf /var/lib/apt/lists/*
sudo apt-get autoremove -y

pip install -i https://pypi.tuna.tsinghua.edu.cn/simple clang-format==15.0.7
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple clang-tidy==15.0.2
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple cpplint==1.6.1
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pre-commit==3.0.2
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple conan==1.53.0

sudo mkdir /root/.vim
sudo mkdir /root/.vim/.backup
sudo mkdir /root/.vim/.swp
sudo mkdir /root/.vim/.undo
mkdir /home/dev/.vim
mkdir /home/dev/.vim/.backup
mkdir /home/dev/.vim/.swp
mkdir /home/dev/.vim/.undo
cp -arf /home/dev/.MyVim/tmuxconfs/tmux.conf /home/dev/.tmux.conf
