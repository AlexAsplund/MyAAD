<#
.SYNOPSIS
    Enables or disables guest access on specific group
.DESCRIPTION
    Enables or disables guest access on specific group.
    Automatically fetches templateId
.EXAMPLE
    PS C:\> Set-MyAADGroupGuestAccess -AllowAddGuests $False -AccessToken $AccessToken
    Disables guest access on selected group
.EXAMPLE
    PS C:\> Set-MyAADGroupGuestAccess -AllowAddGuests $True -AccessToken $AccessToken
    Enables guest access on selected group
.EXAMPLE
    PS C:\> $Groups | Set-MyAADGroupGuestAccess -AllowAddGuests $False -AccessToken $AccessToken
    Disables guest access on groups piped from $Groups where $Groups.Id -eq GroupId
#>
Function Set-MyAADGroupGuestAccess {
    [cmdletbinding()]
    param(
        # Group Id
        [parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [string]$Id,
        
        # Specifies if you want to add or remove quests
        [parameter(Mandatory)]
        [validateset('false','true')]
        [string]$AllowToAddGuests,

        # Graph Access token
        [parameter(Mandatory)]
        [string]$AccessToken 
    )
    Begin{
        $Settings = [PSCustomObject]@{
            name = 'AllowToAddGuests'
            value = $AllowToAddGuests
        
        }
    }
    Process{
        $Template = Get-RVAADDirectorySettingTemplate -AccessToken $AccessToken | ? {$_.DisplayName -eq 'Group.Unified.Guest'}
        New-RVAADGroupSetting -TemplateId $Template.id -Values $Settings -AccessToken $AccessToken -GroupId $Id
    }
    End{

    }
}
