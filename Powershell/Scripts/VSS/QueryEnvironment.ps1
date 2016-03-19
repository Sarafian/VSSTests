$VerbosePreference="Continue"

Write-Verbose "PSVersionTable"
$PSVersionTable

Write-Verbose "PSModulePath"
$env:PSModulePath -split ';'

Write-Verbose "env:USERNAME=$($env:USERNAME)"

$os=Get-WmiObject Win32_OperatingSystem
Write-Verbose "$($os.Name) ($($os.OSArchitecture))"

Write-Verbose "$($os.Name) ($($os.OSArchitecture))"

Write-Verbose "Env:system.debug=$($Env:system.debug)"
Write-Verbose "Env:system_debug=$($Env:system_debug)"
Write-Verbose "system.debug=$system.debug"
Write-Verbose "system_debug=$system_debug"

