#!/bin/bash

choco install openssl ninja golang nasm visualstudio2017community visualstudio2017-workload-nativedesktop

# depot_tools setup
mkdir $TRAVIS_HOME/depot_tools
cd $TRAVIS_HOME/depot_tools
curl https://storage.googleapis.com/chrome-infra/depot_tools.zip -o depot_tools.zip
unzip -o -q depot_tools.zip

cmd < $TRAVIS_BUILD_DIR/before-install-windows.bat

