@{

    # Script module or binary module file associated with this manifest.
    RootModule = 'num-ran.psm1'
    
    # Version number of this module.
    ModuleVersion = '1.0.0.0'
    
    # ID used to uniquely identify this module
    GUID = '5aa1bcf9-1d34-41cd-b3b5-29c5e5d14967'
    
    # Author of this module
    Author = 'Louis Horens'
    
    # Company or vendor of this module
    CompanyName = ''
    
    # Copyright statement for this module
    Copyright = '(c) 2022 Louis Horens. All rights reserved.'
    
    # Description of the functionality provided by this module
    Description = 'Numenera Item Randomizer'
    
    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion = '5.1'
    
    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @(
        "Get-GoogleSheets",
        "Get-Settings",
        "Set-Settings",
        "Test-Settings",
        "Show-Error"
    )
    
    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()
    
    # Variables to export from this module
    VariablesToExport = @()
    
    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()
       
    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{
    
        PSData = @{
    
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @("Numenera", "Cyphers", "Oddities", "Artifacts")
    
            # A URL to the license for this module.
            LicenseUri = "https://github.com/FrostyWolf/Numenera-Randomizer/blob/master/LICENSE"
    
            # A URL to the main website for this project.
            ProjectUri = "https://github.com/FrostyWolf/Numenera-Randomizer"
   
        } # End of PSData hashtable
    
    } # End of PrivateData hashtable
    }
    