rem Disable frequent/recent items in Explorer Quick Access
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer /v ShowFrequent /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer /v ShowRecent /t REG_DWORD /d 0 /f