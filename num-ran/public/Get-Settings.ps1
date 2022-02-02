function Get-Settings {
    
    $Settings = Test-Settings

    Foreach ($Setting in $Settings) {
        If ($Setting.Path.Split("/")[2] -eq "docs.google.com") {
            $array = Get-GoogleSheets $Setting.Path
        }
        Elseif ($Setting.Path.Split("/")[0] -like "http*") {
            $array = (Invoke-WebRequest -uri $Setting.Path).content | ConvertFrom-Csv 
        }
        Else {
            $array = Import-Csv $Setting.Path 
        }
        $array | Export-Csv "$Global:Path\$($Setting.Setting).csv" -Force
        Set-Variable -Name $Setting.Setting -Value $array -Scope Global
    }
}