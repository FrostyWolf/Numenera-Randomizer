Function Get-CypherText {
    param(
        [PSCustomObject]$SelectedCypher
    )
    return "$($SelectedCypher.Name) `r`nLevel: $($SelectedCypher.Level) `r`nForm: $($SelectedCypher.Form)`r`nEffect: $($SelectedCypher.Effect) `r`n$($SelectedCypher.Book) (Page: $($SelectedCypher.Page))"
}