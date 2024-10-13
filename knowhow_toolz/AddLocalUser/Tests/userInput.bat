@echo off

:confirm
set /p confirmation= Type 'delete' to continue: 

if "%confirmation%"=="delete" (
	echo Confirmation has been accepted
) else (
	echo Confirmation NOT accepted
	goto confirm
)

pause