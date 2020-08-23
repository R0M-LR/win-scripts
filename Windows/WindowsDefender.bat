@Echo Off

net sess>nul 2>&1||(powershell start cmd -ArgumentList """/c %~0""" -verb Runas & exit)

:_Start
Cls & Mode CON  LINES=11 COLS=60 & Color 0E &Title Created By FreeBooter
Echo.
Echo.       
Echo         Type (D) letter to Disable Windows Defender   
Echo.       
Echo.
Echo.
Echo.         
Echo         Type (E) letter to Enable Windows Defender    
Echo.         



Set /p input= RESPONSE: 
If /i  Not %input%==D (Goto :_Ex) Else (Goto :_Disbale)

:_Ex
If /i  Not %input%==E  (Goto :_Start) Else (Goto :_Enable)





:_Disbale
:: Disable Windows Defender with  Group Policy. 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d "1" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f  > Nul

Cls & Mode CON  LINES=5 COLS=49 & Color 0E & Title - WARNING -
 Echo.
 Echo. 
 Echo            Windows Defender Disabled
Ping -n 5  localhost > Nul
Cls
Goto :Reboot


:_Enable
:: Enable Windows Defender with  Group Policy. 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "0" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "0" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "0" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d "0" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /f > Nul


Cls & Mode CON  LINES=5 COLS=49 & Color 0E & Title - WARNING -
 Echo.
 Echo. 
 Echo            Windows Defender Enabled

Ping -n 5  localhost > Nul
Cls



:Reboot 
CHOICE /C YN /M "Press Y to Reboot, N for exiting script."


If %errorlevel% == 1 ( Shutdown /r /t 0) Else (Exit)