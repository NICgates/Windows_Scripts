#Computer Storage Maintenance Script    
#------------------------------------------------------------------------
Set-ExecutionPolicy RemoteSigned 

$Logfile = "C:\PS\Logs\proc_$env:computername.log"
function WriteLog{
    Param ([string]$LogString)
    $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $LogMessage = "$Stamp $LogString"
    Add-content $LogFile -value $LogMessage
}
$hostname = hostname
$userslist = Get-ChildItem -Directory "C:\Users"

foreach ($userVar in $userslist) {
    $userLastLogon = Get-ADUser -Identity $userVar -Properties LastLogon
    # 1. If a user has logged into computer < 3 months, then delete unnecessary temp and cached data. 
    if ($userLastLogon < 90) {
        if (Test-Path C:\Users\$userVar\AppData\Temp) {
            Remove-Item C:\Users\$userVar\AppData\Temp\*.* -Force -ErrorAction SilentlyContinue
        }
        if (Test-Path "C:\Users\$userVar\AppData\Local\Google\User Data\Profile 1\Cache\") {
            Remove-Item "C:\Users\$userVar\AppData\Local\Google\User Data\Profile 1\Cache\*.*" -Force -ErrorAction SilentlyContinue
        }
        if (Test-Path "C:\Users\$userVar\AppData\Local\Google\User Data\Profile 1\Code Cache\") {
            Remove-Item "C:\Users\$vuserVar\AppData\Local\Google\User Data\Profile 1\Code Cache\*.*" -Force -ErrorAction SilentlyContinue
        }
        if (Test-Path "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Cache\") {
            Remove-Item "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Cache\*.*" -Force -ErrorAction SilentlyContinue
        }
        if (Test-Path "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Code Cache\") {
            Remove-Item "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Code Cache\*.*" -Force -ErrorAction SilentlyContinue
        }
        if (Test-Path "C:\Users\$userVar\AppData\Roaming\Microsoft\Teams\Service Worker\CacheStorage\") {
            Remove-Item "C:\Users\$userVar\AppData\Roaming\Microsoft\Teams\Service Worker\CacheStorage\*.*" -Force -ErrorAction SilentlyContinue
        }
        if (Test-Path "C:\Users\$userVar\AppData\Roaming\Microsoft\Teams\Cache\") {
            Remove-Item "C:\Users\$userVar\AppData\Roaming\Microsoft\Teams\Cache\*.*" -Force -ErrorAction SilentlyContinue
        }
        if (Test-Path "C:\Users\$userVar\AppData\Local\Mozilla\Firefox\Profiles\*.default-release\cache2\") {
            Remove-Item "C:\Users\$userVar\AppData\Local\Mozilla\Firefox\Profiles\*.default-release\cache2\*.*" -Force -ErrorAction SilentlyContinue
        }
        WriteLog "1. Deleted user temperary files"
    }
    # 2. If a user has NOT logged into computre > 6 months, then delete entire user directory. 
    if ($userLastLogon > 90) {  
        Remove-Item C:\Users\$userVar\*.* -Force -ErrorAction SilelntlyContinue
        WriteLog "2. Deleted $userVar directory from $hostname"
    }
}

Remove-Item C:\Windows\Temp\*.* -Force -ErrorAction SilentlyContinue
Clear-RecycleBin -Force

Set-ExecutionPolicy Restricted
