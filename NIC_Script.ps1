#
#NIC_Script
#
#


Write-Host "1 - Get lastLogin List `r`n2 - Clear up C drive space" -ForegroundColor Green
Write-Host "3 - Restart Services `r`n4 - L"


$action = Read-Host -Prompt "What would you like to run? `r`n NIC_Script:" -ForegroundColor Green

# Get lastlogin date from domain
if ($action -eq '1') {


# Clear up C drive space by running a diskCleanup/windowsTemp/systemProtectionRestore/appdataLocalTemp
} elseif ($action -eq '2') {


# Restart services such as spooler
} elseif ($action -eq '3') {

# Run system health tests
} elseif ($action -eq '4') {


# Set settings including power settings, network settings, Programs to install, max usage of system protection storage,
} elseif ($action -eq '5') {


} else {
Write-Host "Have a nice day!"

}
