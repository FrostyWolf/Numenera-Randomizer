Add-Type -assembly System.Windows.Forms
$Settings = Test-Settings
Get-Settings

$RandomizerMain = New-Object System.Windows.Forms.Form
$RandomizerMain.Size = New-Object System.Drawing.Size(610,360)
$RandomizerMain.AutoSize = $true
$RandomizerMain.Text ='Numenera Randomizer'


$TabControl = New-Object System.Windows.Forms.TabControl
$TabControl.Location = New-Object System.Drawing.Size(0,0)
$TabControl.Size = New-Object System.Drawing.Size(610,360)
$TabControl.AutoSize = $true

$tabOddities = New-Object System.Windows.Forms.TabPage
$tabOddities.Name = "Oddities"
$tabOddities.Text = "Oddities"
$TabControl.TabPages.Add($tabOddities)

$tabCyphers = New-Object System.Windows.Forms.TabPage
$tabCyphers.Name = "Cyphers"
$tabCyphers.Text = "Cyphers"
$TabControl.TabPages.Add($tabCyphers)

$tabArtifacts = New-Object System.Windows.Forms.TabPage
$tabArtifacts.Name = "Artifacts"
$tabArtifacts.Text = "Artifacts"
$TabControl.TabPages.Add($tabArtifacts) 

#Settings Tab
$tabSettings = New-Object System.Windows.Forms.TabPage
$tabSettings.Name = "Settings"
$tabSettings.Text = "Settings"

#Settings Help Label
$LabelTSHelp = New-Object System.Windows.Forms.Label
$LabelTSHelp.text = "Set Paths to CSVs:"
$LabelTSHelp.Location = New-Object System.Drawing.Point(0,10)
$LabelTSHelp.AutoSize = $true
$tabSettings.Controls.Add($LabelTSHelp)

#Settings Apply Button
$ButtonTSApply = New-Object System.Windows.Forms.Button
$ButtonTSApply.text = "Apply"
$ButtonTSApply.Location = New-Object System.Drawing.Point(3,150)
$ButtonTSApply.AutoSize = $true
$ButtonTSApply.add_Click({
    Set-Settings -OdditiesPath $TextboxTSOddities.text -CyphersPath $TextboxTSCyphers.text -ArtifactsPath $TextboxTSArtifacts.text
    Get-Settings
})
$tabSettings.Controls.Add($ButtonTSApply)

#Settings Odditites Label
$LabelTSOdditites = New-Object System.Windows.Forms.Label
$LabelTSOdditites.text = "Odditites Path:"
$LabelTSOdditites.Location = New-Object System.Drawing.Point(0,30)
$LabelTSOdditites.AutoSize = $true
$tabSettings.Controls.Add($LabelTSOdditites)

#Settings Oddities Textbox
$TextboxTSOddities = New-Object System.Windows.Forms.Textbox
$TextboxTSOddities.Location = New-Object System.Drawing.Point(80,28)
$TextboxTSOddities.Size = New-Object System.Drawing.Size(300,12)
$TextboxTSOddities.text = ($Settings.where({$_.setting -eq "Oddities"})).Path
$tabSettings.Controls.Add($TextboxTSOddities)

#Settings Cyphers Label
$LabelTSCyphers = New-Object System.Windows.Forms.Label
$LabelTSCyphers.text = "Cyphers Path:"
$LabelTSCyphers.Location = New-Object System.Drawing.Point(0,60)
$LabelTSCyphers.AutoSize = $true
$tabSettings.Controls.Add($LabelTSCyphers)

#Settings Cyphers Textbox
$TextboxTSCyphers = New-Object System.Windows.Forms.Textbox
$TextboxTSCyphers.Location = New-Object System.Drawing.Point(80,58)
$TextboxTSCyphers.Size = New-Object System.Drawing.Size(300,12)
$TextboxTSCyphers.text = ($Settings.where({$_.setting -eq "Cyphers"})).Path
$tabSettings.Controls.Add($TextboxTSCyphers)

#Settings Artifacts Label
$LabelTSArtifacts = New-Object System.Windows.Forms.Label
$LabelTSArtifacts.text = "Artifacts Path:"
$LabelTSArtifacts.Location = New-Object System.Drawing.Point(0,90)
$LabelTSArtifacts.AutoSize = $true
$tabSettings.Controls.Add($LabelTSArtifacts)

#Settings Artifacts Textbox
$TextboxTSArtifacts = New-Object System.Windows.Forms.Textbox
$TextboxTSArtifacts.Location = New-Object System.Drawing.Point(80,88)
$TextboxTSArtifacts.Size = New-Object System.Drawing.Size(300,12)
$TextboxTSArtifacts.text = ($Settings.where({$_.setting -eq "Artifacts"})).Path
$tabSettings.Controls.Add($TextboxTSArtifacts)

$TabControl.TabPages.Add($tabSettings) 

$RandomizerMain.Controls.Add($TabControl)

$RandomizerMain.showdialog()