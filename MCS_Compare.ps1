asnp Citrix.* -ErrorAction SilentlyContinue

$DDCs = @(
    "vwesppcdel22.esp.intra"
    # Ajouter les autres DDC ici
)

foreach ($DDC in $DDCs) {
    Write-Host "`n===== $DDC =====" -ForegroundColor Cyan

    try {
        Get-ProvServiceStatus -AdminAddress $DDC
        Get-ProvDBConnection -AdminAddress $DDC
    }
    catch {
        Write-Warning $_.Exception.Message
    }
}
