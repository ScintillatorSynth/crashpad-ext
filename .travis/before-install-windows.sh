#!/bin/bash

choco install golang openssl ninja

# depot_tools setup
mkdir $TRAVIS_HOME/depot_tools
cd $TRAVIS_HOME/depot_tools
curl https://storage.googleapis.com/chrome-infra/depot_tools.zip -o depot_tools.zip
unzip -o depot_tools.zip

