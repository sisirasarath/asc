$raw = Get-Content 'js/database.json' -Raw | ConvertFrom-Json
Write-Host "database.json keys: $($raw.psobject.properties.name -join ', ')"
if ($raw.academics) {
    Write-Host "academics keys: $($raw.academics.psobject.properties.name -join ', ')"
}
