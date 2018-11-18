---
external help file: MyAAD-help.xml
Module Name: MyAAD
online version:
schema: 2.0.0
---

# Set-MyAADGroupGuestAccess

## SYNOPSIS
Enables or disables guest access on specific group

## SYNTAX

```
Set-MyAADGroupGuestAccess [-Id] <String> [-AllowToAddGuests] <String> [-AccessToken] <String>
 [<CommonParameters>]
```

## DESCRIPTION
Enables or disables guest access on specific group.
Automatically fetches templateId

## EXAMPLES

### EXAMPLE 1
```
Set-MyAADGroupGuestAccess -AllowAddGuests $False -AccessToken $AccessToken
```

Disables guest access on selected group

### EXAMPLE 2
```
Set-MyAADGroupGuestAccess -AllowAddGuests $True -AccessToken $AccessToken
```

Enables guest access on selected group

### EXAMPLE 3
```
$Groups | Set-MyAADGroupGuestAccess -AllowAddGuests $False -AccessToken $AccessToken
```

Disables guest access on groups piped from $Groups where $Groups.Id -eq GroupId

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
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AllowToAddGuests
Specifies if you want to add or remove quests

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
Graph Access token

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
