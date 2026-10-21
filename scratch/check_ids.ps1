$html = Get-Content 'scratch/rendered_notes.html' -Raw
$matches = [regex]::Matches($html, 'id="([^"]+)"')
Write-Host "Total IDs matched: $($matches.Count)"
foreach ($m in ($matches | Select-Object -First 30)) {
    Write-Host $m.Groups[1].Value
}
