set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set PATH=%TRAVIS_HOME%\depot_tools;%PATH%

cd %TRAVIS_BUILD_DIR%\crashpad
ninja -C out\Default

