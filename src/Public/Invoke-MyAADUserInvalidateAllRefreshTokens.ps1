<#
.SYNOPSIS
    Invalidates all refresh tokens for a user
.DESCRIPTION
    Invalidates all of the user's refresh tokens issued to applications (as well as session cookies in a user's browser), by resetting the refreshTokensValidFromDateTime user property to the current date-time.
    Typically, this operation is performed (by the user or an administrator) if the user has a lost or stolen device.
    This operation would prevent access to any of the organization's data accessed through applications on the device without the user first being required to sign in again.
    In fact, this operation would force the user to sign in again for all applications that they have previously consented to, independent of device.
.EXAMPLE
    PS C:\> Invoke-MyAADUserInvalidateAllRefreshTokens -Id username@contoso.com -AccessToken $AccessToken
    Revokes all refresh tokens for username@contoso.com
#>
Function Invoke-MyAADUserInvalidateAllRefreshTokens {
    param(
        # Can be either guid or UserPrincipalName
        [parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [string]$Id,

        # Graph Access Token
        [parameter(Mandatory)]
        [string]$AccessToken
    )

    Begin{
        $Header = @{
            Authorization = 'Bearer '+$AccessToken
        }
    }
    Process{
        Write-Verbose "Invalidation refresh tokens for user $Id"
        Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/beta/users/$Id/invalidateAllRefreshTokens" -Headers $Header
    }
    End {
        Write-Verbose 'Finished'
    }

}