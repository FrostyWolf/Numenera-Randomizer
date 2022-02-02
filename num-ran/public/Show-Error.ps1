Function Show-Error {
    param(
        [string]$Err
    )
    Add-Type -assembly System.Windows.Forms

    $ErrorForm = New-Object System.Windows.Forms.Form
    $ErrorForm.Size = New-Object System.Drawing.Size(0,0)
    $ErrorForm.AutoSize = $true
    $ErrorForm.Text = 'Error'

    #Error Message
    $LabelError = New-Object System.Windows.Forms.Label
    $LabelError.text = $Err
    $LabelError.Location = New-Object System.Drawing.Point(0, 10)
    $LabelError.AutoSize = $true
    $ErrorForm.Controls.Add($LabelError)

    $ErrorForm.ShowDialog()
}