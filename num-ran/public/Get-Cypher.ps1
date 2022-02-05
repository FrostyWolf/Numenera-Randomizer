 
Function Get-Cypher {
   param(
      [int]$Index,
      [switch]$Random
   )

   If ($Random) {
      $SelectedCypher = $Cyphers[(Get-Random $Cyphers.count)]
   }
   Else {
      $SelectedCypher = $Cyphers[$Index]
   }

   $UnrolledCypher = [PSCustomObject]@{
      Name   = $SelectedCypher.Name
      Level  = $SelectedCypher.Level
      Form   = $SelectedCypher.Form
      Effect = ($SelectedCypher.effect.split([Environment]::NewLine)).foreach({ $_ + "`r`n" })
      Book   = $SelectedCypher.Book
      Page   = $SelectedCypher.Page
   }

   $RolledCypher = [PSCustomObject]@{
      Name   = $SelectedCypher.Name
      Level  = $SelectedCypher.Level
      Form   = (Get-Culture).textinfo.totitlecase((Get-Random ($SelectedCypher.Form -split ", ")))
      Effect = $UnrolledCypher.Effect
      Book   = $SelectedCypher.Book
      Page   = $SelectedCypher.Page
   }

   $CypherData = [PSCustomObject]@{
      Raw      = $SelectedCypher
      Unrolled = $UnrolledCypher
      Rolled   = $RolledCypher
   }

   return $CypherData
}