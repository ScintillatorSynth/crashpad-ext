#!/bin/bash

cd $TRAVIS_BUILD_DIR
git clone https://github.com/google/boringssl

echo "---- starting before-script"
cmd < $TRAVIS_BUILD_DIR/before-script-windows.bat
echo "---- before-script exit"

find $TRAVIS_BUILD_DIR/boringssl -print

