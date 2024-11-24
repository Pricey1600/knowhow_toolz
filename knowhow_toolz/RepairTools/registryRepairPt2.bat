@echo off
title Repair Tools

set menu="%~d0\knowhow_toolz\RepairTools\RepairTools.bat"

schtasks /delete /tn ContinueRegRepair /f >NUL

echo:
echo Performing DISM Health Check
DISM /Online /Cleanup-image /Checkhealth
echo:
echo Performing DISM Health Scan
DISM.exe /Online /Cleanup-image /Scanhealth
echo:
echo Performing DISM Health Restore
DISM.exe /Online /Cleanup-image /Restorehealth

echo:
echo Performing final sfc scan
sfc /scannow

echo:
echo Registry repairs complete.
echo ////////////////////////////////////////////////
%menu%
