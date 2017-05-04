<#PSScriptInfo
.GUID
	40720694-c287-44b9-ad06-6243966cb31e
.VERSION 
	1.0.0.0
.AUTHOR 
	Michael Haken
.COMPANYNAME 
	BAMCIS
.COPYRIGHT 
	(c) 2017 BAMCIS. All rights reserved.
.TAGS 
	Edge Browser Reset
.LICENSEURI
	https://raw.githubusercontent.com/bamcisnetworks/ResetEdge/master/LICENSE
.PROJECTURI
	https://github.com/bamcisnetworks/ResetEdge
.ICONURI 
.EXTERNALMODULEDEPENDENCIES 
.REQUIREDSCRIPTS 
.EXTERNALSCRIPTDEPENDENCIES 
.RELEASENOTES
	Initial release.
#>

<#
	.SYNOPSIS
		Resets the Microsoft Edge browser.

	.DESCRIPTION
		Resets the Microsoft Edge browser.

    .EXAMPLE
		Reset-Edge.ps1

		Resets Microsoft edge on the local computer.

	.INPUTS
		None

	.OUTPUTS
		None

	.NOTES
		AUTHOR: Michael Haken
		LAST UPDATE: 4/4/2017
#>
Param()

Remove-Item -Path $env:LOCALAPPDATA\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe -Force -Recurse -ErrorAction Stop

Get-AppXPackage -Name Microsoft.MicrosoftEdge -Verbose | ForEach-Object {
	Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml" -Verbose
} 