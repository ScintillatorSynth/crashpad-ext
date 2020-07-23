#!/bin/sh

export PATH=$TRAVIS_HOME/depot_tools:$PATH

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
cd $TRAVIS_BUILD_DIR
git clone https://github.com/google/boringssl
cd boringssl
mkdir build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
ninja

