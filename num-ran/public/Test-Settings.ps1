Function Test-Settings {

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

    Return $Settings

}