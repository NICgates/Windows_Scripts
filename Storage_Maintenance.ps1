#Computer Maintenance Script    
#------------------------------------------------------------------------
$Logfile = "C:\PS\Logs\proc_$env:computername.log"
function WriteLog{
    Param ([string]$LogString)
    $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $LogMessage = "$Stamp $LogString"
    Add-content $LogFile -value $LogMessage
}


$userslist = Get-ChildItem -Directory "C:\Users"

# 1. If a user has logged into computer < 3 months, then delete unnecessary temp and cached data. 
  
  
# 2. If a user has NOT logged into computre > 3 months, then delete entire user directory. 
  
  
Remove-Item C:\Windows\Temp\*.* -Force -ErrorAction SilentlyContinue
Clear-RecycleBin -Force
