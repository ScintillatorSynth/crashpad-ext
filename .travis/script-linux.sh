#!/bin/bash

export PATH=$TRAVIS_HOME/depot_tools:$TRAVIS_HOME/go/bin:$PATH
export GOROOT=$TRAVIS_HOME/go

### build crashpad
cd $TRAVIS_BUILD_DIR/build/crashpad
mkdir -p out/Default
echo "crashpad_use_boringssl_for_http_transport_socket=true" > out/Default/args.gn
echo "extra_cflags=\"-I$TRAVIS_BUILD_DIR/build/boringssl\"" >> out/Default/args.gn
echo "extra_ldflags=\"-L$TRAVIS_BUILD_DIR/build/boringssl/build/ssl/libssl.a -L$TRAVIS_BUILD_DIR/build/boringssl/build/crypto/libcrypto.a\"" >> out/Default/args.gn
echo "args.gn:"
cat out/Default/args.gn
gn gen out/Default
ninja -C out/Default

# we just copy the entire crashpad tree into install-ext
mkdir $TRAVIS_BUILD_DIR/install-ext
cp -R $TRAVIS_BUILD_DIR/build/crashpad $TRAVIS_BUILD_DIR/install-ext/.

# build and install breakpad
cd $TRAVIS_BUILD_DIR/build/breakpad
./configure --prefix=$TRAVIS_BUILD_DIR/build/install-ext
make -j
make install

