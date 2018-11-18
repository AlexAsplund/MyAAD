# Update-MyAADSecurityAlert

## SYNOPSIS
Updates a security alert

## SYNTAX

```
Update-MyAADSecurityAlert [-Id] <String> [[-AssignedTo] <String>] [[-ClosedDateTime] <DateTime>]
 [[-Comments] <String[]>] [[-Feedback] <String>] [[-Status] <String>] [[-Tags] <String[]>]
 [-AccessToken] <Object> [<CommonParameters>]
```

## DESCRIPTION
Updates a security alert, takes pipeline input on Id parameter

## EXAMPLES

### EXAMPLE 1
```
Update-MyAADSecurityAlert -AccessToken $AccessToken -Id $AlertId -AssignedTo Someone
```

### EXAMPLE 2
```
$FilteredAlerts | Update-MyAADSecurityAlert -AccessToken $AccessToken -Id $AlertId -AssignedTo Someone
```

## PARAMETERS

### -Id
Id of Alert

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

### -AssignedTo
Name of the analyst the alert is assigned to for triage, investigation, or remediation.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClosedDateTime
Time at which the alert was closed.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Comments
Analyst comments on the alert (for customer alert management).

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Feedback
Analyst feedback on the alert.
Possible values are: unknown, truePositive, falsePositive, benignPositive.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Alert lifecycle status (stage).
Possible values are: unknown, newAlert, inProgress, resolved

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
User-definable labels that can be applied to an alert and can serve as filter conditions (for example, "HVA", "SAW)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AccessToken
Graph access token

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 8
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
