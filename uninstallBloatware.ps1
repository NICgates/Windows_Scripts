# Uninstall bloatware on Windows 10. 
# Credit to Github/Wdomon.

$bloatware = @(
    "*3DBuilder*"
    "*Bing*"
    "*CandyCrush*"
    "*DellInc.DellDigitalDelivery*"
    "*Dropbox*"
    "*Facebook*"
    "*feedbackhub*"
    "*freshpaint*"
    "*gethelp*"
    "*getstarted*"
    "*king.com*"
    "*Linkedin*"
    "*maps*"
    "*Microsoft.Messaging*"
    "*Microsoft.MsixPackagingTool*"
    "*Microsoft.OneConnect*"
    "*Microsoft.People*"
    "*Microsoft.RemoteDesktop*"
    "*Microsoft.YourPhone*"
    "*Microsoft3DViewer*"
    "*MixedReality*"
    "*Netflix*"
    "*Office*"
    "*print3D*"
    "*Sketchable*"
    "*Skype*"
    "*Solitaire*"
    "*soundrecorder*"
    "*Spotify*"
    "*Twitter*"
    "*wallet*"
    "*windowsalarms*"
    "*windowscommunicationsapps*"
    "*Windowsphone*"
    "*xbox*"
    "*xboxapp*"
    "*xboxgameoverlay*"
    "*yourphone*"
    "*Zune*"    
)

foreach ($bloat in $bloatware) {
    if ($app = Get-AppxPackage -AllUsers $bloat) {
        Write-Progress -CurrentOperation "$($app.Name) app found. Uninstalling..." -Activity "Uninstalling"
        $app | Remove-AppxPackage -allusers -EA Stop                
    }
    if ($provapp = Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like $bloat}) {
        Write-Progress -CurrentOperation "$($provapp.DisplayName) provisioned app found. Uninstalling..." -Activity "Uninstalling"
        $provapp | Remove-AppxProvisionedPackage -Online -EA Stop  
    }
}
