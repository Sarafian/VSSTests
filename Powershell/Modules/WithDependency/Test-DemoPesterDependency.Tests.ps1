$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Test-DemoPesterDependency" {
    It "Depends on Test-DemoPester" {
        Test-DemoPesterDependency | Should Be $true
    }
}
