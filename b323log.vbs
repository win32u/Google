Set WshShell = CreateObject("WScript.Shell") 
WshShell.CurrentDirectory="C:\Users\Public\Google\Google-main"

WshShell.Run chr(34) & "C:\Users\Public\Google\Google-main\b324log.bat" & Chr(34), 0
Set WshShell = Nothing 




