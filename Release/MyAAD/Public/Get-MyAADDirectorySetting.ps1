<#
.SYNOPSIS
    Fetches all settings from templates etc from you AAD 
.EXAMPLE
    PS C:\> Get-MyAADDirectorySettings -AccessToken $AccessToken
    Fetches all settings from templates etc from you AAD 
#>
Function Get-MyAADDirectorySetting {
    param(
        # Graph Access Token
        [parameter(mandatory)]
        [string]$AccessToken = $AccessToken
    )
    $AuthHeader = @{
        Authorization = "Bearer $AccessToken"
    }
    
    
    return (Invoke-RestMethod -Uri "https://graph.microsoft.com/beta/settings" -Headers $AuthHeader).Value
}

