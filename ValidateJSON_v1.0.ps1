Write-Host '************ Validating JSON Files ************' -BackgroundColor White -ForegroundColor Blue

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path

Write-Host "Current directory is $ScriptDir" -ForegroundColor Cyan
Write-Host "Checking all TXT files in the current directory:" -ForegroundColor Yellow

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


Read-Host ""*******"Finished validating files."*******""
