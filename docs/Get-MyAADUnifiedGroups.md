---
external help file: MyAAD-help.xml
Module Name: MyAAD
online version:
schema: 2.0.0
---

# Get-MyAADUnifiedGroups

## SYNOPSIS
Fetches all unified groups from your AAD tenant

## SYNTAX

```
Get-MyAADUnifiedGroups [-AccessToken] <Object> [<CommonParameters>]
```

## DESCRIPTION
Fetches all unified groups from your AAD tenant
Automatically fetches next page (@odata.nextLink)

## EXAMPLES

### EXAMPLE 1
```
Get-MyAADUnifiedGroups -AccessToken $AccessToken
```

Fetches all unified groups from your AAD tenant
Automatically fetches next page (@odata.nextLink)

## PARAMETERS

### -AccessToken
Grap Access Token

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
