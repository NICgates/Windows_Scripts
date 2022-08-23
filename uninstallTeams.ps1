#
# Uninstall Teams 
#


Set-ExecutionPolicy RemoteSigned

$userslist = Get-ChildItem -Directory "C:\Users"

foreach ($userVar in $userslist) {
    if (Test-Path "C:\Users\$userVar\AppData\Local\Microsoft\Teams\Update.exe") {
        Start-Process -FilePath "C\Users\$userVar\AppData\Local\Microsoft\Teams\Update.exe" -ArgumentList "-uninstall -s" -EA Stop
    }
}

Remove-Item C:\Users\*\AppData\Local\Microsoft\Teams* -Force -ErrorAction SilentlyContinue

Set-ExecutionPolicy Restricted 
