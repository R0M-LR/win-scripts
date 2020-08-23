@echo off
echo Restart explorer.exe 
Taskkill /F /IM "explorer.exe">nul 2>&1
Start "" "explorer.exe"
exit