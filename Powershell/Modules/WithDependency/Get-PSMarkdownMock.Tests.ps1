$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Get-PSMarkdownMock" {
    Context "Mock context" {
        Mock ConvertTo-Markdown { 
         Begin {
            }

            Process {
            }

            End {
                "Mocked"    
            }
        } 
        
        It "Depends on ConvertTo-Markdown" {
            {Get-PSMarkdownMock} | Should Not Throw
        }
    }
}
