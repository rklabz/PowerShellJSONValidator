# Restart All Ascent Services
Write-Host '************ Validating JSON Files ************' -BackgroundColor White -ForegroundColor Blue

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
 
#$FileName = Read-Host "Enter file name to validated: " 
#$CompleteFileName = $ScriptDir + "\" + $FileName

#$CompleteFileName = $ScriptDir + "\json.txt"
#Get-Item -Path $CompleteFileName -Stream *

#$FileData = Get-Content -Path $CompleteFileName -Stream $DATA

#Get-Content -Path $CompleteFileName -Stream $DATA

Write-Host "Current directory is $ScriptDir" -ForegroundColor Cyan
Write-Host "Checking all TXT files in the current directory:" -ForegroundColor Yellow
#Get-ChildItem -Path $ScriptDir -Name  

Get-ChildItem $ScriptDir -Filter *.txt | 
Foreach-Object {

    Write-Host "Analysing " $_.FullName
    $FileData = Get-Content -Path $_.FullName -Stream $DATA

    #Get-Content -Path $_.FullName -Stream $DATA

    try {
        $FileData | ConvertFrom-Json  -ErrorAction Stop
        $validJson = $true
    }
    catch {
        $validJson = $false
     }
 
     if ($validJson) {
        Write-Host "*******" $_.Name " VALID JSON *******" -BackgroundColor Green
     }
     else {
         Write-Host "*******" $_.Name " INVALID JSON *******" -BackgroundColor Red
     }
}


 

