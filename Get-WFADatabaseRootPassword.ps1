$REGISTERY_KEY = "HKLM:\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\NA_WFA_SRV\Parameters\Java"

try{
    $Registery = Get-ItemProperty $REGISTERY_KEY -ErrorAction Stop
    $WFADatabaseRootPassword = ($Registery | Select -ExpandProperty Options | Where {$_ -match "-Dmysql.password"}).split("=")[1]
}catch [Exception]{
    Write-Error $_.Exception.Message
}

Write-Host "Password: $WFADatabaseRootPassword"