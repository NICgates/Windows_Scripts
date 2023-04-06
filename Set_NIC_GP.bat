::Set Wireless Networks
netsh wlan set profileparameter name="[SSID1]" connectionmode=Manual
netsh wlan set hostednetwork mode=allow SSID="[SSID1]" Key="[PASSWORD]"
netsh wlan set profileparameter name="[SSID2]" connectionmode=Auto

::Set primary and secondary DNS
netsh interface ipv4 set dns name="Wi-Fi" static [PRIMARY DNS]
netsh interface ipv4 add dns name="Wi-Fi" [SECONDARY DNS] index=2

::Enable Network Discovery 
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes

::Update Group Policy
gpupdate /force
::gpresult -h C:\gpresult.html

::Restart the PC
echo "Restart computer?"
pause
shutdown /r
