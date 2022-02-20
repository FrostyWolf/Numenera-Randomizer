Function Get-OdditieText {
    param(
        [PSCustomObject]$SelectedOdditie
    )
    return "$($SelectedOdditie.Description) `r`n`r`n$($SelectedOdditie.Book) (Page: $($SelectedOdditie.Page))"
}