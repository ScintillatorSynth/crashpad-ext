set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set PATH=%TRAVIS_HOME%\depot_tools;c:\go\bin;%PATH%

echo "---- NINJA CRASHPAD"
cd %TRAVIS_BUILD_DIR%\crashpad\crashpad
mkdir out
cd out
mkdir Default
cd Default
echo target_cpu="x64" > args.gn
echo crashpad_use_boringssl_for_http_transport_socket=true >> args.gn
echo "args.gn:"
type args.gn
cd %TRAVIS_BUILD_DIR%\crashpad\crashpad
gn gen out\Default
ninja -C out\Default

