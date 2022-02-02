$PublicPath = Join-Path -Path $PSScriptRoot -ChildPath "\public\"
$Public = @( Get-ChildItem -Path ($PublicPath + "*.ps1") -ErrorAction SilentlyContinue )

foreach ($Import in @($Public)) {
    try {
        . $Import.FullName
    } catch {
        Write-Error -Message "Failed to import function $($Import.FullName): $_"
    }
}