﻿function Set-UserProxy { 
	<# 
		.Synopsis 
            Set Proxy 
		.DESCRIPTION 

		.NOTES 
		   Created by: Mathieu ALLEGRET
		   Modified: 01/06/2016
		 
		   Changelog: 
			* Creation Initial 01/06/2016
            
		   To Do: 
			* 

		.PARAMETER ProxyServer
		   Le nom ou l'adresse IP du serveur Proxy
            
		.PARAMETER ProxyPort
		   Le port du proxy, par défaut 80
           
		.PARAMETER AutoConfig
            L'URL de configuration automatique du proxy

		.PARAMETER ByPassList
            Liste des adresses à bypasser

        .PARAMETER Local
            Bypasser les adresses locales, Par defaut a TRUE
    
		.EXAMPLE 
            Set-UserProxy -server myproxysrv.local -port 8080 -bypass "172.20.*;192.168.10.*"
        
		.EXAMPLE 
            Set-UserProxy -server myproxysrv.local -port 8080 -bypass "172.20.*;192.168.10.*" -local:$false
        
		.EXAMPLE 
            Set-UserProxy -url http://myproxysrv.local/

	#>

    [CmdletBinding(SupportsShouldProcess)] 
    Param 
    ( 
        [Parameter()] 
        [ValidateNotNullOrEmpty()] 
        [Alias("server")] 
        [string]$ProxyServer, 
 
        [Parameter()] 
        [Alias('port')] 
        [string]$ProxyPort = 80, 
        
        [Parameter()] 
        [Alias('url')] 
        [string]$AutoConfig,
                  
        [Parameter()] 
        [Alias('bypass')] 
        [string]$ByPassList,
        
        [Parameter()] 
        [switch]$NotLocal
    ) 
 
    Begin { 

		if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }

        $regKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"

    } 
    
    Process { 
        
        if ($ProxyServer -and -not $AutoConfig) {
            $proxyServerToDefine = "${ProxyServer}:${ProxyPort}"
			if ($pscmdlet.shouldprocess("Are you sure?")) {
			Write-Verbose "PROXY CONFIG : setting $proxyServerToDefine"
				Set-ItemProperty -path $regKey ProxyEnable -value 1
				Set-ItemProperty -path $regKey ProxyServer -value $proxyServerToDefine
				if ($ByPassList) {
					if (!$NotLocal) {
						$ByPassList += ";<local>"
					}
					Set-ItemProperty -path $regKey ProxyOverride -value $ByPassList
				}
			}
            Write-Verbose "PROXY CONFIG : enabled"
        }
        elseif ($AutoConfig -and -not $ProxyServer) {
			if ($pscmdlet.shouldprocess("Are you sure?")) {
				Write-Verbose "PROXY CONFIG : setting AutoConfig $AutoConfig"
				Set-ItemProperty -path $regKey AutoConfigURL -value $AutoConfig
				Set-ItemProperty -path $regKey ProxyEnable -value 0
				Write-Verbose "PROXY CONFIG : enabled"
			}
        }
        else {
            Write-Verbose "PROXY CONFIG : bad parameters"
        }
        
    } 
    
    End {} 
    
}
