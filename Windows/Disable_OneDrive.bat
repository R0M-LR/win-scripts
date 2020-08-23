rem Disable One Drive
reg add HKLM\Software\Policies\Microsoft\Windows\OneDrive /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f
start /wait %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S
reg delete "HKEY_USERS\S-1-5-19\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f
reg delete "HKEY_USERS\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /f
reg load HKLM\DEFAULT c:\users\default\ntuser.dat
reg delete HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run /v OneDriveSetup /f
reg unload HKLM\DEFAULT