$VerbosePreference="Continue"

Write-Verbose "PSVersionTable"
$PSVersionTable

Write-Verbose "PSModulePath"
$env:PSModulePath -split ';'

Write-Verbose "env:USERNAME=$($env:USERNAME)"

$os=Get-WmiObject Win32_OperatingSystem
Write-Verbose "$($os.Name) ($($os.OSArchitecture))"
