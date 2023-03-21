#
# Uninstall Teams 
#

Set-ExecutionPolicy RemoteSigned

$userslist = Get-ChildItem -Directory "C:\Users"

#Uninstall Teams from each user
foreach ($userVar in $userslist) {
    if (Test-Path "C:\Users\$userVar\AppData\Local\Microsoft\Teams\Update.exe") {
        Start-Process -FilePath "C:\Users\$userVar\AppData\Local\Microsoft\Teams\Update.exe" -ArgumentList "-uninstall -s" -EA Stop
    }
}

#Uninstall Teams Machine-Wide Installer
(Get-WMIObject Win32_Product -Filter 'name="Teams Machine-Wide Installer"').Uninstall()

#Cleanup files
Remove-Item C:\Users\*\AppData\Local\Microsoft\Teams* -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item C:\Users\*\AppData\Roaming\Microsoft\Teams* -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "C:\Program Files (x86)\Teams Installer*" -Recurse -Force -ErrorAction SilentlyContinue

Set-ExecutionPolicy Restricted 
