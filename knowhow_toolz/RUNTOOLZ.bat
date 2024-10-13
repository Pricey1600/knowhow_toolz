@echo off
title Custom Toolz for Knowhow
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

set "help=%~dp0README.txt"
set "tool1=%~dp0AddLocalUser\RUN_ADD_USER.bat"
set "tool2=%~dp0InstallApp\InstallApps.bat"

echo __________________________________________________________________
echo:
echo Welcome to the Custom Tool Stick for Knowhow! The tools available are as follows:
:select
echo:
echo (1) - Add Local User, Remove Online User
echo (2) - Install Apps
echo (?) - Help
echo (x) - Exit
echo:

set "choice="
set /p choice= Enter the number/symbol of the tool you want to launch: 
if "%choice%" equ "" (
    goto invalid
)
if "%choice%"=="1" (
	echo __________________________________________________________________
    	%tool1%
)
if "%choice%"=="2" (
	echo __________________________________________________________________
    	%tool2%
)
if "%choice%"=="?" (
	start /b %help%
	goto select
)
if "%choice%"=="x" (
	exit
)

:invalid
echo Not a valid option
goto select