Add-Type -assembly System.Windows.Forms

$RandomizerMain = New-Object System.Windows.Forms.Form
#$RandomizerMain.Size = New-Object System.Drawing.Size(610,360)
$RandomizerMain.AutoSize = $true
$RandomizerMain.Text ='Numenera Randomizer'


$TabControl = New-Object System.Windows.Forms.TabControl
$TabControl.Location = New-Object System.Drawing.Size(0,0)
#$TabControl.Size = New-Object System.Drawing.Size(450,130)
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


$RandomizerMain.Controls.Add($TabControl)