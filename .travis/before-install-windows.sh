#!/bin/bash

choco install openssl ninja golang

# depot_tools setup
mkdir $TRAVIS_HOME/depot_tools
cd $TRAVIS_HOME/depot_tools
curl https://storage.googleapis.com/chrome-infra/depot_tools.zip -o depot_tools.zip
unzip -o -q depot_tools.zip

cd $TRAVIS_BUILD_DIR
git clone https://github.com/google/boringssl

cmd < $TRAVIS_BUILD_DIR/before-install-windows.bat

