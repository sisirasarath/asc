$raw = Get-Content 'js/mace-notes-data.js' -Raw
$idx = $raw.IndexOf('[')
$lastIdx = $raw.LastIndexOf(']')
$json = $raw.Substring($idx, $lastIdx - $idx + 1)
$data = $json | ConvertFrom-Json
$s5 = $data | Where-Object { $_.sem -eq 's5' }
Write-Host "Total S5 notes: $($s5.Count)"
$s5 | Group-Object branch | Select-Object Name, Count | Format-Table
$s5 | Where-Object { $_.branch -eq 'DS' -or ($_.branches -contains 'DS') } | Select-Object subject, noteLabel, module, type | Format-Table
