set DEPOT_TOOLS_UPDATE=0
set GOPATH=c:\Go\bin\go
set PATH=%PATH%;%GOPATH%;%TRAVIS_HOME%\depot_tools

set

cd %TRAVIS_BUILD_DIR%
mkdir crashpad
cd crashpad
fetch crashpad

cd %TRAVIS_BUILD_DIR%
mkdir breakpad
cd breakpad
fetch breakpad

