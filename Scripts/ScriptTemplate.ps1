#requires -version 2
<#
    .SYNOPSIS
        <Overview of script>
        
    .DESCRIPTION
        <Brief description of script>
    
    .PARAMETER <Parameter_Name>
        <Brief description of parameter input required. Repeat this attribute if required>
        
    .INPUTS
        <Inputs if any, otherwise state None>
        
    .OUTPUTS
        <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>
        
    .NOTES
        Version: 1.0
        Author: <Name>
        Creation Date: <Date>
        Purpose/Change: Initial script development

    .EXAMPLE
        <Example goes here. Repeat this attribute for more than one example>
#>

#---------------------------------------------------------[Parameters]--------------------------------------------------------
<#
[CmdletBinding()] 
param (
    [string]$Param1,
    [int]$Param2
)
#>
#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
#$ErrorActionPreference = "SilentlyContinue"

#Get Script Directory/Name
$fullPathIncFileName = $MyInvocation.MyCommand.Definition
$ScriptName = (Get-Item $fullPathIncFileName).BaseName
$ScriptDir = (Get-Item $fullPathIncFileName).Directory

#Dot Source required Function Libraries
Import-Module $ScriptDir\..\lib\Modules\PSLogging


#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Script Version
$sScriptVersion = "1.0"

#Log File Info
$DateDuLog = Get-Date -f "yyyyMMdd_HHmmss"
$sLogPath = Join-Path $ScriptDir\.. "log"
$sLogName = "${ScriptName}_$DateDuLog.log"
$sLogFile = Join-Path -Path $sLogPath -ChildPath $sLogName


#-----------------------------------------------------------[Functions]------------------------------------------------------------


#-----------------------------------------------------------[Execution]------------------------------------------------------------

Start-Log -LogPath $sLogPath -LogName $sLogName -ScriptVersion $sScriptVersion

#Script Execution goes here
Write-LogInfo -LogPath $sLogFile -Message "" -TimeStamp -ToScreen

Stop-Log -LogPath $sLogFile
