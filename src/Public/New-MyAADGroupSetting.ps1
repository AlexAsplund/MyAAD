<#
.SYNOPSIS
    Sets new group setting on group from a template.
    Template should (must) be Group.Unified.Guest
.DESCRIPTION
    Sets new group setting on group from a template.
    Template should (must) be Group.Unified.Guest
.EXAMPLE
    PS C:\> $Settings = [PSCustomObject]@{
                name = 'AllowToAddGuests'
                value = $AllowToAddGuests
            }
    PS C:\> $Template = Get-RVAADDirectorySettingTemplates -AccessToken $AccessToken | ? {$_.DisplayName -eq 'Group.Unified.Guest'}
    PS C:\> New-RVAADGroupSetting -TemplateId $Template.id -Values $Settings -AccessToken $AccessToken -GroupId $Id
    
    Fetches template with Get-RVAADDirectorySettingTemplates and applies settings
#>
Function New-MyAADGroupSetting {
    param(
        # Id of the template that the group setting will be created with
        [parameter(Mandatory)]
        [string]$TemplateId,

        # Id of the group
        [parameter(Mandatory)]
        [string]$GroupId,

        # Values of settings in a [pscustomobject[]] format containing properties name,value
        [parameter(Mandatory)]
        [PSCustomObject[]]$Values,

        # Graph Access Token
        [parameter(Mandatory)]
        [string]$AccessToken
    )
    Begin{
        $AuthHeader = @{
            Authorization = "Bearer $AccessToken"
        }
    
        $Post = [PSCustomObject]@{
            templateId = $TemplateId
            values = $Values
        } 
    
        $PostJson = $Post | ConvertTo-Json
    }
    Process{

        Write-Verbose "Processing $GroupId"
        $url = "https://graph.microsoft.com/beta/groups/$GroupId/settings"
        try{
            Invoke-RestMethod -Uri $url -Headers $AuthHeader -Method Post -Body $PostJson -ContentType 'application/json'
        }
        catch{
            Write-Error "Error processing group $GroupId"
        }
    }
    End{

    }
}


