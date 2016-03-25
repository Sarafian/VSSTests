# When ConvertTo-Markdown commandlet is not available
# Download and import
$VerbosePreference="Continue"

if(-not (Get-Command ConvertTo-Markdown -ErrorAction SilentlyContinue)) {
    Write-Warning "ConvertTo-Markdown commandlet not found"
    <#region 1
    $psModulePaths=$env:PSModulePath -split ';'
    $targetPath=$psModulePaths[$psModulePaths.Length-1]
    Write-Verbose "Creating module structure in $targetPath"

    $modulePath=Join-Path $targetPath "PSMarkdown"
    if(-not (Test-Path $modulePath))
    {
        New-Item $modulePath -ItemType Directory
    }
    $wc = New-Object System.Net.WebClient

    $url='https://raw.githubusercontent.com/ishu3101/PSMarkdown/master/ConvertTo-Markdown.ps1'
    $ps1Path = Join-Path $modulePath "ConvertTo-Markdown.ps1"
    Write-Verbose "Downloading $url to $ps1Path"
    $wc.DownloadFile($url, $ps1Path)

    $psm1Path=Join-Path $modulePath "PSMarkdown.psm1"
    Write-Verbose "Writing $psm1Path"
    ". $PSScriptRoot\ConvertTo-Markdown.ps1" | Out-File $psm1Path

    Get-ChildItem $targetPath -Recurse
    #endregion
    #>
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

    $items=Get-ChildItem $modulesPath -Recurse -File
    Write-Verbose "Content in $modulesPath"
    $items |ForEach-Object { 
        Write-Verbose $_.FullName
        $content=Get-Content $_.FullName
        Write-Verbose $content
    }
    
    $env:PSModulePath+=';'+$modulesPath
    Write-Verbose "PSModulePath is"
    ($env:PSModulePath -split ';')|ForEach-Object { Write-Verbose $_}
    Write-Verbose "Importing module"
    Import-Module PSMarkdown -Verbose -Debug
    (Get-Module PSMarkdown).Path
}

