#!/usr/bin/env bash

set -e

sudo cp -arf /home/dev/opt/bin/llvm.list /etc/apt/sources.list.d/
cat /home/dev/opt/bin/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-get update -y
sudo apt install -y clang clang-format lldb lld llvm-dev llvm-runtime llvm libclang-dev
