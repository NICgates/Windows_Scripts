################################################################################
#
# Clean up C drive space in user directories.
#
################################################################################

Set-ExecutionPolicy RemoteSigned

$userslist = Get-ChildItem -Directory "C:\Users"

foreach ($userVar in $userslist) {
    if (Test-Path C:\Users\$userVar\AppData\Temp) {
        Remove-Item C:\Users\$userVar\AppData\Temp\*.* -Force -ErrorAction SilentlyContinue
    }
    if (Test-Path "C:\Users\$userVar\AppData\Local\Google\User Data\Profile 1\Cache\") {
        Remove-Item "C:\Users\$userVar\AppData\Local\Google\User Data\Profile 1\Cache\*.*" -Force -ErrorAction SilentlyContinue
    }
    if (Test-Path "C:\Users\$userVar\AppData\Local\Google\User Data\Profile 1\Code Cache\") {
        Remove-Item "C:\Users\$vuserVar\AppData\Local\Google\User Data\Profile 1\Code Cache\*.*" -Force -ErrorAction SilentlyContinue
    }
#    if (Test-Path "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Cache\") {
#        Remove-Item "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Cache\*.*" -Force -ErrorAction SilentlyContinue
#    }
#    if (Test-Path "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Code Cache\") {
#        Remove-Item "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Code Cache\*.*" -Force -ErrorAction SilentlyContinue
#    }
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

Remove-Item C:\Windows\Temp\*.* -Force -ErrorAction SilentlyContinue
Clear-RecycleBin -Force

Set-ExecutionPolicy Restricted


######################################################
# The follow commands does what the script above does. 

# Remove-Item C:\Users\*\AppData\Temp\*.* -Force -ErrorAction SilentlyContinue
# Remove-Item "C:\Users\*\AppData\Local\Google\User Data\Profile 1\Cache\*.*" -Force -ErrorAction SilentlyContinue
# Remove-Item "C:\Users\*\AppData\Local\Google\User Data\Profile 1\Code Cache\*.*" -Force -ErrorAction SilentlyContinue
# Remove-Item "C:\Users\*\AppData\Local\Google\User Data\Default\Cache\*.*" -Force -ErrorAction SilentlyContinue
# Remove-Item "C:\Users\*\AppData\Local\Google\User Data\Default\Code Cache\*.*" -Force -ErrorAction SilentlyContinue
# Remove-Item "C:\Users\*\AppData\Roaming\Microsoft\Teams\Service Worker\CacheStorage\*.*" -Force -ErrorAction SilentlyContinue
# Remove-Item "C:\Users\*\AppData\Roaming\Microsoft\Teams\Cache\*.*" -Force -ErrorAction SilentlyContinue
# Remove-Item "C:\Users\*\AppData\Local\Mozilla\Firefox\Profiles\*.default-release\cache2\*.*" -Force -ErrorAction SilentlyContinue
# Remove-Item C:\Windows\Temp\*.* -Force -ErrorAction SilentlyContinue
# Clear-RecycleBin -Force




