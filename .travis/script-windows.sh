#!/bin/bash

mkdir $TRAVIS_BUILD_DIR/build/install-ext
cd $TRAVIS_BUILD_DIR/breakpad
./configure --prefix=$TRAVIS_BUILD_DIR/build/install-ext
make -j
make install

