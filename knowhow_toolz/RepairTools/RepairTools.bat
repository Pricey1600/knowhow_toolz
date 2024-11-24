@echo off
title Repair Tools

set menu="%~d0\knowhow_toolz\RUNTOOLZ.bat"

:select
echo:
echo The following Repair tools are available:
echo:
echo (1) - Registry Repair
echo (x) - Exit
echo:

:choice
set "choice="
set /p choice= Enter the number of the repair tool you want to use: 
if "%choice%" equ "" (
	goto choice
)
if "%choice%"=="1" (
	echo:
	goto regRepair
)
if "%choice%"=="x" (
	%menu%
)
echo INVALID OPTION
goto select

:regRepair
echo ////////////////////////////////////////////////
echo y|chkdsk C: /f /r /x

schtasks /create /sc onlogon /tn ContinueRegRepair /tr %~dp0RegistryRepairPt2.bat /ru %USERNAME% /rl highest /delay 0000:05 >NUL
echo:
echo System needs restart. You will have to log in to continue repairs. Press ctr+C to abort restart.
timeout /t 10
shutdown -t 0 -r -f





