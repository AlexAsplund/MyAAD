<#
.SYNOPSIS
    Removes specific settings object froup group
.DESCRIPTION
    Removes specific settings object froup group
.EXAMPLE
    PS C:\> Remove-MyAADGroupSetting -Id $GroupId -SettingsId $SettingsIDGuid
    Removes specific setting from group
.EXAMPLE
    PS C:\> $GroupSettings = Get-MyAADGroupSetting -AccessToken $AccessToken -Id $GroupId
    PS C:\> Remove-MyAADGroupSetting -Id $GroupSettings.Id -SettingsId $GroupSettings.value[0].id
    Fetches group settings with Get-MyAADGroupSetting and removes it
#>
Function Remove-MyAADGroupSetting {
    [cmdletbinding()]
    param(
        # Group Id
        [parameter(Mandatory)]
        [string]$Id,

        # Settings Id
        [parameter(Mandatory)]
        [string]$SettingsId,

        #Graph Access Token
        [parameter(mandatory)]
        $AccessToken
    )
    Begin {
        $AuthHeader = @{
            Authorization = "Bearer $AccessToken"
        }    
    }
    Process {
        $Uri = "https://graph.microsoft.com/beta/groups/$Id/settings/$SettingsId"
        Write-Verbose $Uri
        Invoke-RestMethod -Uri $Uri -Headers $AuthHeader -Method Delete
    }
    End {

    }
    
}