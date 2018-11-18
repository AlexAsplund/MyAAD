<#
.SYNOPSIS
    Fetches all settings applied for a specific group
.DESCRIPTION
    Fetches all settings applied for a specific group.
    
.EXAMPLE
    PS C:\> Get-MyAADGroupSetting
    Explanation of what the example does
#>
Function Get-MyAADGroupSetting {
    [cmdletbinding()]
    param(
        # Groups object id
        [parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [string]$Id,
        
        # Grap Access Token
        [parameter(Mandatory)]
        [string]$AccessToken
        
    )
    Begin{
           
        $AuthHeader = @{
            Authorization = "Bearer $AccessToken"
        }
    }
    Process{

        Write-Verbose "Processing $ID"
        $Value = (Invoke-RestMethod -Uri "https://graph.microsoft.com/beta/groups/$Id/settings/" -Headers $AuthHeader).Value
        [PSCustomObject]@{
            Id = $Id
            Value = $Value
        }

    }
    End{

    }
    
}