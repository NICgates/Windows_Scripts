::##############################################################################
:: Join Networks 
netsh wlan set profileparameter name="BCS" connectionmode=Manual
netsh wlan set hostednetwork mode=allow SSID="BCS2" Key="[PASSWORD]"
netsh wlan set profileparameter name="BCS2" connectionmode=Auto

::##############################################################################
:: Set DNS
netsh interface ipv4 set dns name="Wi-Fi" static 192.168.1.250
netsh interface ipv4 add dns name="Wi-Fi" 192.168.1.251 index=2

::##############################################################################
:: Turn on Network Discovery for Domain Network Profile 
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes

::##############################################################################
:: Turn on System Protection, delete old restore points, create a restore point


::##############################################################################
:: C Drive Cleanup



::##############################################################################
:: Group Policy update
gpupdate /force 
gpresult -h C:\gpresultJuly.html
echo "Restart computer?"
pause
shutdown /r
