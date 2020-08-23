
rem Disable Windows Defender. For this to work you have to manually disable "Tamper protection"
powershell "if ((Get-ItemProperty -Path 'HKLM:SOFTWARE\Microsoft\Windows Defender\Features').TamperProtection -ne 4) { msg * 'Windows Defender can not be disabled. Tamper Protection is still active' }"
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v SpyNetReporting /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Off" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f
reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v SecurityHealth /f

rem Disable Warnings due to Firewall / Defender being disabled
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance /v Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f