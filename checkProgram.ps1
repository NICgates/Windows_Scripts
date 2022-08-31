

# Set the software to application to install or uninstall.
$software = "Hard Disk Sentinel";
$installed = (Get-ItemProperty -path Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\Software\\Microsoft\Windows\CurrentVersion\Uninstall\* | Where DisplayName -eq $software )
$installed.displayname

#---------------------------------------------------------------------------
#UNINSTALL APPLICATION
if ($installed.displayName -match $software) {
    Write-Host $software "found on this machine, and will be uninstalled."
    #(Get-WMIObject Win32_Product -Filter name=$software).Uninstall()
} else {
    Write-Host $software "is not installed."
}

#---------------------------------------------------------------------------
#INSTALL APPLICATION
if ($installed.displayName -match $software) {
    Write-Host $software "is Installed."
} else {
    Write-Host $software "not found, will installed it now."
    #Install Program
} 
