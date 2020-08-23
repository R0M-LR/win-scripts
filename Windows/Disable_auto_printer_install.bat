rem Disable automatic installation of printers and other networked devices
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private /v AutoSetup /t REG_DWORD /d 0 /f
