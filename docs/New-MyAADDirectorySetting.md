---
external help file: MyAAD-help.xml
Module Name: MyAAD
online version:
schema: 2.0.0
---

# New-MyAADDirectorySetting

## SYNOPSIS
Creates a new Directory Settings object

## SYNTAX

```
New-MyAADDirectorySetting [-TemplateId] <String> [-Values] <PSObject[]> [-AccessToken] <String>
 [<CommonParameters>]
```

## DESCRIPTION
Creates a new Directory Settings object.
Be careful to not set dual settings from the same template id

## EXAMPLES

### EXAMPLE 1
```
$UnifiedGroupTemplate = Get-MyAADDirectorySettingTemplates -AccessToken $AccessToken | ? {$_.DisplayName -eq 'Group.Unified'}
```

PS C:\\\> $ValueList = $UnifiedGroupTemplate.values | select name,@{Name='value';Expression={$_.defaultValue}}
PS C:\\\> New-MyAADDirectorySetting -TemplateId $UnifiedGroupTemplate.id -Values $ValueList -AccessToken $AccessToken

Creates a new directorysetting object on tenant

## PARAMETERS

### -TemplateId
Id of template

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

### -Values
list of customobjects with name,value properties

```yaml
Type: PSObject[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AccessToken
Grap Access Token

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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
