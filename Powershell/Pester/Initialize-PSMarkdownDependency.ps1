# When ConvertTo-Markdown commandlet is not available
# Download and import
$VerbosePreference="SilentlyContinue"

if(-not (Get-Command ConvertTo-Markdown -ErrorAction SilentlyContinue)) {
    Write-Warning "ConvertTo-Markdown commandlet not found"

    Write-Verbose "Creating module structure in $targetPath"
    $modulesPath=Join-Path $env:TEMP "Modules"
    $psMarkdownDirectoryPath=Join-Path $modulesPath "PSMarkdown"
    if(-not (Test-Path $psMarkdownDirectoryPath))
    {
        New-Item $psMarkdownDirectoryPath -ItemType Directory
    }
    $wc = New-Object System.Net.WebClient

    $url='https://raw.githubusercontent.com/ishu3101/PSMarkdown/master/ConvertTo-Markdown.ps1'
    $ps1Path = Join-Path $psMarkdownDirectoryPath "ConvertTo-Markdown.ps1"
    Write-Verbose "Downloading $url to $ps1Path"
    $wc.DownloadFile($url, $ps1Path)

    $psm1Path=Join-Path $psMarkdownDirectoryPath "PSMarkdown.psm1"
    Write-Verbose "Writing $psm1Path"
    '. $PSScriptRoot\ConvertTo-Markdown.ps1' | Out-File $psm1Path

   
    Write-Verbose "Testing module"
    Get-Command -Module PSMarkdown
}

