##########################################################
# Uninstall unnecessary Windows apps

$appList = @(
    "Microsoft.BingWeather*"
    "Microsoft.GetHelp*"
    "Microsoft.Microsoft3DViewer*"
    "Microsoft.MicrosoftOfficeHub*"
    "Microsoft.MicrosoftSolitaireCollection*"
    "Microsoft.MicrosoftStickyNotes*"
    "Microsoft.MixedReality.Portal*"
    "Microsoft.Office.OneNote*"
    "Microsoft.People*"
    "Microsoft.Print3D*"
    "Microsoft.ScreenSketch*"
    "Microsoft.SkypeApp*"
    "Microsoft.StorePurchaseApp*"
    "Microsoft.Wallet*"
    "Microsoft.WindowsAlarms*"
    "Microsoft.windowscommunicationsapps*"
    "Microsoft.WindowsFeedbackHub*"
    "Microsoft.WindowsMaps*"
    "Microsoft.WindowsSoundRecorder*"
    "Microsoft.WindowsStore*"
    "Microsoft.Xbox.TCUI*"
    "Microsoft.XboxApp*"
    "Microsoft.XboxGameOverlay*"
    "Microsoft.XboxGamingOverlay*"
    "Microsoft.XboxIdentityProvider*"
    "Microsoft.XboxSpeechToTextOverlay*"
    "Microsoft.YourPhone*"
    "Microsoft.ZuneMusic*"
    "Microsoft.ZuneVideo*"
    "*ActiproSoftwareLLC*"
    "*CandyCrush*"
    "*Duolingo*"
    "*EclipseManager*"
    "*Facebook*"
    "*king.com.FarmHeroesSaga*"
    "*Flipboard*"
    "*HiddenCityMysteryofShadows*"
    "*HuluLLC.HuluPlus*"
    "*Pandora*"
    "*Plex*"
    "*ROBLOXCORPORATION.ROBLOX*"
    "*Spotify*"
    "*Netflix*"
    "*Microsoft.SkypeApp*"
    "*Twitter*"
    "*Wunderlist*"
)

foreach ($app in $appList) {
    Get-AppxPackage -allusers $app | Remove-AppxPackage -ErrorAction SilentlyContinue               
}
