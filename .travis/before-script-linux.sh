#!/bin/bash

# crashpad checkout
cd $TRAVIS_BUILD_DIR
mkdir build
cd build
fetch crashpad

# boringssl checkout
cd $TRAVIS_BUILD_DIR/build
git clone https://github.com/google/boringssl
cd boringssl
mkdir build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
ninja

