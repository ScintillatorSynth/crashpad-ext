#!/bin/bash

cd $TRAVIS_BUILD_DIR

echo "---- starting before-script"
cmd < $TRAVIS_BUILD_DIR/before-script-windows.bat
echo "---- before-script exit"

echo "----- BUILD BORINGSSL"
cd $TRAVIS_BUILD_DIR
git clone https://github.com/google/boringssl

cd $TRAVIS_BUILD_DIR/boringssl
mkdir build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
ninja

echo "*** cmakelog:"
cat CMakeFiles/CMakeOutput.log
find $TRAVIS_BUILD_DIR/boringssl -name "*.lib" -print

