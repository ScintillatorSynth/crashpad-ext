#!/bin/bash

# in-tree build
cd $TRAVIS_BUILD_DIR/build/crashpad
gn gen out/Default
ninja -C out/Default

# we just copy the entire tree into install-ext
mkdir $TRAVIS_BUILD_DIR/install-ext
cp -R $TRAVIS_BUILD_DIR/build/crashpad $TRAVIS_BUILD_DIR/install-ext/.

