@echo off

set newUser=User7
set currentUser=%USERNAME%

echo:
pause
echo:

if "%newUser%"=="%currentUser%" (
    echo "New user '%newUser%' and current user '%currentUser%' have the same name. Two users with the same name cannot exist. Are you sure you don't already have a local account set up?"
    echo:
    echo "---The script has been stopped and no users have been added or removed---"
    echo:
    pause
    exit
)

echo "It continues"

echo:

rem net user %newUser%
if %ERRORLEVEL% EQU 0 (
	echo "New user successfully created!"
) else (
	echo "The new user does not exist. It seems the command to create the new user failed."
	echo:
	echo "---The script has been stopped and no users have been added or removed---"
	echo:
	pause
	exit
)

pause

set "usrDir=C:\Users\User6"

if exist %usrDir% (
	echo "User file still exists"
) else (
	echo "User file does not exist"
)

pause