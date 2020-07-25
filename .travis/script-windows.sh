#!/bin/bash

export TRAVIS_WIN_DIR=`cygpath -w $TRAVIS_BUILD_DIR`
cd $TRAVIS_BUILD_DIR/crashpad/crashpad
mkdir -p out/Default
echo "target_cpu=\"x64\"" > out/Default/args.gn
echo "crashpad_use_boringssl_for_http_transport_socket=true" >> out/Default/args.gn
echo "extra_cflags=\"/I$TRAVIS_WIN_DIR\\boringssl\"" >> out/Default/args.gn
echo "extra_ldflags=\"$TRAVIS_WIN_DIR\\build\\ssl\\Release\\ssl.lib $TRAVIS_WIN_DIR\\build\\crypto\\Release\\crypto.lib\"" >> out/Default/args.gn
echo "args.gn:"
cat out/Default/args.gn

cmd < $TRAVIS_BUILD_DIR/script-windows.bat

mkdir $TRAVIS_BUILD_DIR/install-ext
cp -R $TRAVIS_BUILD_DIR/crashpad/crashpad $TRAVIS_BUILD_DIR/install-ext/.
mkdir $TRAVIS_BUILD_DIR/install-ext/bin
cp $TRAVIS_BUILD_DIR/breakpad/src/src/tools/windows/binaries/dump_syms.exe $TRAVIS_BUILD_DIR/instal-ext/bin/.

