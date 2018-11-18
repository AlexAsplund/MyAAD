<#
.SYNOPSIS
    Fetches all unified groups from your AAD tenant
.DESCRIPTION
    Fetches all unified groups from your AAD tenant
    Automatically fetches next page (@odata.nextLink)
.EXAMPLE
    PS C:\> Get-MyAADUnifiedGroups -AccessToken $AccessToken
    Fetches all unified groups from your AAD tenant
    Automatically fetches next page (@odata.nextLink)
#>
Function Get-MyAADUnifiedGroups {
    param(
        [parameter(Mandatory)]
        # Grap Access Token
        $AccessToken
    )
    $AuthHeader = @{
        Authorization = "Bearer $AccessToken"
    }
    $Response = Invoke-RestMethod -Uri "https://graph.microsoft.com/beta/groups/?`$filter=groupTypes/any(g:g eq 'Unified')" -Headers $AuthHeader
    $More = $Response.'@odata.nextLink' -ne $null
    
    $Response.Value
    While($More){
        $Response = Invoke-RestMethod -Uri $Response.'@odata.nextLink' -Headers $AuthHeader
        $Response.Value
        $More = $Response.'@odata.nextLink' -ne $null
    }
    
}