Function Show-NumeneraRandomizer {

    Add-Type -assembly System.Windows.Forms
    $Settings = Test-Settings
    Get-Settings

    $Oddity = $Oddities[(Get-Random $Oddities.count)]
    $Cypher = $Cyphers[(Get-Random $Cyphers.count)]
    $Artifact = $Artifacts[(Get-Random $Artifacts.count)]

    #Create Main Form
    $RandomizerMain = New-Object System.Windows.Forms.Form
    $RandomizerMain.Size = New-Object System.Drawing.Size(610, 360)
    $RandomizerMain.AutoSize = $true
    $RandomizerMain.Text = 'Numenera Randomizer'

    #Create Tab Control
    $TabControl = New-Object System.Windows.Forms.TabControl
    $TabControl.Location = New-Object System.Drawing.Size(0, 0)
    $TabControl.Size = New-Object System.Drawing.Size(610, 360)
    $TabControl.AutoSize = $true

    #Create Oddities Tab
    $tabOddities = New-Object System.Windows.Forms.TabPage
    $tabOddities.Name = "Oddities"
    $tabOddities.Text = "Oddities $($Oddities.count)"

    #Create Oddities Textbox
    $TextboxOddities = New-Object System.Windows.Forms.Textbox
    $TextboxOddities.Location = New-Object System.Drawing.Point(1, 1)
    $TextboxOddities.Size = New-Object System.Drawing.Size(600, 300)
    $TextboxOddities.text = "$($Oddity.Description) `r`n`r`n$($Oddity.Book) (Page: $($Oddity.Page))"
    $TextboxOddities.Multiline = $true
    $TextboxOddities.WordWrap = $true
    $TextboxOddities.Scrollbars = "Vertical"
    $tabOddities.Controls.Add($TextboxOddities)

    #Create Oddities Random Button
    $RandomButtonOddities = New-Object System.Windows.Forms.Button
    $RandomButtonOddities.text = "Random"
    $RandomButtonOddities.Location = New-Object System.Drawing.Point(1, 307)
    $RandomButtonOddities.AutoSize = $true
    $RandomButtonOddities.add_Click({
            $Oddity = $Oddities[(Get-Random $Oddities.count)]
            $TextboxOddities.text = "$($Oddity.Description) `r`n`r`n$($Oddity.Book) (Page: $($Oddity.Page))"
            $TextboxOddities.Refresh()
            $TextboxIndexOddities.text = [array]::indexof($Oddities.Description, $Oddity.Description) + 1
            $TextboxIndexOddities.Refresh()
            $tabOddities.Refresh()
            $TabControl.Refresh()
            $RandomizerMain.Refresh()
        })
    $tabOddities.Controls.Add($RandomButtonOddities)

    #Create Oddities Goto Textbox
    $TextboxIndexOddities = New-Object System.Windows.Forms.Textbox
    $TextboxIndexOddities.Location = New-Object System.Drawing.Point(330, 309)
    $TextboxIndexOddities.Size = New-Object System.Drawing.Size(30, 12)
    $TextboxIndexOddities.text = [array]::indexof($Oddities.Description, $Oddity.Description) + 1
    $tabOddities.Controls.Add($TextboxIndexOddities)

    #Create Oddities Goto Button
    $GotoButtonOddities = New-Object System.Windows.Forms.Button
    $GotoButtonOddities.text = "Goto:"
    $GotoButtonOddities.Location = New-Object System.Drawing.Point(250, 307)
    $GotoButtonOddities.AutoSize = $true
    $GotoButtonOddities.add_Click({
            $Oddity = $Oddities[([int]$TextboxIndexOddities.text - 1)]
            $TextboxOddities.text = "$($Oddity.Description) `r`n`r`n$($Oddity.Book) (Page: $($Oddity.Page))"
            $TextboxOddities.Refresh()
            $tabOddities.Refresh()
            $TabControl.Refresh()
            $RandomizerMain.Refresh()
        })
    $tabOddities.Controls.Add($GotoButtonOddities)

    #Create Oddities Copy to Clipboard Button
    $CopyButtonOddities = New-Object System.Windows.Forms.Button
    $CopyButtonOddities.text = "Copy"
    $CopyButtonOddities.Location = New-Object System.Drawing.Point(525, 307)
    $CopyButtonOddities.AutoSize = $true
    $CopyButtonOddities.add_Click({ Set-Clipboard $TextboxOddities.text })
    $tabOddities.Controls.Add($CopyButtonOddities)

    $TabControl.TabPages.Add($tabOddities)

    #Create Cyphers Tab
    $tabCyphers = New-Object System.Windows.Forms.TabPage
    $tabCyphers.Name = "Cyphers"
    $tabCyphers.Text = "Cyphers $($Cyphers.count)"

    #Create Cyphers Textbox
    $TextboxCyphers = New-Object System.Windows.Forms.Textbox
    $TextboxCyphers.Location = New-Object System.Drawing.Point(1, 1)
    $TextboxCyphers.Size = New-Object System.Drawing.Size(600, 300)
    $TextboxCyphers.text = "$($Cypher.Name) `r`nLevel: $($Cypher.Level) `r`n$($Cypher.Description) `r`n`r`n$($Cypher.Book) (Page: $($Cypher.Page))"
    $TextboxCyphers.Multiline = $true
    $TextboxCyphers.WordWrap = $true
    $TextboxCyphers.Scrollbars = "Vertical"
    $tabCyphers.Controls.Add($TextboxCyphers)

    #Create Cyphers Random Button
    $RandomButtonCyphers = New-Object System.Windows.Forms.Button
    $RandomButtonCyphers.text = "Random"
    $RandomButtonCyphers.Location = New-Object System.Drawing.Point(1, 307)
    $RandomButtonCyphers.AutoSize = $true
    $RandomButtonCyphers.add_Click({
            $Cypher = $Cyphers[(Get-Random $Cyphers.count)]
            $TextboxCyphers.text = "$($Cypher.Name) `r`nLevel: $($Cypher.Level) `r`n$($Cypher.Description) `r`n`r`n$($Cypher.Book) (Page: $($Cypher.Page))"
            $TextboxCyphers.Refresh()
            $TextboxIndexCyphers.text = [array]::indexof($Cyphers.Description, $Cypher.Description) + 1
            $TextboxIndexCyphers.Refresh()
            $tabCyphers.Refresh()
            $TabControl.Refresh()
            $RandomizerMain.Refresh()
        })
    $tabCyphers.Controls.Add($RandomButtonCyphers)

    #Create Cyphers Goto Textbox
    $TextboxIndexCyphers = New-Object System.Windows.Forms.Textbox
    $TextboxIndexCyphers.Location = New-Object System.Drawing.Point(330, 309)
    $TextboxIndexCyphers.Size = New-Object System.Drawing.Size(30, 12)
    $TextboxIndexCyphers.text = [array]::indexof($Cyphers.Description, $Cypher.Description) + 1
    $tabCyphers.Controls.Add($TextboxIndexCyphers)

    #Create Cyphers Goto Button
    $GotoButtonCyphers = New-Object System.Windows.Forms.Button
    $GotoButtonCyphers.text = "Goto:"
    $GotoButtonCyphers.Location = New-Object System.Drawing.Point(250, 307)
    $GotoButtonCyphers.AutoSize = $true
    $GotoButtonCyphers.add_Click({
            $Cypher = $Cyphers[([int]$TextboxIndexCyphers.text - 1)]
            $TextboxCyphers.text = "$($Cypher.Name) `r`nLevel: $($Cypher.Level) `r`n$($Cypher.Description) `r`n`r`n$($Cypher.Book) (Page: $($Cypher.Page))"
            $TextboxCyphers.Refresh()
            $tabCyphers.Refresh()
            $TabControl.Refresh()
            $RandomizerMain.Refresh()
        })
    $tabCyphers.Controls.Add($GotoButtonCyphers)

    #Create Cyphers Copy to Clipboard Button
    $CopyButtonCyphers = New-Object System.Windows.Forms.Button
    $CopyButtonCyphers.text = "Copy"
    $CopyButtonCyphers.Location = New-Object System.Drawing.Point(525, 307)
    $CopyButtonCyphers.AutoSize = $true
    $CopyButtonCyphers.add_Click({ Set-Clipboard $TextboxCyphers.text })
    $tabCyphers.Controls.Add($CopyButtonCyphers)

    $TabControl.TabPages.Add($tabCyphers)

    #Create Artifacts Tab
    $tabArtifacts = New-Object System.Windows.Forms.TabPage
    $tabArtifacts.Name = "Artifacts"
    $tabArtifacts.Text = "Artifacts $($Artifacts.count)"

    #Create Artifacts Textbox
    $TextboxArtifacts = New-Object System.Windows.Forms.Textbox
    $TextboxArtifacts.Location = New-Object System.Drawing.Point(1, 1)
    $TextboxArtifacts.Size = New-Object System.Drawing.Size(600, 300)
    $TextboxArtifacts.text = "$($Artifact.Name) `r`nLevel: $($Artifact.Level) `r`nEffect: $($Artifact.Effect) `r`nDepletion: $($Artifact.Depletion) `r`n`r`n$($Artifact.Book) (Page: $($Artifact.Page))"
    $TextboxArtifacts.Multiline = $true
    $TextboxArtifacts.WordWrap = $true
    $TextboxArtifacts.Scrollbars = "Vertical"
    $tabArtifacts.Controls.Add($TextboxArtifacts)

    #Create Artifacts Random Button
    $RandomButtonArtifacts = New-Object System.Windows.Forms.Button
    $RandomButtonArtifacts.text = "Random"
    $RandomButtonArtifacts.Location = New-Object System.Drawing.Point(1, 307)
    $RandomButtonArtifacts.AutoSize = $true
    $RandomButtonArtifacts.add_Click({
            $Artifact = $Artifacts[(Get-Random $Artifacts.count)]
            $TextboxArtifacts.text = "$($Artifact.Name) `r`nLevel: $($Artifact.Level) `r`nEffect: $($Artifact.Effect) `r`nDepletion: $($Artifact.Depletion) `r`n`r`n$($Artifact.Book) (Page: $($Artifact.Page))"
            $TextboxArtifacts.Refresh()
            $TextboxIndexArtifacts.text = [array]::indexof($Artifacts.Effect, $Artifact.Effect) + 1
            $TextboxIndexArtifacts.Refresh()
            $tabArtifacts.Refresh()
            $TabControl.Refresh()
            $RandomizerMain.Refresh()
        })
    $tabArtifacts.Controls.Add($RandomButtonArtifacts)

    #Create Artifacts Goto Textbox
    $TextboxIndexArtifacts = New-Object System.Windows.Forms.Textbox
    $TextboxIndexArtifacts.Location = New-Object System.Drawing.Point(330, 309)
    $TextboxIndexArtifacts.Size = New-Object System.Drawing.Size(30, 12)
    $TextboxIndexArtifacts.text = [array]::indexof($Artifacts.Effect, $Artifact.Effect) + 1
    $tabArtifacts.Controls.Add($TextboxIndexArtifacts)

    #Create Artifacts Goto Button
    $GotoButtonArtifacts = New-Object System.Windows.Forms.Button
    $GotoButtonArtifacts.text = "Goto:"
    $GotoButtonArtifacts.Location = New-Object System.Drawing.Point(250, 307)
    $GotoButtonArtifacts.AutoSize = $true
    $GotoButtonArtifacts.add_Click({
            $Artifact = $Artifacts[([int]$TextboxIndexArtifacts.text - 1)]
            $TextboxArtifacts.text = "$($Artifact.Name) `r`nLevel: $($Artifact.Level) `r`nEffect: $($Artifact.Effect) `r`nDepletion: $($Artifact.Depletion) `r`n`r`n$($Artifact.Book) (Page: $($Artifact.Page))"
            $TextboxArtifacts.Refresh()
            $tabArtifacts.Refresh()
            $TabControl.Refresh()
            $RandomizerMain.Refresh()
        })
    $tabArtifacts.Controls.Add($GotoButtonArtifacts)

    #Create Artifacts Copy to Clipboard Button
    $CopyButtonArtifacts = New-Object System.Windows.Forms.Button
    $CopyButtonArtifacts.text = "Copy"
    $CopyButtonArtifacts.Location = New-Object System.Drawing.Point(525, 307)
    $CopyButtonArtifacts.AutoSize = $true
    $CopyButtonArtifacts.add_Click({ Set-Clipboard $TextboxArtifacts.text })
    $tabArtifacts.Controls.Add($CopyButtonArtifacts)

    $TabControl.TabPages.Add($tabArtifacts) 

    #Settings Tab
    $tabSettings = New-Object System.Windows.Forms.TabPage
    $tabSettings.Name = "Settings"
    $tabSettings.Text = "Settings"

    #Settings Help Label
    $LabelTSHelp = New-Object System.Windows.Forms.Label
    $LabelTSHelp.text = "Set Paths to CSVs:"
    $LabelTSHelp.Location = New-Object System.Drawing.Point(0, 10)
    $LabelTSHelp.AutoSize = $true
    $tabSettings.Controls.Add($LabelTSHelp)

    #Settings Apply Button
    $ButtonTSApply = New-Object System.Windows.Forms.Button
    $ButtonTSApply.text = "Apply"
    $ButtonTSApply.Location = New-Object System.Drawing.Point(3, 150)
    $ButtonTSApply.AutoSize = $true
    $ButtonTSApply.add_Click({
            Set-Settings -OdditiesPath $TextboxTSOddities.text -CyphersPath $TextboxTSCyphers.text -ArtifactsPath $TextboxTSArtifacts.text
            Get-Settings
            $tabOddities.Text = "Oddities $($Oddities.count)"
            $tabOddities.Refresh()
            $tabCyphers.Text = "Oddities $($Cyphers.count)"
            $tabCyphers.Refresh()
            $tabArtifacts.Text = "Oddities $($Artifacts.count)"
            $tabArtifacts.Refresh()
            $TabControl.Refresh()
            $RandomizerMain.Refresh()
        })
    $tabSettings.Controls.Add($ButtonTSApply)

    #Settings Odditites Label
    $LabelTSOdditites = New-Object System.Windows.Forms.Label
    $LabelTSOdditites.text = "Odditites Path:"
    $LabelTSOdditites.Location = New-Object System.Drawing.Point(0, 30)
    $LabelTSOdditites.AutoSize = $true
    $tabSettings.Controls.Add($LabelTSOdditites)

    #Settings Oddities Textbox
    $TextboxTSOddities = New-Object System.Windows.Forms.Textbox
    $TextboxTSOddities.Location = New-Object System.Drawing.Point(80, 28)
    $TextboxTSOddities.Size = New-Object System.Drawing.Size(300, 12)
    $TextboxTSOddities.text = ($Settings.where({ $_.setting -eq "Oddities" })).Path
    $tabSettings.Controls.Add($TextboxTSOddities)

    #Settings Cyphers Label
    $LabelTSCyphers = New-Object System.Windows.Forms.Label
    $LabelTSCyphers.text = "Cyphers Path:"
    $LabelTSCyphers.Location = New-Object System.Drawing.Point(0, 60)
    $LabelTSCyphers.AutoSize = $true
    $tabSettings.Controls.Add($LabelTSCyphers)

    #Settings Cyphers Textbox
    $TextboxTSCyphers = New-Object System.Windows.Forms.Textbox
    $TextboxTSCyphers.Location = New-Object System.Drawing.Point(80, 58)
    $TextboxTSCyphers.Size = New-Object System.Drawing.Size(300, 12)
    $TextboxTSCyphers.text = ($Settings.where({ $_.setting -eq "Cyphers" })).Path
    $tabSettings.Controls.Add($TextboxTSCyphers)

    #Settings Artifacts Label
    $LabelTSArtifacts = New-Object System.Windows.Forms.Label
    $LabelTSArtifacts.text = "Artifacts Path:"
    $LabelTSArtifacts.Location = New-Object System.Drawing.Point(0, 90)
    $LabelTSArtifacts.AutoSize = $true
    $tabSettings.Controls.Add($LabelTSArtifacts)

    #Settings Artifacts Textbox
    $TextboxTSArtifacts = New-Object System.Windows.Forms.Textbox
    $TextboxTSArtifacts.Location = New-Object System.Drawing.Point(80, 88)
    $TextboxTSArtifacts.Size = New-Object System.Drawing.Size(300, 12)
    $TextboxTSArtifacts.text = ($Settings.where({ $_.setting -eq "Artifacts" })).Path
    $tabSettings.Controls.Add($TextboxTSArtifacts)

    $TabControl.TabPages.Add($tabSettings) 

    $RandomizerMain.Controls.Add($TabControl)

    $RandomizerMain.showdialog()

}