@echo off
set newUser=User

setlocal EnableDelayedExpansion
set n=0

for /f "tokens=* skip=1" %%a in ('wmic UserAccount get Name') do (
	set "var="
	set "var=%%a"
	if defined var (
		REM %%a is a variable containing an account name
		set users[!n!]=%%a
		set /A n+=1
		echo ADDED %%a
	)
)

echo total users %n%
echo newUser %newUser%

for /l %%x in (0,1,%n%) do (
	echo !users[%%x]!
	if "%newUser%" == "!users[%%x]!" (echo "User already exists") else (echo "User does NOT exist")
)

echo NOOOOOOOO

:exit