#Computer Storage Maintenance Script    
#------------------------------------------------------------------------

Set-ExecutionPolicy RemoteSigned 

#------------------------------------------------------------------------
# 1. If a user has NOT logged into computre > 1 months, then delete entire user directory. 
Get-ChildItem –Path "C:\Users\" -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-30))} | `
Where-Object {$_.Name -notin "Nick" -and "bcsadmin" -and "Administrator"} | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
#------------------------------------------------------------------------
# 2. If a user has logged into computer < 3 months, then delete unnecessary temp and cached data. 
$userslist = Get-ChildItem -Directory "C:\Users"
foreach ($userVar in $userslist) {
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Temp" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Local\Google\User Data\Profile 1\Cache\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Local\Google\User Data\Profile 1\Code Cache\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Cache\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Local\Google\User Data\Default\Code Cache\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Roaming\Microsoft\Teams\Service Worker\CacheStorage\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Roaming\Microsoft\Teams\Cache\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Local\Mozilla\Firefox\Profiles\*.default-release\cache2\" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
        Get-ChildItem -Path "C:\Users\$userVar\AppData\Roaming\Teams" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue

}

#------------------------------------------------------------------------
# 3. Remove unnecessary programs, such as teams.  

    $Bloatware = @(

        #Unnecessary Windows 10 AppX Apps
        "Microsoft.BingNews"
        "Microsoft.GetHelp"
        "Microsoft.Getstarted"
        "Microsoft.Messaging"
        "Microsoft.Microsoft3DViewer"
        "Microsoft.MicrosoftOfficeHub"
        "Microsoft.MicrosoftSolitaireCollection"
        "Microsoft.NetworkSpeedTest"
        "Microsoft.News"
        "Microsoft.Office.Lens"
        "Microsoft.Office.OneNote"
        "Microsoft.Office.Sway"
        "Microsoft.OneConnect"
        "Microsoft.People"
        "Microsoft.Print3D"
        "Microsoft.RemoteDesktop"
        "Microsoft.SkypeApp"
        "Microsoft.StorePurchaseApp"
        "Microsoft.Office.Todo.List"
        "Microsoft.Whiteboard"
        "Microsoft.WindowsAlarms"
        #"Microsoft.WindowsCamera"
        "microsoft.windowscommunicationsapps"
        "Microsoft.WindowsFeedbackHub"
        "Microsoft.WindowsMaps"
        "Microsoft.WindowsSoundRecorder"
        "Microsoft.Xbox.TCUI"
        "Microsoft.XboxApp"
        "Microsoft.XboxGameOverlay"
        "Microsoft.XboxIdentityProvider"
        "Microsoft.XboxSpeechToTextOverlay"
        "Microsoft.ZuneMusic"
        "Microsoft.ZuneVideo"

        #Sponsored Windows 10 AppX Apps
        #Add sponsored/featured apps to remove in the "*AppName*" format
        "*EclipseManager*"
        "*ActiproSoftwareLLC*"
        "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
        "*Duolingo-LearnLanguagesforFree*"
        "*PandoraMediaInc*"
        "*CandyCrush*"
        "*BubbleWitch3Saga*"
        "*Wunderlist*"
        "*Flipboard*"
        "*Twitter*"
        "*Facebook*"
        "*Spotify*"
        "*Minecraft*"
        "*Royal Revolt*"
        "*Sway*"
        "*Speed Test*"
        "*Dolby*"
             
        #Optional: Typically not removed but you can if you need to for some reason
        #"*Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe*"
        #"*Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe*"
        #"*Microsoft.BingWeather*"
        #"*Microsoft.MSPaint*"
        #"*Microsoft.MicrosoftStickyNotes*"
        #"*Microsoft.Windows.Photos*"
        #"*Microsoft.WindowsCalculator*"
        #"*Microsoft.WindowsStore*"
    )
    foreach ($Bloat in $Bloatware) {
        Get-AppxPackage -Name $Bloat| Remove-AppxPackage
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        Write-Output "Trying to remove $Bloat."
    }
    Get-AppxPackage -Name Microsoft.Print3D | Remove-AppxPackage

#------------------------------------------------------------------------
Remove-Item C:\Windows\Temp\*.* -Force -ErrorAction SilentlyContinue
#Remove-Item C:\Windows\Prefetch\*.* -Force -ErrorAction SilentlyContinue
#Remove-Item "C:\Documents and Settings*\Local Settings\Temp\*.*" -Force -ErrorAction SilentlyContinue
Remove-Item C:\$Recycle.bin\*.* -Force -ErrorAction SilentlyContinue    
Clear-RecycleBin -Force



Set-ExecutionPolicy Restricted
