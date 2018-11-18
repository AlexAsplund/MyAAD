---
external help file: MyAAD-help.xml
Module Name: MyAAD
online version:
schema: 2.0.0
---

# Get-MyAADAccessToken

## SYNOPSIS
Gets a graph access token

## SYNTAX

```
Get-MyAADAccessToken [-ClientCredential] <PSCredential> [-TenantName] <String> [<CommonParameters>]
```

## DESCRIPTION
Gets a graph access token with client credentials.
You need to create a new app in azure AD and supply it \[pscredential\]$ClientCredential.
Username = application id
Password = Application key/client secret

## EXAMPLES

### EXAMPLE 1
```
Get-MyAADAccessToken -ClientCredential $Credential -TenantName contoso.onmicrosoft.com
```

Explanation of what the example does

## PARAMETERS

### -ClientCredential
application secrets.
Username = application id, password = client secret

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TenantName
Name of your tenant.
ie contoso.onmicrosoft.com

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
