# reset_user_password.ps1

param (
    [Parameter(Mandatory = $true)]
    [string]$UserName,

    [Parameter(Mandatory = $true)]
    [SecureString]$NewPassword
)

Import-Module ActiveDirectory

try {
    Set-ADAccountPassword -Identity $Username `
                          -NewPassword (ConvertTo-SecureString -AsPlainText $NewPassword -Force) `
                          -Reset
    Write-Host "Password has been reset successfully." -ForegroundColor Green
} catch {
    Write-Error "Failed to reset password: $_"
}