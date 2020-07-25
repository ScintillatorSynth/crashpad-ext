set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set PATH=%TRAVIS_HOME%\depot_tools;c:\go\bin;%PATH%

echo "---- NINJA CRASHPAD"
cd %TRAVIS_BUILD_DIR%\crashpad\crashpad
mkdir out
cd out
mkdir Default
cd Default
echo target_cpu="x64" > args.gn
echo "args.gn:"
type args.gn
cd %TRAVIS_BUILD_DIR%\crashpad\crashpad
gn gen out\Default
ninja -C out\Default

echo "---- BUILD BREAKPAD DUMP_SYMS"
cd %TRAVIS_BUILD_DIR%\breakpad\src\src\tools\windows\dump_syms
devenv /build dump_syms.vcproj

