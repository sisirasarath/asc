$raw = Get-Content 'js/mace-notes-data.js' -Raw
$idx = $raw.IndexOf('[')
$lastIdx = $raw.LastIndexOf(']')
$data = $raw.Substring($idx, $lastIdx - $idx + 1) | ConvertFrom-Json

Write-Host "Unique branch values:"
$data | Group-Object branch | Select-Object Name, Count | Format-Table

Write-Host "Sample where branch is single character:"
$data | Where-Object { $_.branch.Length -eq 1 } | Select-Object -First 5 | Select-Object sem, branch, branches, subject, title | Format-List
