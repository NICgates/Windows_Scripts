#
#Configure Network adapters
#

# Disable IPV6 on all network adapters
Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6

# Set DNS


# Reset Hostfile 
Remove-Item %WinDir%\System32\drivers\etc\hosts
New-Item "%WinDir%\System32\drivers\etc\hosts.txt" -ItemType File -Value "# 127.0.0.1 localhost #"
