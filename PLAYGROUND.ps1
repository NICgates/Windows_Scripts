#Just random commands put together. Might turn into something useful. 


Get-WindowsCapability -Online | Where-Object {$_.Name -like "*ActiveDirectory.DS-LDS*"} | Add-WindowsCapability -Online 
Get-ADUser -Filter * -Properties LastLogonDate | Where-Object{$_.LastLogonDate -lt (Get-Date).AddDays(-90)} 
Get-ADUser -Identity username -Properties "LastLogonDate"
Get-ADComputer -identity computername -Properties * | FT Name, LastLogonDate


$userslist = Get-ChildItem -Directory "C:\Users"
foreach ($userVar in $userslist) {
    if (Get-ADUser -Identity $userVar -Properties LastLogonDate | Where-Object{$_.LastLogonDate -lt (Get-Date).AddDays(-90)}) {
        Remove-Item C:\Users\$userVar\* -Force -ErrorAction SilentlyContinue
    }
}

Get-EventLog Security -Computer "BCS-MOB6-03" -InstanceId 4624 -EntryType SuccessAudit |
    Where-Object {
        $_.Message -match 'logon type:\s+(2|10)\s' -and
        $_.Message -match 'new logon:[\s\S]*?account name:\s+(.*?)\s'
    } |
    Sort-Object TimeGenerated -Desc |
    Select-Object -First 1 TimeGenerated, @{n='Account';e={$matches[1]}}
   
$usersList = Get-childItem -Path "C:\Users\" | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-30))} | `
Where-Object {($_.Name -notin "Nick") -and ($_.Name -notin "bcsadmin") -and ($_.Name -notin "Administrator")} | FT name
foreach ($userVar in $usersList) {
    # Get-ChildItem -Path "C:\Users\$userVar\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
    # echo $userVar
    Get-ChildItem -Path C:\Users\$userVar\ | echo
}
