REM from https://stackoverflow.com/questions/887894/how-to-find-windows-sdks-setenv-cmd-setenv-cmd-does-not-work-correctly
REM with thanks to "Mac"

@ECHO OFF

IF "%WindowsSdkVersion%"=="" (
  CALL :SetWindowsSdkVersionHelper HKCU > nul 2>&1
  IF ERRORLEVEL 1 CALL :SetWindowsSdkVersionHelper HKLM > nul 2>&1
  IF ERRORLEVEL 1 GOTO ERROR_NOWSDK
)

CALL :SetWindowsSdkPathHelper > nul 2>&1
IF ERRORLEVEL 1 GOTO ERROR_NOWSDK
GOTO END

:SetWindowsSdkPathHelper
SET WindowsSdkPath=
FOR /F "tokens=1,2*" %%i in ('REG QUERY "HKLM\SOFTWARE\Microsoft\Microsoft SDKs\Windows\%WindowsSdkVersion%" /V InstallationFolder') DO (
    IF "%%i"=="InstallationFolder" (
        SET "WindowsSdkPath=%%k"
    )
)
IF "%WindowsSdkPath%"=="" EXIT /B 1
EXIT /B 0

:SetWindowsSdkVersion
CALL :GetWindowsSdkVersionHelper HKCU > nul 2>&1
IF ERRORLEVEL 1 CALL :GetWindowsSdkVersionHelper HKLM > nul 2>&1
IF ERRORLEVEL 1 EXIT /B 1
EXIT /B 0

:SetWindowsSdkVersionHelper
SET WindowsSdkVersion=
FOR /F "tokens=1,2*" %%i in ('REG QUERY "%1\SOFTWARE\Microsoft\Microsoft SDKs\Windows" /V "CurrentVersion"') DO (
    IF "%%i"=="CurrentVersion" (
        SET "WindowsSdkVersion=%%k"
    )
)
IF "%WindowsSdkVersion%"=="" EXIT /B 1
EXIT /B 0

:ERROR_NOWSDK
ECHO The Windows SDK %WindowsSdkVersion% could not be found.
EXIT /B 1

:END