#!/bin/bash

export PATH=$TRAVIS_HOME/depot_tools:$TRAVIS_HOME/go/bin:$PATH
export GOROOT=$TRAVIS_HOME/go

# crashpad checkout
cd $TRAVIS_BUILD_DIR
mkdir crashpad
cd crashpad
fetch crashpad

# breakpad checkout
cd $TRAVIS_BUILD_DIR
mkdir breakpad
cd breakpad
fetch breakpad

# boringssl checkout and build
echo "** building BoringSSL **"
cd $TRAVIS_BUILD_DIR
git clone https://github.com/google/boringssl
cd boringssl
mkdir build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
ninja || exit 1

