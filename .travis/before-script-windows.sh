#!/bin/bash

# Ninja in depot_tools seems broken, remove it
rm $TRAVIS_HOME/depot_tools/ninja

$TRAVIS_BUILD_DIR/before-script-windows.bat

cd $TRAVIS_BUILD_DIR
git clone https://github.com/google/boringssl
cd boringssl
mkdir build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
ninja

