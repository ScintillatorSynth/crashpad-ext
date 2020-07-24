set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set PATH=c:\programdata\chocolatey\bin;%TRAVIS_HOME%\depot_tools;c:\go\bin;%PATH%

echo "---- FETCH CRASHPAD"
cd %TRAVIS_BUILD_DIR%
mkdir crashpad
cd crashpad
fetch crashpad

echo "---- FETCH BREAKPAD"
cd %TRAVIS_BUILD_DIR%
mkdir breakpad
cd breakpad
fetch breakpad

echo "----- BUILD BORINGSSL"
cd %TRAVIS_BUILD_DIR%
cd boringssl
mkdir build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
ninja

