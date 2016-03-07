$packageName = 'findandreplace'
$url = 'http://heanet.dl.sourceforge.net/project/findandreplace/findandreplace/2.0/FAR-2.0-win.zip'
$location = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$shortcutFilePath = Join-Path -path $location -childpath 'far.ink'
$targetPath = Join-Path -path $location -childpath 'far.exe'

Install-ChocolateyZipPackage "$packageName" "$url" "$location"

Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath