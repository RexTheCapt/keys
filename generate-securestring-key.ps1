[byte[]]$Rand = for($var=1;$var -le 129){
    Get-Random -min 1 -max 255
    $var++
}

$length = 0
Set-Content -Value "`$key = ($(
    for ($i = 0; $i -lt $Rand.Count; $i++) {
        $Rand[$i]
        if ($i -le $Rand.Count - 2)
        {
            ","
        }
        $length = $i
    }
))" -Path ./securestring-key.ps1

$length
. .\securestring-key.ps1

"Key: $key"