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
Remove-Item C:\Windows\Temp\*.* -Force -ErrorAction SilentlyContinue
Clear-RecycleBin -Force


::##############################################################################
:: Group Policy update
gpupdate /force 
gpresult -h C:\gpresultJuly.html

::##############################################################################
:: Get PC stats
echo "#####################################" >> [Location]\PCstats.txt
hostname >> [Location]\PCstats.txt
echo "HDD Health Stats:" >> [Location]\PCstats.txt
wmic diskdrive get model,status >> [Location]\PCstats.txt
fsutil volume diskfree c: >> [Location]\PCstats.txt


echo "Restart computer?"
pause
shutdown /r
