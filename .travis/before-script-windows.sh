#!/bin/bash

echo "---- starting before-script"
cmd < $TRAVIS_BUILD_DIR/before-script-windows.bat
echo "---- before-script exit"

find $TRAVIS_BUILD_DIR/boringssl -name "*.lib" -print

