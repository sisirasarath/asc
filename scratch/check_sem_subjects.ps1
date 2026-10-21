$raw = Get-Content 'js/mace-notes-data.js' -Raw
$idx = $raw.IndexOf('[')
$lastIdx = $raw.LastIndexOf(']')
$json = $raw.Substring($idx, $lastIdx - $idx + 1)
$data = $json | ConvertFrom-Json

Write-Host "Total notes: $($data.Count)"
$sems = $data | Group-Object sem | Select-Object Name, Count
Write-Host "Semesters:"
$sems | Format-Table -AutoSize

Write-Host "Sample of titles and depts across semesters:"
foreach ($s in $sems) {
    $first3 = ($data | Where-Object { $_.sem -eq $s.Name } | Select-Object -First 2)
    foreach ($item in $first3) {
        Write-Host "Sem: $($item.sem) | Dept: $($item.dept) | Subj: $($item.subject) | Title: $($item.title)"
    }
}
