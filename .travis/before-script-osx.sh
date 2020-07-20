#!/bin/sh

# chromium depot_tools
mkdir $TRAVIS_BUILD_DIR/build
cd $TRAVIS_BUILD_DIR/build
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
mkdir $TRAVIS_BUILD_DIR/breakpad
cd $TRAVIS_BUILD_DIR/breakpad

# breakpad checkout
PATH=$TRAVIS_BUILD_DIR/build/depot_tools:$PATH fetch breakpad

