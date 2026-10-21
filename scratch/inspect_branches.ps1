$raw = Get-Content 'js/mace-notes-data.js' -Raw
$idx = $raw.IndexOf('[')
$lastIdx = $raw.LastIndexOf(']')
$json = $raw.Substring($idx, $lastIdx - $idx + 1)
$data = $json | ConvertFrom-Json

Write-Host "Total notes count: $($data.Count)"
$depts = $data | Group-Object dept | Select-Object Name, Count
Write-Host "Departments in data:"
$depts | Format-Table -AutoSize

Write-Host "Sample titles by department:"
foreach ($d in $depts) {
    $sample = ($data | Where-Object { $_.dept -eq $d.Name } | Select-Object -First 3).title -join " | "
    Write-Host "Dept $($d.Name): $sample"
}
