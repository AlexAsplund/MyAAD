<#
.SYNOPSIS
    Creates a new Directory Settings object
.DESCRIPTION
    Creates a new Directory Settings object.
    Be careful to not set dual settings from the same template id
.EXAMPLE
    PS C:\> $UnifiedGroupTemplate = Get-MyAADDirectorySettingTemplates -AccessToken $AccessToken | ? {$_.DisplayName -eq 'Group.Unified'}
    PS C:\> $ValueList = $UnifiedGroupTemplate.values | select name,@{Name='value';Expression={$_.defaultValue}}
    PS C:\> New-MyAADDirectorySetting -TemplateId $UnifiedGroupTemplate.id -Values $ValueList -AccessToken $AccessToken

    Creates a new directorysetting object on tenant
#>
Function New-MyAADDirectorySetting {
    param(
        # Id of template
        [parameter(Mandatory)]
        [string]$TemplateId,

        # list of customobjects with name,value properties
        [parameter(Mandatory)]
        [PSCustomObject[]]$Values,

        # Grap Access Token
        [parameter(Mandatory)]
        [string]$AccessToken
    )
    $AuthHeader = @{
        Authorization = "Bearer $AccessToken"
    }

    $Post = [PSCustomObject]@{
        templateId = $TemplateId
        values = $Values
    } 

    $PostJson = $Post | ConvertTo-Json
    $PostJson 
    $url = "https://graph.microsoft.com/beta/groups/settings"
    Invoke-RestMethod -Uri $url -Headers $AuthHeader -Method Post -Body $PostJson -ContentType 'application/json'
}


