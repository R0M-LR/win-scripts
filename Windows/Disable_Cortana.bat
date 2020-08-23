rem Hide Search Box from Task Bar
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f

rem Disable Cortana
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v CortanaConsent /t REG_DWORD /d 0 /f

rem Hide Cortana button
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowCortanaButton /t REG_DWORD /d 0 /f