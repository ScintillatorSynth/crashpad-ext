set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set PATH=%TRAVIS_HOME%\depot_tools;c:\go\bin;%PATH%

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

