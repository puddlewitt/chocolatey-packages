function Build-Url {
	params (
		$version
	)

	$baseUrl = [string]::Format('http://dbeaver.jkiss.org/files/{0}/', $version)
	$binPart = ''

	if([Environment]::Is64BitProcess) {
		 $binPart = [string]::Format('dbeaver-ee-{0}-x86-setup.exe', $version)
	}
	else {
		 $binPart = [string]::Format('dbeaver-ee-{0}-x86_64-setup.exe', $version)
	}

	return [string]::Format('{0}{1}', $baseUrl, $binPart) 
}

function Remove-Existing {
}

function Install-Exec {
    Remove-Existing
	$url = Build-Url
}

Install-Exec