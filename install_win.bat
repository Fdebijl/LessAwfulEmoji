@echo off
CLS

:: Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

:: If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:: Sanity check for Slack installation
if not exist %LOCALAPPDATA%/slack/slack.exe (
  echo Could not find Slack installation
  pause
  exit
)

:: Determine the latest version - this is done by selecting the most recently modified folder
FOR /F "delims=" %%i IN ('dir "%LOCALAPPDATA%/slack" /b /ad-h /t:c /od') DO SET latestVersion=%%i

set interopLocation=%LOCALAPPDATA%\slack\%latestVersion%\resources\app.asar.unpacked\src\static

:: Check for existence of ssb-interop.js
if not exist %interopLocation%\ssb-interop.js (
  echo Could not find ssb-interop.js - the location may have changed in the latest version: %latestVersion%
  pause
  exit
)

:: Check for previous installation
:INSTALLATIONCHECK
find /c "EmojiSelectorInjector" %interopLocation%\ssb-interop.js
if %errorlevel% equ 1 GOTO NOTFOUND
CLS
echo Found a previous installation of LessAwfulEmoji. It is HIGHLY recommended you remove this script before installing another version. LessAwfulEmoji can remove this script for you, would you like to proceed?
choice /M "Press Y for Yes, N for No."
if %errorlevel% equ 2 GOTO NOTFOUND
if %errorlevel% equ 1 (
  if not exist %interopLocation%\ssb-interop.js.bak (
    echo Could not find the backup file 'ssb-interop.js.bak' please remove the LessAwfulEmoji script from the end of ssb-interop.js before proceeding.
    >nul start C:\Windows\explorer.exe /select,"%interopLocation%\ssb-interop.js"
    pause
    GOTO INSTALLATIONCHECK
  )

  copy /y %interopLocation%\ssb-interop.js.bak %interopLocation%\ssb-interop.js
  echo Restored backup from ssb-interop.js.bak to ssb-interop.js
)
:NOTFOUND

CLS
:: Back up ssb-interop.js so we can uninstall later or recover if something goes wrong
echo Creating backup at %interopLocation%\ssb-interop.js.bak
echo Do not delete this file! You will have to manually remove the script later if you do.
>nul copy %interopLocation%\ssb-interop.js %interopLocation%\ssb-interop.js.bak

:SELECT
set /p style="Enter the desired emoji style (Apple/Facebook/Google/Messenger/Twitter): "

if "%style%"=="Apple" (
  type scripts\apple.js >> %interopLocation%\ssb-interop.js
  GOTO :END
)

if "%style%"=="Facebook" ( 
  type scripts\facebook.js >> %interopLocation%\ssb-interop.js
  GOTO :END
)

if "%style%"=="Google" (
  type scripts\google.js >> %interopLocation%\ssb-interop.js
  GOTO :END
)

if "%style%"=="Messenger" (
  type scripts\messenger.js >> %interopLocation%\ssb-interop.js
  GOTO :END
)

if "%style%"=="Twitter" (
  type scripts\twitter.js >> %interopLocation%\ssb-interop.js
  GOTO :END
)

echo %style% is not a valid option, please enter one of the available styles: Apple/Facebook/Google/Messenger/Twitter
GOTO SELECT

:END
echo Script succesfully installed! You may now restart Slack!
pause