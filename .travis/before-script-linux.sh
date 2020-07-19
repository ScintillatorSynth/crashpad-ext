#!/bin/bash

export PATH=$TRAVIS_HOME/depot_tools:$PATH

# crashpad checkout
cd $TRAVIS_BUILD_DIR
mkdir build
cd build
fetch crashpad

