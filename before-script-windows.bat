set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set PATH=%TRAVIS_HOME%\depot_tools;%PATH%

cd %TRAVIS_BUILD_DIR%
mkdir crashpad
cd crashpad
fetch crashpad

cd %TRAVIS_BUILD_DIR%
mkdir breakpad
cd breakpad
fetch breakpad

cd %TRAVIS_BUILD_DIR%
git clone https://github.com/google/boringssl
cd boringssl
mkdir build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
ninja

