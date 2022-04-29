#
# Get the last login of computers on a domain in a specific OU,
#     then output that list to a file. This allows for identifying
#     missing computers, or computers that are no longer on the domain
#     and can be taken off.
#

# Get last login list of computers from a specific OU.
Get-ADComputer -Filter * -SearchBase "OU=Students,DC=BCS,DC=LOCAL" -Properties * `
    | Sort LastLogon | Select Name, LastLogonDate,@{Name='LastLogon';Expression={[DateTime]::FromFileTime($_.LastLogon)}} `
    | Export-Csv C:\Students-last-logon-ou.csv -NoTypeInformation

# Get last login list of all computers on the domain.
Get-ADComputer -Filter * -SearchBase "DC=BCS,DC=LOCAL" -Properties * `
    | Sort LastLogon | Select Name, LastLogonDate,@{Name='LastLogon';Expression={[DateTime]::FromFileTime($_.LastLogon)}} `
    | Export-Csv C:\ADComputer-last-logon-ou.csv -NoTypeInformation
