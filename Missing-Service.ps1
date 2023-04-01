
################################################################################################
#For every computer in a domain, create a list of computers that don't have a service installed.
#

Get-ADComputer -Filter * -SearchBase "DC=BCS,DC=LOCAL" -Properties * `
    | Get-Service -name "Zabbix Agent" `
    | Export-Csv C:\ADComputer-Missing-Service.csv -NoTypeInformation
    
    
################################################################################################
#Start/Restart/Stop service running across all domain computers



