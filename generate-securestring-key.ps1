[byte[]]$Rand = for($var=1;$var -le 100){
    Get-Random -min 1 -max 255
    $var++
}

Set-Content -Value "`$key = ($(
    for ($i = 0; $i -lt $Rand.Count; $i++) {
        $Rand[$i]
        if ($i -le $Rand.Count - 2)
        {
            ","
        }
    }
))" -Path ./securestring-key.ps1

. .\securestring-key.ps1

"Key: $key"