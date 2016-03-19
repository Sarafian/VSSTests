$originalVerbosePreference=$VerbosePreference
$VerbosePreference="Continue"
if($Env:Agent_Id)
{
    Write-Verbose "Visual Studio Services Agent detected. Importing Pester."
    $pesterModulePath=Resolve-Path "$PSScriptRoot\..\VSS\Modules\Pester\Pester.psm1"
    Write-Verbose "pesterModulePath=$pesterModulePath"
    $VerbosePreference=$originalVerbosePreference
    Import-Module $pesterModulePath 
}
