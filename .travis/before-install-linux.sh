#!/bin/bash

sudo apt-get update
sudo apt-get install libssl-dev

# go 1.13 (prerequisite of BoringSSL, not available in apt)
cd $TRAVIS_HOME
wget https://golang.org/dl/go1.13.14.linux-amd64.tar.gz
tar xzf go1.13.14.linux-amd64.tar.gz

# chromium depot_tools
cd $TRAVIS_HOME
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

