#!/bin/bash

sudo apt-get update
sudo apt-get install golang libssl-dev

# chromium depot_tools
cd $TRAVIS_HOME
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

