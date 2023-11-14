#!/usr/bin/env bash

set -e

sudo apt-get update -y
sudo apt-get upgrade -y
# sudo apt-get install -y xfce4
# sudo apt-get install -y xfce4-goodies 
# sudo apt-get install -y x11-xserver-utils

# sudo apt-get build-dep qtbase5-dev

sudo apt-get install -y build-essential perl python3 git
sudo ln -s /usr/bin/python3 /usr/bin/python

sudo apt-get install -y '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev

sudo apt-get install -y flex bison gperf libicu-dev libxslt-dev ruby

sudo apt-get install -y libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libxtst-dev libxss-dev libdbus-1-dev libevent-dev libfontconfig1-dev libcap-dev libpulse-dev libudev-dev libpci-dev libnss3-dev libasound2-dev libegl1-mesa-dev gperf bison nodejs

sudo apt-get install -y libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev

sudo apt-get install -y build-essential libgl1-mesa-dev libglu1-mesa-dev

sudo apt-get install -y libatspi2.0-dev
