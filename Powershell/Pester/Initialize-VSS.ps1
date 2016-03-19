Write-Debug "Env:Agent_Id=$($Env:Agent_Id)"
$vssAgentDetected=$false
if($Env:Agent_Id)
{
    $vssAgentDetected=$True
    $pesterModulePath=Resolve-Path "$PSScriptRoot\..\VSS\Modules\Pester\Pester.psm1"
    Write-Debug "pesterModulePath=$pesterModulePath"
    Import-Module $pesterModulePath 
}

function Test-VSSAgent {
    $vssAgentDetected
}

