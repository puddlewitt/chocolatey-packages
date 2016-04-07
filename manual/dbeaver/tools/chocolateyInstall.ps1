function Build-Url {
    [CmdletBinding()]
	param (
		$version
	)

	$baseUrl = [string]::Format('http://dbeaver.jkiss.org/files/{0}/', $version)

	return [PSCustomObject]@{
        Url64bit=[string]::Format('{1}dbeaver-ee-{0}-x86-setup.exe', $version, $baseUrl)
        Url32bit=[string]::Format('{1}dbeaver-ee-{0}-x86_64-setup.exe', $version, $baseUrl)
    }
}

function Download-Binary {
    [CmdletBinding()]
    param (
        $urls,
        $tempInstallPath,
        $tempPackageName
    )

    Get-ChocolateyWebFile -packageName $tempPackageName -fileFullPath $tempInstallPath -url $urls.Url32bit -url64bit $urls.Url64bit
}

function Execute-Installer {
    [CmdletBinding()]
    param (
        $tempInstallPath
    )

    $installArgs = [string]::Format('/S')

    if($env:ChocolateyBinRoot -ne $null) {
        $installArgs = [string]::Format('{0} /D "{1}"', $env:ChocolateyBinRoot)
    }

    Start-Process -FilePath $tempInstallPath -ArgumentList $installArgs -Wait -NoNewWindow
}

function Install-DBeaver {
    [CmdletBinding()]
    param (
        $location
    )

    $tempPackageName = 'dbeaver.exe'
    $version = $env:chocolateyPackageVersion
	$urls = Build-Url -version $version
    $tempInstallPath = [string]::Format('{0}\{1}', $location, $tempPackageName)

    Download-Binary -url $urls -tempInstallPath $tempInstallPath -tempPackageName $tempPackageName

    # No need to uninstall existing as "It will automatically upgrade version (if needed). Installer doesn’t change any system settings or Java installation. Included JRE will be accessible only for DBeaver"
    Execute-Installer -tempInstallPath $tempInstallPath
}

$location = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-DBeaver $location