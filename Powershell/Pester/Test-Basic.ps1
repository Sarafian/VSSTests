$testPath=Resolve-Path "$PSScriptRoot\..\Modules\Basic\"
Invoke-Pester -Script "$testPath*"