---
external help file: MyAAD-help.xml
Module Name: MyAAD
online version:
schema: 2.0.0
---

# Remove-MyAADGroupSetting

## SYNOPSIS
Removes specific settings object froup group

## SYNTAX

```
Remove-MyAADGroupSetting [-Id] <String> [-SettingsId] <String> [-AccessToken] <Object> [<CommonParameters>]
```

## DESCRIPTION
Removes specific settings object froup group

## EXAMPLES

### EXAMPLE 1
```
Remove-MyAADGroupSetting -Id $GroupId -SettingsId $SettingsIDGuid
```

Removes specific setting from group

### EXAMPLE 2
```
$GroupSettings = Get-MyAADGroupSetting -AccessToken $AccessToken -Id $GroupId
```

PS C:\\\> Remove-MyAADGroupSetting -Id $GroupSettings.Id -SettingsId $GroupSettings.value\[0\].id
Fetches group settings with Get-MyAADGroupSetting and removes it

## PARAMETERS

### -Id
Group Id

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

### -SettingsId
Settings Id

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

### -AccessToken
Graph Access Token

```yaml
Type: Object
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
