# M365 Scripts
Suite of useful Powershell scripts for M365 tenant admins

## Exchange Online

1. `Disable-RemotePwsh.ps1`
    - Disables Remote Powershell capability for all users that are not Tenant Admins. Also creates a group named `Remote Powershell Users` and adds Tenant Admin Role Group Members to it.

## Sharepoint Online

1. `Get-SPOSiteIds.ps1`
    - Creates a CSV file containing all the organization's Sharepoint site names, site id's, list id's, web url's, and full site id for use in auto-mapping site document libraries with Intune or Group Policy