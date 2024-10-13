@echo off

set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

set menu="%~d0\knowhow_toolz\RUNTOOLZ.bat"

set "app1=%~dp0Installers\ChromeSetup.exe"
set "app2=%~dp0Installers\Firefox_Installer.exe"
set "app3=%~dp0Installers\CloudBackupSetup.exe"
set "app4=%~dp0Installers\OfficeSetup.exe"

:select
echo:
echo Available Apps:
echo:
echo (1) - Google Chrome
echo (2) - Firefox
echo (3) - Currys Cloud Backup
echo (4) - Microsoft Office 365
echo (x) - Return to menu
echo:

set "choice="
set /p choice= Enter the number of the app you want to install: 

if "%choice%" equ "" (
    goto invalid
)
if "%choice%"=="1" (
	echo Launching Chrome installer
    	start /b %app1%
	goto select
)
if "%choice%"=="2" (
	echo Launching Firefox installer
    	start /b %app2%
	goto select
)
if "%choice%"=="3" (
	echo Launching Cloud installer
    	start /b %app3%
	goto select
)
if "%choice%"=="4" (
	echo Launching Office installer
    	start /b %app4%
	goto select
)
if "%choice%"=="x" (
	%menu%
)

:invalid
echo Not a valid option
goto select