<#
Bulk rename computers from AD;
Predrag Jordanovic
predrag.jordanovic@ods.rs
29.03.2022
v2

Powershel >v3.0
Open PowerShell using "Run As Administrator"
adc.csv - delimiter mora biti ,
u csv-u : oldname,newname

.\bulk_rename_adc.ps1

#>
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force;
$computers = import-csv -Path ".\adc.csv"
$Credential = Get-Credential
$nisuprosli=".\nisuprosli $(get-date -f dd-MM-yyyy-HHMM).csv"
$makecsv="oldname,newname" | Out-File $nisuprosli -Encoding utf8 -Append

foreach ($pc in $computers){
   
 $IsOldPCalive=Test-Connection -ComputerName $pc.oldname -Quiet -Count 1 -ErrorAction SilentlyContinue
 $IsNewPCalive=Test-Connection -ComputerName $pc.newname -Quiet -Count 1 -ErrorAction SilentlyContinue

 if ($IsOldPCalive -eq $True -and $IsNewPCalive -eq $False) {
      write-host "Rename PC $($pc.oldname) u $($pc.newname)" -ForegroundColor Cyan
      Rename-computer -computername $pc.oldname -newname $pc.newname -domaincredential $Credential -PassThru -force -restart #-WhatIf   
         }
    else {
    write-host "PC $($pc.oldname) nije dostupan ili vec postoji $($pc.newname)" -ForegroundColor Yellow
    $makecsv="$($pc.oldname),$($pc.newname)" | Out-File $nisuprosli -Encoding utf8 -Append
    }

}
