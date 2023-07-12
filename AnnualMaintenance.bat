start "UNICODE" cmd /U

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


::Uninstall Teams 


::Disable Dell System Repair


::##############################################################################
:: Group Policy update
gpupdate /force 
gpresult -h C:\gpresultJuly.html

::##############################################################################
:: Get PC stats
echo ##########################################################################################   >> C:\Users\Nick\Desktop\PCstats.txt
hostname >> C:\Users\Nick\Desktop\PCstats.txt
echo --------- HARD DRIVE STATUS ---------  >> C:\Users\Nick\Desktop\PCstats.txt
wmic diskdrive get model,status >> C:\Users\Nick\Desktop\PCstats.txt
wmic logicaldisk get name,size,freespace >> C:\Users\Nick\Desktop\PCstats.txt
echo ---------  NETWORK STATUS --------- >> C:\Users\Nick\Desktop\PCstats.txt
ipconfig | find /i "IPv4 Address" >> C:\Users\Nick\Desktop\PCstats.txt
ipconfig /all | find /i "DNS Servers" >> C:\Users\Nick\Desktop\PCstats.txt


echo "Restart computer?"
pause
shutdown /r
