set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set PATH=%TRAVIS_HOME%\depot_tools;c:\go\bin;%PATH%

echo "---- NINJA CRASHPAD"
cd %TRAVIS_BUILD_DIR%\crashpad\crashpad
gn gen out\Default
ninja -C out\Default

