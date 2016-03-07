$packageName = 'findandreplace'
$url = 'http://heanet.dl.sourceforge.net/project/findandreplace/findandreplace/2.0/FAR-2.0-win.zip'

Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"