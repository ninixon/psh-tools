function Get-PSWSUSDownstreamServer {
    <#  
    .SYNOPSIS  
        Retrieves all WSUS downstream servers.
    .DESCRIPTION
        Retrieves all WSUS downstream servers.
    .NOTES  
        Name: Get-PSWSUSDownstreamServer
        Author: Boe Prox
        DateCreated: 24SEPT2010 
               
    .LINK  
        https://learn-powershell.net
    .EXAMPLE  
    Get-PSWSUSDownstreamServer

    Description
    ----------- 
    This command will display a list of all of the downstream WSUS servers.
           
    #> 
    [cmdletbinding()]  
    Param () 
    Process {
        #Gather all child servers in WSUS    
        $wsus.GetDownstreamServers()
    }
}
