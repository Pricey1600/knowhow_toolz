@echo off

set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

set menu="%~d0\knowhow_toolz\RUNTOOLZ.bat"
set agreements=--accept-source-agreements --accept-package-agreements

set app1=--id Google.Chrome
set app2=--id Mozilla.Firefox
set app3=--id 9MVDXG0ZBMP7
set app4=--id 9WZDNCRD29V9

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
	echo ////////////////////////////////////////////////
	echo Installing Google Chrome
    	winget install %app1% %agreements%
	echo ////////////////////////////////////////////////
	goto select
)
if "%choice%"=="2" (
	echo ////////////////////////////////////////////////
	echo Installing Firefox
    	winget install %app2% %agreements%
	echo ////////////////////////////////////////////////
	goto select
)
if "%choice%"=="3" (
	echo ////////////////////////////////////////////////
	echo Installing Currys Cloud
    	winget install %app3% %agreements%
	echo ////////////////////////////////////////////////
	goto select
)
if "%choice%"=="4" (
	echo ////////////////////////////////////////////////
	echo Installing Office365
    	winget install %app4% %agreements%
	echo ////////////////////////////////////////////////
	goto select
)
if "%choice%"=="x" (
	%menu%
)

:invalid
echo Not a valid option
goto select