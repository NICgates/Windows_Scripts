::Set Wireless Networks
netsh wlan set profileparameter name="BCS" connectionmode=Manual
netsh wlan set hostednetwork mode=allow SSID="BCS2" Key="$chool1$Cool"
netsh wlan set profileparameter name="BCS2" connectionmode=Auto

::Set primary and secondary DNS
netsh interface ipv4 set dns name="Wi-Fi" static 192.168.1.250
netsh interface ipv4 add dns name="Wi-Fi" 192.168.1.251 index=2

::Enable Network Discovery 
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes

::Update Group Policy
gpupdate /force
::gpresult -h C:\gpresult.html

pause
