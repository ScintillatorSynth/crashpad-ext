#!/bin/bash

cd $TRAVIS_BUILD_DIR/crashpad/crashpad
mkdir -p out/Default
echo "crashpad_use_boringssl_for_http_transport_socket=true" >> out/Default/args.gn
echo "extra_cflags=\"-I$TRAVIS_BUILD_DIR/boringssl -I/usr/local/opt/openssl/include\"" >> out/Default/args.gn
echo "extra_ldflags=\"$TRAVIS_BUILD_DIR/boringssl/build/ssl/libssl.a $TRAVIS_BUILD_DIR/boringssl/build/crypto/libcrypto.a" >> out/Default/args.gn
echo "args.gn:"
cat out/Default/args.gn

