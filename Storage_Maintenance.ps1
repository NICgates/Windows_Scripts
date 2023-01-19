#Computer Storage Maintenance Script    
#------------------------------------------------------------------------

Set-ExecutionPolicy RemoteSigned 

#------------------------------------------------------------------------
# 1. If a user has NOT logged into computre > 1 months, then delete entire user directory. 
Get-ChildItem –Path "C:\Users\" -Recurse | ` 
Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-30))} | `
Where-Object {$_.Name -notin "Nick" -and "bcsadmin" -and "Administrator"} | Remove-Item

#------------------------------------------------------------------------
# 2. If a user has logged into computer < 3 months, then delete unnecessary temp and cached data. 
$userslist = Get-ChildItem -Directory "C:\Users"
foreach ($userVar in $userslist) {
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Temp" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Local\Google\User Data\Profile 1\Cache\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Local\Google\User Data\Profile 1\Code Cache\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Cache\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Code Cache\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Roaming\Microsoft\Teams\Service Worker\CacheStorage\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Roaming\Microsoft\Teams\Cache\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Local\Mozilla\Firefox\Profiles\*.default-release\cache2\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
}

#------------------------------------------------------------------------
Remove-Item C:\Windows\Temp\*.* -Force -ErrorAction SilentlyContinue
Clear-RecycleBin -Force

Set-ExecutionPolicy Restricted
