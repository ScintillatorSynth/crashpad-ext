set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set PATH=c:\programdata\chocolatey\bin;%TRAVIS_HOME%\depot_tools;c:\go\bin;%PATH%

echo "---- NINJA CRASHPAD"
cd %TRAVIS_BUILD_DIR%\crashpad\crashpad
gn gen out\Default
ninja -C out\Default

echo "---- BUILD BREAKPAD DUMP_SYMS"
cd %TRAVIS_BUILD_DIR%\breakpad\src\src\tools\windows\dump_syms
msbuild dump_syms.vcproj

