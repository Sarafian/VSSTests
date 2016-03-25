function Test-DemoPesterDependency {
    Begin {
    }

    Process {
        $command=Get-Command Test-DemoPester -ErrorAction SilentlyContinue
        $command -ne $true
    }

    End {
        
    }
}
