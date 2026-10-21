$raw = Get-Content 'js/mace-notes-data.js' -Raw
$idx = $raw.IndexOf('[')
$lastIdx = $raw.LastIndexOf(']')
$json = $raw.Substring($idx, $lastIdx - $idx + 1)
$data = $json | ConvertFrom-Json

$sems = @('s1', 's2', 's3', 's4', 's5', 's6', 's7', 's8')
$branches = @('CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL')

foreach ($s in $sems) {
    Write-Host "=== Semester $s ==="
    $semNotes = $data | Where-Object { $_.sem -eq $s }
    Write-Host "  Total in $s : $($semNotes.Count)"
    foreach ($b in $branches) {
        $bNotes = $semNotes | Where-Object { $_.branches -contains $b }
        $subjCount = ($bNotes | Select-Object -ExpandProperty subject -Unique).Count
        Write-Host "  [$b]: $($bNotes.Count) notes ($subjCount subjects)"
    }
}
