<#
.SYNOPSIS
    Fetches all security alerts with the graph API
.EXAMPLE
    PS C:\> Get-MyAADSecurityAlerts
    Fetches all security alerts
#>
Function Get-MyAADSecurityAlerts {
    param(
        # Graph Access Token
        [parameter(Mandatory)]
        [string]$AccessToken
    )

    
    $Header = @{
        Authorization = 'Bearer '+$AccessToken
    }

    $Request = Invoke-RestMethod -Uri 'https://graph.microsoft.com/beta/security/alerts' -Headers $Header
    $More = $Request.'@odata.context' -ne $null

    $Request.Value
    if($More){
        $Request = Invoke-RestMethod -Uri $Request.'@odata.context' -Headers $Header
        $Request.Value
        $More = $Request.'@odata.context' -ne $null
    }
}