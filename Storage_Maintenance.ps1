#Computer Storage Maintenance Script    
#------------------------------------------------------------------------

Set-ExecutionPolicy RemoteSigned 

#------------------------------------------------------------------------
# 1. If a user has NOT logged into computre > 1 months, then delete entire user directory. 
Get-ChildItem –Path "C:\Users\Owner\Documents\" -Recurse | ` 
Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-30))} | `
Where-Object {$_.Name -notin "Nick" -and "bcsadmin" -and "Administrator"} | Remove-Item

#------------------------------------------------------------------------
# 2. If a user has logged into computer < 3 months, then delete unnecessary temp and cached data. 
$userslist = Get-ChildItem -Directory "C:\Users"
foreach ($userVar in $userslist) {
    #$userLastLogon = Get-ADUser -Identity $userVar -Properties LastLogon
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
}


#------------------------------------------------------------------------
Remove-Item C:\Windows\Temp\*.* -Force -ErrorAction SilentlyContinue
Clear-RecycleBin -Force

Set-ExecutionPolicy Restricted
