---
external help file: MyAAD-help.xml
Module Name: MyAAD
online version:
schema: 2.0.0
---

# New-MyAADGroupSetting

## SYNOPSIS
Sets new group setting on group from a template.
Template should (must) be Group.Unified.Guest

## SYNTAX

```
New-MyAADGroupSetting [-TemplateId] <String> [-GroupId] <String> [-Values] <PSObject[]> [-AccessToken] <String>
 [<CommonParameters>]
```

## DESCRIPTION
Sets new group setting on group from a template.
Template should (must) be Group.Unified.Guest

## EXAMPLES

### EXAMPLE 1
```
$Settings = [PSCustomObject]@{
```

name = 'AllowToAddGuests'
            value = $AllowToAddGuests
        }
PS C:\\\> $Template = Get-RVAADDirectorySettingTemplates -AccessToken $AccessToken | ?
{$_.DisplayName -eq 'Group.Unified.Guest'}
PS C:\\\> New-RVAADGroupSetting -TemplateId $Template.id -Values $Settings -AccessToken $AccessToken -GroupId $Id

Fetches template with Get-RVAADDirectorySettingTemplates and applies settings

## PARAMETERS

### -TemplateId
Id of the template that the group setting will be created with

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupId
Id of the group

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Values
Values of settings in a \[pscustomobject\[\]\] format containing properties name,value

```yaml
Type: PSObject[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AccessToken
Graph Access Token

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
