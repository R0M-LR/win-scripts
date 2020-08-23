#Activer aero peek
#REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v DisablePreviewDesktop /t REG_DWORD /d 0 /f

#Ajout des icônes Ordinateur, panneau de configuration et réseau.
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /t REG_DWORD /d 0 /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v {5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0} /t REG_DWORD /d 0 /f
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v {59031a47-3f72-44a7-89c5-5595fe6b30ee} /t REG_DWORD /d 0 /f

#Config de mise en veille
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -CHANGE -monitor-timeout-ac 0
powercfg -CHANGE -monitor-timeout-dc 0
powercfg -CHANGE -disk-timeout-ac 0
powercfg -CHANGE -disk-timeout-dc 0
powercfg -CHANGE -standby-timeout-ac 0
powercfg -CHANGE -standby-timeout-dc 0
powercfg -CHANGE -hibernate-timeout-ac 0
powercfg -CHANGE -hibernate-timeout-dc 0

#Activation du pavé numérique
reg add "HKEY_USERS\.Default\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f
reg add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f


rem Control Panel shows Large Icons
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v ForceClassicControlPanel /t REG_DWORD /d 1 /f

rem Disable UAC
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f

rem Disable automatic installation of printers and other networked devices
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private /v AutoSetup /t REG_DWORD /d 0 /f

rem Set Ethernet connection to private
powershell Set-NetConnectionProfile -InterfaceAlias Ethernet* -NetworkCategory private

rem Disable Warnings due to Firewall / Defender being disabled
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance /v Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f

rem Disable Windows Firewall for private network
netsh advfirewall set private state off

#rem Disable Windows Defender. For this to work you have to manually disable "Tamper protection"
#powershell "if ((Get-ItemProperty -Path 'HKLM:SOFTWARE\Microsoft\Windows Defender\Features').TamperProtection -ne 4) { msg * 'Windows Defender can not be disabled. Tamper Protection is still active' }"
#reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v SpyNetReporting /t REG_DWORD /d 0 /f
#reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f
#reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
#reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
#reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Off" /f
#reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f
#reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v SecurityHealth /f


rem Make sure junk apps like Candy Crush don't get installed when we login first time with our Administrator account
reg load HKLM\DEFAULT c:\users\default\ntuser.dat
reg add HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v PreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg unload HKLM\DEFAULT

rem Disable the "how to use Windows" contextual popups
reg add HKLM\Software\Policies\Microsoft\Windows\CloudContent /v DisableSoftLanding /t REG_DWORD /d 1 /f


rem Disable Edge Browser preload on startup. We'll never use it anyway, saves memory and startup time
reg add HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main /v AllowPrelaunch /t REG_DWORD /d 0 /f

rem Enable Remote Desktop
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

rem Do not start Edge on first-login after user created
reg load HKLM\DEFAULT c:\users\default\ntuser.dat
reg add HKLM\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContent-310093Enabled /t REG_DWORD /d 0 /f
reg unload HKLM\DEFAULT

rem Disable Look for App in Store prompt when opening unknown file type
reg add HKLM\Software\Policies\Microsoft\Windows\Explorer /v NoUseStoreOpenWith /t REG_DWORD /d 1 /f

rem Remove useless Windows components
dism /online /norestart /disable-feature /featurename:Printing-PrintToPDFServices-Features
dism /online /norestart /disable-feature /featurename:Printing-XPSServices-Features

rem Disable Windows Game DVR and Game Bar
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v AppCaptureEnabled /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR /v GameDVR_Enabled /t REG_DWORD /d 0 /f

rem Disable Game Mode
reg add HKCU\Software\Microsoft\GameBar /v AutoGameModeEnabled /t REG_DWORD /d 0 /f
reg add HKCU\System\GameConfigStore /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f


rem Hide Search Box from Task Bar
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f

rem Disable Cortana
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v CortanaConsent /t REG_DWORD /d 0 /f

rem Hide Cortana button
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowCortanaButton /t REG_DWORD /d 0 /f

rem Show My Computer on Desktop
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f


# Afficher tous les icônes dans la barre de notifications.
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer /v EnableAutoTray /t REG_DWORD /d 0 /f
@echo off
echo Restart explorer.exe 
Taskkill /F /IM "explorer.exe">nul 2>&1
Start "" "explorer.exe"
exit



