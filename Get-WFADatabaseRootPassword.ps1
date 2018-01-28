$REGISTRY_KEY = "HKLM:\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\NA_WFA_SRV\Parameters\Java"

try{
    $Registry = Get-ItemProperty $REGISTRY_KEY -ErrorAction Stop
    $WFADatabaseRootPassword = ($Registry | Select -ExpandProperty Options | Where {$_ -match "-Dmysql.password"}).split("=")[1]
}catch [Exception]{
    Write-Error $_.Exception.Message
}

Write-Host "Password: $WFADatabaseRootPassword"
