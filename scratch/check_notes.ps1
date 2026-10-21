$raw = Get-Content 'js/mace-notes-data.js' -Raw
$idx = $raw.IndexOf('[')
$lastIdx = $raw.LastIndexOf(']')
$json = $raw.Substring($idx, $lastIdx - $idx + 1)
$data = $json | ConvertFrom-Json
Write-Host "Total: $($data.Count)"
$data | Group-Object sem | Select-Object Name, Count | Format-Table -AutoSize
Write-Host "--- Breakdown by Sem and Dept ---"
$data | Group-Object { "$($_.sem) - $($_.dept)" } | Select-Object Name, Count | Sort-Object Name | Format-Table -AutoSize
