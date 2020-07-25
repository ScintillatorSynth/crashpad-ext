#!/bin/bash

export PATH=$TRAVIS_HOME/depot_tools:$TRAVIS_HOME/go/bin:$PATH
export GOROOT=$TRAVIS_HOME/go

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

