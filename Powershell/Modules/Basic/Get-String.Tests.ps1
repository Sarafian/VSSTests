$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "Get-String" {
    It "-String null or empty" {
        {Get-String -String $null } | Should Throw "The argument is null or empty."
        {Get-String -String "" } | Should Throw "The argument is null or empty."
    }
    It "-String Any" {
        Get-String -String "Test" | Should Be "Test"
    }
    It "Intenional fail" {
        Get-String -String "Fail" | Should Be "Success"
    }
}
