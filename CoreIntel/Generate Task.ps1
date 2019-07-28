Import-Module OSDDrivers -Force
$OSVersionMatch = '10.0'



Get-ChildItem $PSScriptRoot *.cab | foreach {
    $OSArchMatch = 'x64'
    $OSInstallationType = $null
    if ($_.Name -match 'x86') {$OSArchMatch = 'x86'}
    if ($_.Name -match 'Client') {$OSInstallationType = 'Client'}
    
    

    if ($_.Name -match 'IntelBluetooth') {New-OSDDriverTask -OSDDriverFile "$($_.FullName)" -OSArchMatch $OSArchMatch}
    if ($_.Name -match 'IntelChipset 10') {New-OSDDriverTask -OSDDriverFile "$($_.FullName)" -OSArchMatch $OSArchMatch -OSInstallationType $OSInstallationType}
    #if ($_.Name -match 'IntelChipset ME') {New-OSDDriverTask -OSDDriverFile "$($_.FullName)" -OSArchMatch $OSArchMatch}


    
}