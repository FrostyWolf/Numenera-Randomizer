$data = (Get-Content .\Parse\Test.txt) -Replace "â€`“", "-" -Replace "â€™", "'" -Replace "Ã—", "x" -Replace "â€`”", "-"

$book = "Technology Compendium: Sir Arthour's Guide to the Numenera"

$page = 103

$allendindex = ($data.count - 1)

$StartSingleIndex = 0

$form = Foreach ($CurrentIndex in 3..$allendindex) {
    If ($data[$CurrentIndex] -eq "") { $page++ }
    Elseif (($data[$currentindex] -like "Level: *") -or ($CurrentIndex -eq $allendindex)) {

        If ($allendindex -eq $currentindex) {$CurrentIndex = ($CurrentIndex + 2)}

        $singleartifact = $data[$StartSingleIndex..($CurrentIndex - 2)]

        $StartSingleIndex = ($CurrentIndex - 1)

        $EffectIndex = [array]::indexof($singleartifact, ($singleartifact.where({ $_ -like "Effect:*" }))[0])

        $ChartIndex = [array]::indexof($singleartifact, ($singleartifact.where({ $_ -like "01-*" }))[0])

        $DepletionIndex = [array]::indexof($singleartifact, ($singleartifact.where({ $_ -like "Depletion: *" }))[0])

        $EndIndex = ($singleartifact.count - 1)

        if ($singleartifact[$EndIndex] -eq "") { $Endindex-- }

        $Effect = If ($ChartIndex -eq -1) {
            (($singleartifact[$EffectIndex..($DepletionIndex - 1)] -join " ") -Replace "Effect: ", "" -Replace "- ", "-")
        }
        Else {
            (($singleartifact[$EffectIndex..($ChartIndex - 1)] -join " ") -Replace "Effect: ", "" -Replace "- ", "-") + "`r`n`r`n" + ($singleartifact[$ChartIndex..($DepletionIndex - 1)] -Join "`r`n")
        }

        [PSCustomObject]@{ 
            Name   = (Get-Culture).textinfo.totitlecase((Get-Culture).textinfo.Tolower($singleartifact[0]))
            Level  = $singleartifact[1] -Replace "Level: ", ""
            Form   = ($singleartifact[2..(($effectindex) - 1)]) -join " " -Replace "Form: ",""
            Effect = $Effect
            Depletion = $singleartifact[$DepletionIndex..$EndIndex] -join " " -Replace "Depletion: ",""
            Book = $book
            Page = $page
        }
    }
}

$form | Export-Csv parsedartifacts.csv