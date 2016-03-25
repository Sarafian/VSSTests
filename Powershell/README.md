# Powershell module scafold

This section is about figuring out

* how to structure a powershell repository. Everything under [PowerShell](PowerShell) folder mimics a powershell module repository.
* how to use Pester for to test the module.
* how to create assets that work well locally but also from within Visual Studio Services build agents.
* how to publish a module.

# Current structure

## The Modules directory

Create all modules withing the `Modules` directory as powershell pipeline expects them. You don't have to worry about the `.psm1` location. Every module must have a matching Pester test script.

* `DemoPester` is a simple module to demonstrate Pester error checking.
* `WithDependency` is a simple module to demonstrate dependencies to other modules that are not available when executing from Pester.
 * `Test-DemoPesterDependency` depends on the DemoPester module.
 * `Test-PSMarkdownDependency` depends on the [PSMarkdown](https://www.powershellgallery.com/packages/PSMarkdown) module.


## The ISEScripts directory
Create all scripts for `PowerShellISE` in [ISEScripts](ISEScripts)
* [Add-ModuleToPSModulePath.ps1](ISEScripts/Add-ModuleToPSModulePath.ps1). Add this to your `Microsoft.PowerShellISE_profile.ps1`
* [Reset-Module.ps1](ISEScripts/Reset-Module.ps1). Execute this from any script. 
 * When executing from `ISE` it will reload the modules. This will allow you to work trasnparently with the latest saved files.
 * When not executing from `ISE` it will append the `Modules` directory to the `$env:PSModulePath`. This will allow your script to utilize the modules. 

## The VSS directory
Within [VSS](VSS) there is the original source code of Pester. The reason is that at this point VSS uses powershell version 5 and Pester is not included.
* [QueryEnvironment.ps1](VSS/QueryEnvironment.ps1) output some information in the console to help out with understanding what is going on

## The Pester directory
Within [Pester](Pester) folder we have a script to test all modules.
```powershell
$modulesToTest=@(
    "Basic"
    "DemoPester"
)
```

* [Test-All.ps1](Pester/Test-All.ps1) runs all module tests.

## The Scripts directory
Within `Scripts` folder we have a collection for scripts. The [Test-Showcase.ps1](Scripts/Test-Showcase.ps1) shows how to use the [Reset-Module.ps1](ISEScripts/Reset-Module.ps1).

## The Publish directory
Within `Publish` folder we see the following files
* [nuget.exe](Publish/nuget.exe)
* [PreparePSD1AndNuSpec.ps1](Publish/PreparePSD1AndNuSpec.ps1). For each module the following files are created
 * Manifest `.psd1` file.
 * Nuspec `.nuspec` file

These files are ignored from `.gitignore`.
* [PublishNuGet.ps1](Publish/PublishNuGet.ps1). This will create the nuget package file `.nupkg`. Then it will publish this to the `NuGetUri` using an optional `APiKey`.

## The Debug directory
Within `Debug` folder we have a collection for scripts. This seems unnecessary since the Pester scripts are excellent for debugging.


# Online resources

* [PowerShell - Continuous Integration in Visual Studio Team Services](https://vnextengineer.azurewebsites.net/powershell-continuous-integration/) is an excellent read to understand how to setup a build in VSS. 
* [Pester](https://github.com/pester/Pester) on github
