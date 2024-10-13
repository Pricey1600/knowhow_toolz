@echo off

set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

set menu="%~d0\knowhow_toolz\RUNTOOLZ.bat"

set newUser=User
set currentUser=%USERNAME%

echo:
echo "You are about to DELETE THE CURRENT USER and create a new user. The computer will restart."
echo:

:confirm
set /p confirmation= Type 'delete' to continue or 'x' to return to the menu: 

if "%confirmation%"=="x" (
	%menu%
)
if "%confirmation%"=="delete" (
	echo Confirmation has been accepted
) else (
	echo Confirmation NOT accepted
	goto confirm
)
echo:

if "%newUser%"=="%currentUser%" (
    echo "New user '%newUser%' and current user '%currentUser%' have the same name. Two users with the same name cannot exist. Are you sure you don't already have a local account set up?"
    echo:
    echo "!---The script has been stopped and no users have been added or removed---!"
    echo:
    pause
    %menu%
)

net user /add %newUser%
net localgroup administrators %newUser% /add

schtasks /create /sc onlogon /tn DeleteOldUser /tr %~dp0delete_old_user_dir.bat /ru %newUser% /rl highest /delay 0000:30

set drive=C:\Users\
set removeDrive=%drive%%currentUser%
echo %removeDrive%>%~dp0dir2delete.txt

net user %newUser%
if %ERRORLEVEL% EQU 0 (
	net user %USERNAME% /delete
) else (
	echo "The new user does not exist. It seems the command to create the new user failed."
	echo:
	echo "!---The script has been stopped and no users have been added or removed---!"
	echo:
	pause
	%menu%
)

shutdown -t 0 -r -f