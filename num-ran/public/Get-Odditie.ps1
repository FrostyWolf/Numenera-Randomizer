Function Get-Odditie {
   param(
      [int]$Index,
      [switch]$Random
   )

   If ($Random) {
      $SelectedOdditie = $Oddities[(Get-Random $Oddities.count)]
   }
   Else {
      $SelectedOdditie = $Oddities[$Index]
   }

   $UnrolledOdditie = [PSCustomObject]@{
      Description   = $SelectedOdditie.Description
      Book   = $SelectedOdditie.Book
      Page   = $SelectedOdditie.Page
   }

   $RolledOdditie = [PSCustomObject]@{
      Description   = $SelectedOdditie.Description
      Book   = $SelectedOdditie.Book
      Page   = $SelectedOdditie.Page
   }

   $OdditieData = [PSCustomObject]@{
      Raw      = $SelectedOdditie
      Unrolled = $UnrolledOdditie
      Rolled   = $RolledOdditie
   }

   return $OdditieData
}