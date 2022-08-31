#
# Restart Service
#

$service = "Print Spooler"

Stop-Service $service
Start-Service $service 
