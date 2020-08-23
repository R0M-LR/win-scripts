printui.exe /dl /n "Fax"
printui.exe /dl /n "OneNote"
dism /online /norestart /disable-feature /featurename:Printing-PrintToPDFServices-Features
dism /online /norestart /disable-feature /featurename:Printing-XPSServices-Features
pause