& "$PSScriptRoot\Initialize-VSS.ps1"

$testPath=Resolve-Path "$PSScriptRoot\..\Modules\Basic\"
Invoke-Pester -Script "$testPath*"