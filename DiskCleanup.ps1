################################################################################
#
# Clean up C drive space in user directories.
#
################################################################################

Set-ExecutionPolicy RemoteSigned

$userslist = Get-ChildItem -Directory "C:\Users"

foreach ($var in $userslist) {
    if (Test-Path C:\Users\$var\AppData\Temp) {
        Remove-Item C:\Users\$var\AppData\Temp\*.* -Force -ErrorAction SilentlyContinue
    }
    if (Test-Path "C:\Users\$var\AppData\Local\Google\User Data\Profile 1\Cache\") {
        Remove-Item "C:\Users\$var\AppData\Local\Google\User Data\Profile 1\Cache\*.*" -Force -ErrorAction SilentlyContinue
    }
    if (Test-Path "C:\Users\$var\AppData\Local\Google\User Data\Profile 1\Code Cache\") {
        Remove-Item "C:\Users\$var\AppData\Local\Google\User Data\Profile 1\Code Cache\*.*" -Force -ErrorAction SilentlyContinue
    }
#    if (Test-Path "C:\Users\$var\AppData\Local\Google\User Data\Default\Cache\") {
#        Remove-Item "C:\Users\$var\AppData\Local\Google\User Data\Default\Cache\*.*" -Force -ErrorAction SilentlyContinue
#    }
#    if (Test-Path "C:\Users\$var\AppData\Local\Google\User Data\Default\Code Cache\") {
#        Remove-Item "C:\Users\$var\AppData\Local\Google\User Data\Default\Code Cache\*.*" -Force -ErrorAction SilentlyContinue
#    }
    if (Test-Path "C:\Users\$var\AppData\Roaming\Microsoft\Teams\Service Worker\CacheStorage\") {
        Remove-Item "C:\Users\$var\AppData\Roaming\Microsoft\Teams\Service Worker\CacheStorage\*.*" -Force -ErrorAction SilentlyContinue
    }
    if (Test-Path "C:\Users\$var\AppData\Roaming\Microsoft\Teams\Cache\") {
        Remove-Item "C:\Users\$var\AppData\Roaming\Microsoft\Teams\Cache\*.*" -Force -ErrorAction SilentlyContinue
    }

}

Remove-Item C:\Windows\Temp\*.* -Force -ErrorAction SilentlyContinue
Clear-RecycleBin -Force

Set-ExecutionPolicy Restricted
