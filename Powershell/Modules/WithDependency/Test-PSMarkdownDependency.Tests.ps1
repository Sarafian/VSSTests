$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Test-PSMarkdownDependency" {
    It "Depends on ConvertTo-Markdown" {
        Test-PSMarkdownDependency | Should Be $true
    }
}
