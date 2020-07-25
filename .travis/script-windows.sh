#!/bin/bash

cmd < $TRAVIS_BUILD_DIR/script-windows.bat

mkdir $TRAVIS_BUILD_DIR/install-ext
cp -R $TRAVIS_BUILD_DIR/crashpad/crashpad $TRAVIS_BUILD_DIR/install-ext/.
mkdir $TRAVIS_BUILD_DIR/install-ext/bin
cp $TRAVIS_BUILD_DIR/breakpad/src/src/tools/windows/binaries/dump_syms.exe $TRAVIS_BUILD_DIR/instal-ext/bin/.
