
# Grab all Tenant Admins and store in a variable
$Exceptions = Get-RoleGroupMember -Identity "TenantAdmins*"
# Creat New Security Group
New-UnifiedGroup -DisplayName "Remote Powershell Users" -Alias remotepwsh -AccessType Private 
# Add all Tenant Admins to the new group
$Exceptions | % {Add-UnifiedGroupLinks -Identity "Remote Powershell Users" -LinkType Members -Links $_.alias} 
# Get all members of the newly created group and store in a variable
$Members = Get-UnifiedGroupLinks -LinkType Members -Identity "Remote Powershell Users" | Select -ExpandProperty DistinguishedName
# Get all O365 users in the organization
$Users = Get-User -ResultSize Unlimited | Select -ExpandProperty DistinguishedName

# For each user in the org, check to see if they're apart of the new group. If not, disable Remote powershell.
$Users | % {
    if ($Members -Contains $_) {
        $_ | Set-User -RemotePowerShellEnabled $True -Confirm:$false
    } Else {
        $_ | Set-User -RemotePowerShellEnabled $False -Confirm:$false
    }
}