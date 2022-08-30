$software = "Syncro";
$installed = (Get-ItemProperty -path Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\Software\\Microsoft\Windows\CurrentVersion\Uninstall\* | Where DisplayName -eq $software )
$installed.displayname
if ($installed.displayName -match "Syncro") {
    Write-Host $software "is Installed."
} else {
    Write-Host $software "is not installed."
}
