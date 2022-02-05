$data = (Get-Content .\Parse\Test.txt) -Replace "â€`“", "-" -Replace "â€™", "'" -Replace "Ã—","x" -Replace "â€`”","-"

$book = "Technology Compendium: Sir Arthour's Guide to the Numenera"

$page = 33

$allendindex = ($data.count - 1)

$form = Foreach ($CurrentIndex in 0..$allendindex) {
    If ($data[$CurrentIndex] -eq "") {$page++}
    ElseIf (($data[$currentindex] -like "Level: *") -and -not($match)) {
        $StartSingleIndex = ($CurrentIndex - 1)
        $match = $true
    }
    Elseif ((($data[$currentindex] -like "Level: *") -and ($match)) -or $CurrentIndex -eq $allendindex) {
        If ($CurrentIndex -eq $allendindex) {$CurrentIndex = ($CurrentIndex + 2)}
        $singlecypher = $data[$StartSingleIndex..($CurrentIndex - 2)]
        $StartSingleIndex = ($CurrentIndex - 1)
        
        $EffectIndex = [array]::indexof($singlecypher, ($singlecypher.where({ $_ -like "Effect:*" }))[0])

        $ChartIndex = [array]::indexof($singlecypher, ($singlecypher.where({ $_ -like "01-*" }))[0])

        $EndIndex = ($singlecypher.count - 1)

        if ($singlecypher[$EndIndex] -eq ""){$Endindex--}

        [PSCustomObject]@{
            Name   = (Get-Culture).textinfo.totitlecase((Get-Culture).textinfo.Tolower($singlecypher[0]))
            Level  = $singlecypher[1] -Replace "Level: ", ""
            Form   = ((($singlecypher[2..(($effectindex) - 1)]) -join " ") -replace 'Wearable: |Usable: |Form: |Internal: ', ", " -replace " , ", ", " -replace " or ",", ").trim(", ")
            Effect = If ($ChartIndex -eq -1) {
        (($singlecypher[$EffectIndex..($EndIndex)] -join " ") -Replace "Effect: ", "" -Replace "- ","-")
            }
            Else {
        (($singlecypher[$EffectIndex..($ChartIndex - 1)] -join " ") -Replace "Effect: ", "" -Replace "- ","-") + "`r`n`r`n" + ($singlecypher[$ChartIndex..$EndIndex] -Join "`r`n")
            }
            Book = $book
            Page = $page
        }
    }
}

$form | Export-Csv parsedcyphers3.csv

#look for $form.form.where({$_ -like "*, *"}) "1 " "1-" "page" "01-" last effect Fix quotes "-" " -" "- "

