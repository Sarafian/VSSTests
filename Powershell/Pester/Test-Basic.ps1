. "$PSScriptRoot\Initialize-VSS.ps1"

$testPath=Resolve-Path "$PSScriptRoot\..\Modules\Basic\"
if(Test-VSSAgent)
{
    $sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".").Replace(".ps1", "")
    Invoke-Pester -CodeCoverage *.ps1 -Path "$testPath" -OutputFormat NUnitXml -OutputFile "$PSScriptRoot\$sut.xml"
}
else
{
    Invoke-Pester -CodeCoverage *.ps1 -Path "$testPath"
}