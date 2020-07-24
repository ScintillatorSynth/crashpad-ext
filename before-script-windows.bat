set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set PATH=%TRAVIS_HOME%\depot_tools;%PATH%

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

echo "----- FETCH BORINGSSL"
cd %TRAVIS_BUILD_DIR%\boringssl
mkdir build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
ninja

