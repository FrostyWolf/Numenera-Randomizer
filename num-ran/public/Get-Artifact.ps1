 
Function Get-Artifact {
   param(
      [int]$Index,
      [switch]$Random
   )

   If ($Random) {
      $SelectedArtifact = $Artifacts[(Get-Random $Artifacts.count)]
   }
   Else {
      $SelectedArtifact = $Artifacts[$Index]
   }

   $UnrolledArtifact = [PSCustomObject]@{
      Name   = $SelectedArtifact.Name
      Level  = $SelectedArtifact.Level
      Form   = $SelectedArtifact.Form
      Effect = ($SelectedArtifact.effect.split([Environment]::NewLine)).foreach({ $_ + "`r`n" })
      Depletion = $SelectedArtifact.Depletion
      Book   = $SelectedArtifact.Book
      Page   = $SelectedArtifact.Page
   }

   $RolledArtifact = [PSCustomObject]@{
      Name   = $SelectedArtifact.Name
      Level  = Get-DiceRoll ($SelectedArtifact.Level)
      Form   = (Get-Culture).textinfo.totitlecase((Get-Random ($SelectedArtifact.Form -split ", ")))
      Effect = $UnrolledArtifact.Effect
      Depletion = $SelectedArtifact.Depletion
      Book   = $SelectedArtifact.Book
      Page   = $SelectedArtifact.Page
   }

   $ArtifactData = [PSCustomObject]@{
      Raw      = $SelectedArtifact
      Unrolled = $UnrolledArtifact
      Rolled   = $RolledArtifact
   }

   return $ArtifactData
}