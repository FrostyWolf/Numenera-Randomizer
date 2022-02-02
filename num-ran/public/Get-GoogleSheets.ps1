function Get-GoogleSheets {
    param(
        [string]$Url
    )

    $urlsplit = $url.split("/")
    $CleanURL = "$($urlsplit[0])/$($urlsplit[1])/$($urlsplit[2])/$($urlsplit[3])/$($urlsplit[4])/$($urlsplit[5])"
    
    return (Invoke-WebRequest -uri "$CleanURL/export?format=csv").content | ConvertFrom-Csv  

}