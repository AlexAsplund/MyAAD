<#
.SYNOPSIS
    Fetches all AAD directory settings templates
.EXAMPLE
    PS C:\> Get-MyAADDirectorySettingTemplates -AccessToken $AccessToken
    Explanation of what the example does
#>
Function Get-MyAADDirectorySettingTemplate {
    param(
        # Grap Access Token
        [parameter(mandatory)]
        [string]$AccessToken = $AccessToken
    )
    $AuthHeader = @{
        Authorization = "Bearer $AccessToken"
    }
    
    
    return (Invoke-RestMethod -Uri "https://graph.microsoft.com/beta/directorySettingTemplates/" -Headers $AuthHeader).Value
}

