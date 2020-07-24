set DEPOT_TOOLS_UPDATE=0
set PATH=%PATH%;%TRAVIS_HOME%\depot_tools

set

cd %TRAVIS_BUILD_DIR%
mkdir crashpad
cd crashpad
fetch crashpad

cd %TRAVIS_BUILD_DIR%
mkdir breakpad
cd breakpad
fetch breakpad

