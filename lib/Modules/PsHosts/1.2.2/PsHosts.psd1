#
# Module manifest for module 'HostEntry'
#
# Generated by: Richard Szalay
#
# Generated on: 2/11/2013
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'RichardSzalay.Hosts.Powershell.dll'

# Version number of this module.
ModuleVersion = '1.2.2'

# ID used to uniquely identify this module
GUID = '665f6cdf-d7c5-4b2b-8b0a-071d6ce7d16f'

# Author of this module
Author = 'Richard Szalay'

# Company or vendor of this module
CompanyName = ''

# Copyright statement for this module
Copyright = '(c) 2017 Richard Szalay. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Provides Cmdlets for manipulating the local hosts file'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
DotNetFrameworkVersion = '4.0'

# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = '4.0'

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @('PsHosts.format.ps1xml')

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('PsHosts.ParameterCompletion.psm1')

# Functions to export from this module
FunctionsToExport = @()

# Cmdlets to export from this module
CmdletsToExport = @("Add-HostEntry", "Get-HostEntry", "Set-HostEntry", "Disable-HostEntry", 
	"Enable-HostEntry", "Remove-HostEntry", "Test-HostEntry")

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module
AliasesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Networking', 'Development'

        # A URL to the license for this module.
        LicenseUri = 'https://raw.githubusercontent.com/richardszalay/pshosts/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/richardszalay/pshosts'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Fixed Set-HostEntry -Force (broken in 1.2.1)
* Hostname parameter completion now works correctly on Linux (#12)
* Added `-Loopback` and `-IPv6Loopback` parameters to Add/Set-HostEntry (#6)
* Added `IPAddress` and `IsLoopback` properties to HostEntry (#2)
'

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}