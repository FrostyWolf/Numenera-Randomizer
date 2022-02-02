function Set-Settings {
    param(
        [string]$OdditiesPath,
        [string]$CyphersPath,
        [string]$ArtifactsPath
    )

    $Settings = $Settings = Test-Settings

    $NewSettings = Foreach ($Setting in $Settings) {
        If ([string]::IsNullOrEmpty((Get-Variable "$($Setting.Setting)Path" -ErrorAction SilentlyContinue).value)) {
            $Setting 
        }
        Else { 
            [PSCustomObject]@{
                "Setting" = $Setting.Setting 
                "Path"    = (Get-Variable "$($Setting.Setting)Path").Value
            }
        }
    }

    $NewSettings | Export-Csv "$Global:Path\Settings.csv" -Force

}