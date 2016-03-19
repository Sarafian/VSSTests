function Get-String {
    [CmdletBinding()]
    [OutputType([string])]
    Param (
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true
            
        )]
        [ValidateNotNullOrEmpty()]
        [string]$String
    )

    Begin {
    }

    Process {
        $String
    }

    End {
        
    }
}
