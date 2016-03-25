function Test-DemoPester {
    Param (
        [Parameter(
            Mandatory = $false
        )]
        [switch]$Throw=$false
    )
    Begin {
    }

    Process {
        if($Throw)
        {
            throw "Error"
        }
    }

    End {
        
    }
}
