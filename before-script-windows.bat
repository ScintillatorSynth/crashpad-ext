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

