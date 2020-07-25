set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set PATH=%TRAVIS_HOME%\depot_tools;c:\go\bin;%PATH%

echo "---- NINJA CRASHPAD"
cd %TRAVIS_BUILD_DIR%\crashpad\crashpad
gn gen out\Default --args='target_cpu="x64" crashpad_use_boringssl_for_http_transport_socket=true'
ninja -C out\Default

