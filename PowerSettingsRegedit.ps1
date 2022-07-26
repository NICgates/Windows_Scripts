#Path to power setting keys.
$stingVar = "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings"
$querylist = reg query $stingVar

#Add Attributes value with data value of 2 to each subkey of PowerSettings.
foreach ($regfolder in $querylist){
    $active = $regfolder -replace "HKEY_LOCAL_MACHINE" , "HKLM:"
    Get-ItemProperty -Path $active
    Set-ItemProperty -Path "$active" -Name "Attributes" -Value '2'
}
