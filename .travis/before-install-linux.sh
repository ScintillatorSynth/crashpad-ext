#!/bin/bash

sudo apt-get update
sudo apt-get install libssl-dev
sudo add-apt-repository --yes ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++
sudo apt-get install --yes  \
    gcc-7                   \
    g++-7
sudo update-alternatives --install /usr/bin/gcc gcc `which gcc-7` 10
sudo update-alternatives --install /usr/bin/g++ g++ `which g++-7` 10
sudo update-alternatives --set cc /usr/bin/gcc
sudo update-alternatives --set c++ /usr/bin/g++

# go 1.13 (prerequisite of BoringSSL, not available in apt)
cd $TRAVIS_HOME
wget https://golang.org/dl/go1.13.14.linux-amd64.tar.gz
tar xzf go1.13.14.linux-amd64.tar.gz

# chromium depot_tools
cd $TRAVIS_HOME
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

