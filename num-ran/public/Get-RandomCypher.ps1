 
Function Get-RandomCypher {
$RandomCypher = $Cyphers[(Get-Random $Cyphers.count)]
$RandomCypher.effect = ($RandomCypher.effect.split([Environment]::NewLine)).foreach({$_ + "`r`n"})
return $RandomCypher
}