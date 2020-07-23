#!/bin/sh

export HOMEBREW_NO_ANALYTICS=1

brew update
brew install golang openssl

# chromium depot_tools
cd $TRAVIS_HOME
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

