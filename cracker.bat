@echo off
title WinRAR-Cracker - MrUknnown
color 1e
::------------ Interface ------------::
echo.
echo   :=-----------------------------------------------------------------------=:
echo.
echo         ___                       _____                    __             
echo        / _ \ ___ _  ___  ___     / ___/  ____ ___ _ ____  / /__ ___   ____
echo       / ___// _ `/ ^(_-^< ^(_-^<    / /__   / __// _ `// __/ /  '_// -_^) / __/
echo      /_/    \_,_/ /___//___/    \___/  /_/   \_,_/ \__/ /_/\_\ \__/ /_/   
echo.
echo.
echo.
echo        Author  : MrUknown    ^|  Description : This is a simple batch program
echo        Version : 0.1         ^|  to help you crack Rar/Zip passwords.
echo.
echo   :=-----------------------------------------------------------------------=:
timeout /t 8 >nul
::-----------------------------------::
if not exist "C:\Program Files\7-Zip" (
	echo 7-Zip not installed!
	pause
	exit
)

echo.
set /p archive="Enter Archive: "
if not exist "%archive%" (
	echo Archive not found!
	pause
	exit
)

set /p wordlist="Enter Wordlist: "
if not exist "%wordlist%" (
	echo Wordlist not found!
	pause
	exit
)
echo Cracking...
for /f %%a in (%wordlist%) do (
	set pass=%%a
	call :attempt
)
echo shitty wordlist dumbass
pause
exit

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo ATTEMPT : %pass%
if /I %errorlevel% EQU 0 (
	echo Success! Password Found: %pass%
	pause
	exit
)
