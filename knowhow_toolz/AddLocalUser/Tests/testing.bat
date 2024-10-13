@echo off

:: set drive=C:\Users\
:: set username=%USERNAME%
:: set removeDrive=^"%drive%%username%^"
:: echo bla bla bla %removeDrive%

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

for /l %%x in (0,1,%n%) do (
	echo !users[%%x]!
)