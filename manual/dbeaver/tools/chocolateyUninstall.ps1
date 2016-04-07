function UnInstall-DBeaver {
    [CmdletBinding()]
    param (
        $location
    )

    $path = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DBeaver').UninstallString

    if($path -ne $null) {
        Uninstall-ChocolateyPackage 'dbeaver' 'exe' '/D /S' $path -validExitCodes @(0)
    }
}

$location = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 

UnInstall-DBeaver -location $location