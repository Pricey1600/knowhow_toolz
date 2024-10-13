@echo off
title Custom Toolz for Knowhow
set menu="%~d0\knowhow_toolz\RUNTOOLZ.bat"
echo %menu%

for /f "tokens=* delims=" %%x in (%~dp0dir2delete.txt) do set usrDir=%%x

del /F/Q/S/A %usrDir% >NUL
rmdir /Q/S %usrDir% >NUL
schtasks /delete /tn DeleteOldUser /f >NUL

if exist %usrDir% (
	echo:
	echo "!---Old user file has not been removed. Please remove manually.---!"
	echo:
	%SystemRoot%\explorer.exe "c:\Users"
	pause
	%menu%
)

echo:
echo "The old user and their files has been removed"
echo:
pause
%menu%
pause