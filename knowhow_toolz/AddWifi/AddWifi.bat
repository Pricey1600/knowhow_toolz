@echo off
title Wifi Connect
set wifiProfile1="%~dp0Wi-Fi-DCG-NE.xml"
set wifiProfile2="%~dp0Wi-Fi-Demo.xml"
set menu="%~d0\knowhow_toolz\RUNTOOLZ.bat"

:select
echo:
echo The following WIFI connections are available:
echo:
echo (1) - DCG-NE (recommended)
echo (2) - Demo
echo (x) - Exit
echo:

:choice
set "choice="
set /p choice= Enter the number of the wifi network you want to connect to: 
if "%choice%" equ "" (
	goto choice
)
if "%choice%"=="1" (
	echo:
	netsh wlan add profile filename=%wifiProfile1%
	goto connected
)
if "%choice%"=="2" (
	echo:
	netsh wlan add profile filename=%wifiProfile2%
	goto connected
)
if "%choice%"=="x" (
	%menu%
)
echo INVALID OPTION
goto select

:connected
echo:
echo WIFI connected successfully
echo:
goto select