$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "Get-DemoPester" {
    It "-Throw not defined" {
        Test-DemoPester | Should Not Throw "Error"
    }
    It "-Throw defined" {
        {Test-DemoPester -Throw} | Should Throw "Error"
    }
}
