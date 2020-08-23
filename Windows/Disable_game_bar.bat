rem Disable Windows Game DVR and Game Bar
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v AppCaptureEnabled /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v GameDVR_Enabled /t REG_DWORD /d 0 /f

rem Disable Game Mode
reg add HKCU\Software\Microsoft\GameBar /v AutoGameModeEnabled /t REG_DWORD /d 0 /f
reg add HKCU\System\GameConfigStore /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f