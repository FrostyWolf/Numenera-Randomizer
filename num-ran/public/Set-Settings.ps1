function Set-Settings {
    param(
        [string]$OdditiesPath,
        [string]$CyphersPath,
        [string]$ArtifactsPath
    )
    $Settings = If (-not(Test-Path "$Global:Path\Settings.csv")) {
        [PSCustomObject]@{
            "Setting" = "Oddities"
            "Path"    = "$Global:Path\Oddities.csv"
        } 
        [PSCustomObject]@{
            "Setting" = "Cyphers"
            "Path"    = "$Global:Path\Cyphers.csv"
        }
        [PSCustomObject]@{
            "Setting" = "Artifacts"
            "Path"    = "$Global:Path\Artifacts.csv"
        }
    }
    Else {
        Import-Csv "$Global:Path\Settings.csv"
    }

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
