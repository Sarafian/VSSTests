# Powershell module scafold

This section is about figuring out

* how to structure a powershell repository. Everything under [PowerShell](Powershell) folder mimics a powershell module repository.
* how to use Pester for to test the module.
* how to create assets that work well locally but also from within Visual Studio Services build agents.
* how to publish a module.

# Current structure

## The Modules directory

Create all modules withing the `Modules` directory as powershell pipeline expects them. You don't have to worry about the `.psm1` location. Every module must have a matching Pester test script.
* Basic is a simple module with one commandlet `Get-String`. [Get-String.Tests.ps1](Modules/Basic/Get-String.Tests.ps1) is intenioally failing on one test.

## The ISEScripts directory
Create all scripts for `PowerShellISE` in [ISEScripts](ISEScripts)
* [Add-ModuleToPSModulePath.ps1](ISEScripts/Add-ModuleToPSModulePath.ps1). Add this to your `Microsoft.PowerShellISE_profile.ps1`

## The VSS directory
Within [VSS](VSS) there is the original source code of Pester. The reason is that at this point VSS uses powershell version 5 and Pester is not included.
* [Initialize-VSS.ps1](VSS/Initialize-VSS.ps1) provides some basic functionality to detect if a script is executing at VSS
* [QueryEnvironment.ps1](VSS/QueryEnvironment.ps1) output some information in the console to help out with understanding what is going on

## The Pester directory
Within [Pester](Pester) folder we have a script per module. 
* [Test-Basic.ps1](Pester/Test-Basic.ps1) tests the Basic module. The script utilizes the functionality provided in [Initialize-VSS.ps1](VSS/Initialize-VSS.ps1) to work both locally and in VSS.
* [Test-All.ps1](Pester/Test-All.ps1) runs all other module specific test files.

## The Scripts directory
Within [Scripts](Scripts) folder we have a collection for scripts. 

# Online resources

* [PowerShell - Continuous Integration in Visual Studio Team Services](https://vnextengineer.azurewebsites.net/powershell-continuous-integration/) is an excellent read to understand how to setup a build in VSS. 
* [Pester](https://github.com/pester/Pester) on github
