function Get-PSMarkdownMock {
    Begin {
    }

    Process {
        Get-Process | ConvertTo-Markdown
    }

    End {
        
    }
}
