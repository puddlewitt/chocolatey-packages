$packageName = 'findandreplace'
$filename = 'FAR-2.0-win.zip'
$desktop = [Environment]::GetFolderPath("Desktop")
$shortcutFilePath = Join-Path -path $desktop -childpath 'far.lnk'

Uninstall-ChocolateyZipPackage "$packageName" "$filename"

Remove-Item $shortcutFilePath