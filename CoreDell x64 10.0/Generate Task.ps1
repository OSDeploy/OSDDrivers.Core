Import-Module OSDDrivers -Force
$MakeMatch = 'Dell'
$OSVersionMatch = '10.0'
$OSArchMatch = 'x64'

Get-ChildItem $PSScriptRoot *.cab | foreach {
    New-OSDDriverTask -OSDDriverFile "$($_.FullName)" -MakeMatch $MakeMatch -OSVersionMatch $OSVersionMatch -OSArchMatch $OSArchMatch
}