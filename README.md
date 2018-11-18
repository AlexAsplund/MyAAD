# MyAAD Module
## Description

A pretty simple and straight forward Powershell Module for Microsoft Graph primarily created for managing groups and templates.

## Installation
Either copy the Release/MyAAD to a directory of your choice or see [install.](install.md)

  


## How to


### Create app in Azure AD

First of you need to register an application in Azure AD and create secrets for it: [instructions.](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-v1-add-azure-ad-app)


### Fetch access token

    # Enter Application ID as username and secret as password
    $Credential = Get-Credential

    # Get Access token
    $AccessTokenResponse = Get-MyAADAccessToken -ClientCredential $Credential -TenantName contoso.onmicrosoft.com
    $AccessToken = $AccessTokenResponse.access_token

### Perform commands

    # Fetch all unified groups
    Get-MyAADUnifiedGroups -AccessToken $AccessToken

## Functions

### [Get-MyAADAccessToken](./docs/Get-MyAADAccessToken.md)

#### Description:

Gets a graph access token

#### Example:

    PS C:\> Get-MyAADAccessToken -ClientCredential $Credential -TenantName contoso.onmicrosoft.com

### [Get-MyAADDirectorySetting](./docs/Get-MyAADDirectorySetting.md)

#### Description:

Fetches all settings from templates etc from you AAD 

#### Example:

    PS C:\> Get-MyAADDirectorySettings -AccessToken $AccessToken

### [Get-MyAADDirectorySettingTemplate](./docs/Get-MyAADDirectorySettingTemplate.md)

#### Description:

Fetches all AAD directory settings templates

#### Example:

    PS C:\> Get-MyAADDirectorySettingTemplates -AccessToken $AccessToken

### [Get-MyAADGroupSetting](./docs/Get-MyAADGroupSetting.md)

#### Description:

Fetches all settings applied for a specific group

#### Example:

    PS C:\> Get-MyAADGroupSetting

### [Get-MyAADUnifiedGroups](./docs/Get-MyAADUnifiedGroups.md)

#### Description:

Fetches all unified groups from your AAD tenant

#### Example:

    PS C:\> Get-MyAADUnifiedGroups -AccessToken $AccessToken

### [New-MyAADDirectorySetting](./docs/New-MyAADDirectorySetting.md)

#### Description:

Creates a new Directory Settings object

#### Example:

    PS C:\> $UnifiedGroupTemplate = Get-MyAADDirectorySettingTemplates -AccessToken $AccessToken | ? {$_.DisplayName -eq 'Group.Unified'}

### [New-MyAADGroupSetting](./docs/New-MyAADGroupSetting.md)

#### Description:

Sets new group setting on group from a template.

#### Example:

    PS C:\> $Settings = [PSCustomObject]@{

### [Remove-MyAADGroupSetting](./docs/Remove-MyAADGroupSetting.md)

#### Description:

Removes specific settings object froup group

#### Example:

    PS C:\> Remove-MyAADGroupSetting -Id $GroupId -SettingsId $SettingsIDGuid
    PS C:\> $GroupSettings = Get-MyAADGroupSetting -AccessToken $AccessToken -Id $GroupId

### [Set-MyAADGroupGuestAccess](./docs/Set-MyAADGroupGuestAccess.md)

#### Description:

Enables or disables guest access on specific group

#### Example:

    PS C:\> Set-MyAADGroupGuestAccess -AllowAddGuests $False -AccessToken $AccessToken
    PS C:\> Set-MyAADGroupGuestAccess -AllowAddGuests $True -AccessToken $AccessToken
    PS C:\> $Groups | Set-MyAADGroupGuestAccess -AllowAddGuests $False -AccessToken $AccessToken


