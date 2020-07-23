#!/bin/sh

export PATH=$TRAVIS_HOME/depot_tools:$PATH

cd $TRAVIS_BUILD_DIR/crashpad/crashpad
mkdir -p out/Default
echo "mac_deployment_target=\"10.13\"" > out/Default/args.gn
echo "crashpad_use_boringssl_for_http_transport_socket=true" >> out/Default/args.gn
echo "extra_cflags=\"-I$TRAVIS_BUILD_DIR/boringssl -I/usr/local/opt/openssl/include\"" >> out/Default/args.gn
echo "extra_ldflags=\"$TRAVIS_BUILD_DIR/boringssl/build/ssl/libssl.a $TRAVIS_BUILD_DIR/boringssl/build/crypto/libcrypto.a -L/usr/local/opt/openssl/lib\"" >> out/Default/args.gn
echo "args.gn:"
cat out/Default/args.gn
gn gen out/Default
ninja -C out/Default

# we just copy the entire crashpad tree into install-ext
mkdir $TRAVIS_BUILD_DIR/install-ext
cp -R $TRAVIS_BUILD_DIR/crashpad/crashpad $TRAVIS_BUILD_DIR/install-ext/.

# build and install breakpad, all we need is the dump_syms binary
cd $TRAVIS_BUILD_DIR/breakpad/src/src/tools/mac/dump_syms
xcodebuild -project dump_syms.xcodeproj
mkdir $TRAVIS_BUILD_DIR/install-ext/bin
cp build/Release/dump_syms $TRAVIS_BUILD_DIR/install-ext/bin/.

