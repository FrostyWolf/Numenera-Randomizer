Function Get-ArtifactText {
    param(
        [PSCustomObject]$SelectedArtifact
    )
    return "$($SelectedArtifact.Name) `r`nLevel: $($SelectedArtifact.Level) `r`nForm: $($SelectedArtifact.Form)`r`nEffect: $($SelectedArtifact.Effect)`r`nDepletion: $($SelectedArtifact.Depletion)`r`n$($SelectedArtifact.Book) (Page: $($SelectedArtifact.Page))"
}