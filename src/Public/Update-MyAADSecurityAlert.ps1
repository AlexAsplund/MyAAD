<#
.SYNOPSIS
    Updates a security alert
.DESCRIPTION
    Updates a security alert, takes pipeline input on Id parameter
.EXAMPLE
    PS C:\> Update-MyAADSecurityAlert -AccessToken $AccessToken -Id $AlertId -AssignedTo Someone
.EXAMPLE
    PS C:\> $FilteredAlerts | Update-MyAADSecurityAlert -AccessToken $AccessToken -Id $AlertId -AssignedTo Someone
#>
Function Update-MyAADSecurityAlert {
    [cmdletbinding()]
    param(
        #Id of Alert
        [parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [string]$Id,
        
        # Name of the analyst the alert is assigned to for triage, investigation, or remediation.
        [string]$AssignedTo,
        
        # Time at which the alert was closed.
        [datetime]$ClosedDateTime,
        
        # Analyst comments on the alert (for customer alert management).
        [string[]]$Comments,

        # Analyst feedback on the alert. Possible values are: unknown, truePositive, falsePositive, benignPositive.
        [validateset('unknown', 'truePositive','falsePositive','benignPositive')]
        [string]$Feedback,

        # Alert lifecycle status (stage). Possible values are: unknown, newAlert, inProgress, resolved
        [validateset('unknown', 'newAlert', 'inProgress', 'resolved')]
        [string]$Status,

        # User-definable labels that can be applied to an alert and can serve as filter conditions (for example, "HVA", "SAW)
        [string[]]$Tags,

        # Graph access token
        [parameter(Mandatory)]
        $AccessToken
    )


    Begin{
        $Header = @{
            Authorization = 'Bearer '+$AccessToken
        }
    }
    Process{
        
        $Object = [PSCustomObject]@{}
        $PSBoundParameters.Keys | ? {$_ -in @('tags','status','feedback','comments','closeddatetime','assignedTo')} | foreach {
        
            [string]$Name = $_
            $Name = $Name.substring(0,1).ToLower()+$Name.Substring(1)
            $Value = $PSBoundParameters[$_]

            if($_ -eq 'ClosedDateTime'){

                $Value = Get-Date $ClosedDateTime -Format 'o'
            
            }
            
            $Object | Add-Member -MemberType NoteProperty -Name $Name -Value $Value
        }
        $Uri = "https://graph.microsoft.com/beta/security/alerts/$Id"
        Write-verbose $Uri
        Invoke-WebRequest -Method Patch -Uri $Uri -Headers $Header -Body ($Object | ConvertTo-Json) -ContentType 'application/json'
        Write-Verbose ($Object | ConvertTo-Json)
    }
    End{

    }
}
