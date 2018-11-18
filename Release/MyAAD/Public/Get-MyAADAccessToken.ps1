<#
.SYNOPSIS
    Gets a graph access token
.DESCRIPTION
    Gets a graph access token with client credentials.
    You need to create a new app in azure AD and supply it [pscredential]$ClientCredential.
    Username = application id
    Password = Application key/client secret
.EXAMPLE
    PS C:\> Get-MyAADAccessToken -ClientCredential $Credential -TenantName contoso.onmicrosoft.com
    Explanation of what the example does
#>
Function Get-MyAADAccessToken {
    param(
        # application secrets. Username = application id, password = client secret
        [parameter(Mandatory)]
        [PSCredential]$ClientCredential,

        # Name of your tenant. ie contoso.onmicrosoft.com
        [parameter(Mandatory)]
        [string]$TenantName
    )
    Add-Type -AssemblyName System.Web
    # Decode securestring
    $SecureString = [System.Runtime.InteropServices.Marshal]::SecureStringToCoTaskMemUnicode($ClientCredential.password)
    $Password = [System.Runtime.InteropServices.Marshal]::PtrToStringUni($SecureString)
    [System.Runtime.InteropServices.Marshal]::ZeroFreeCoTaskMemUnicode($SecureString)
    

    $BodyList = @(
        "client_id=$([System.Web.HttpUtility]::UrlEncode($ClientCredential.UserName))"
        "scope=https%3A%2F%2Fgraph.microsoft.com%2F.default"
        "client_secret=$([System.Web.HttpUtility]::UrlEncode($Password))",
        "grant_type=client_credentials"
    )
    
    $Url = "https://login.microsoftonline.com/$TenantName/oauth2/v2.0/token"
    $PostSplat = @{
        ContentType = 'application/x-www-form-urlencoded'
        Method = 'POST'
        Body = ($BodyList -join '&')
        Uri = $Url
    }

    $Request = Invoke-RestMethod @PostSplat
    
    return $Request

}