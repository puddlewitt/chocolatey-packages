$packageName = 'findandreplace'
$url = 'http://heanet.dl.sourceforge.net/project/findandreplace/findandreplace/2.0/FAR-2.0-win.zip'
$location = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$desktop = [Environment]::GetFolderPath("Desktop")
$shortcutFilePath = Join-Path -path $desktop -childpath 'far.lnk'
$execDir = Join-Path -path $location -childpath 'far'
$targetPath = Join-Path -path $execDir -childpath 'far.exe'

Install-ChocolateyZipPackage "$packageName" "$url" "$location"

Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath -workingDirectory $execDir