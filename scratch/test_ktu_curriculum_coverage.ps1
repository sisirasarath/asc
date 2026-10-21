$raw = Get-Content 'js/ktu-2024-curriculum-data.js' -Raw
$idx = $raw.IndexOf('[')
$lastIdx = $raw.LastIndexOf(']')
$data = $raw.Substring($idx, $lastIdx - $idx + 1) | ConvertFrom-Json

Write-Host "Total Courses in KTU 2024 Database: $($data.Count)"

$sems = @('s1','s2','s3','s4','s5','s6','s7','s8')
$branches = @('CSE','DS','AI','ECE','EEE','MECH','CIVIL')

$missing = @()

foreach ($s in $sems) {
    Write-Host "`n--- Semester $($s.ToUpper()) ---"
    foreach ($b in $branches) {
        $courses = $data | Where-Object {
            $_.sem -eq $s -and ($_.branches -contains $b)
        }
        if ($courses.Count -eq 0) {
            Write-Host "[MISSING] Sem: $s | Branch: $b" -ForegroundColor Red
            $missing += "$s-$b"
        } else {
            $titles = ($courses | ForEach-Object { "$($_.code): $($_.title)" }) -join " ; "
            Write-Host "[OK] Sem: $s | Branch: $b ($($courses.Count) courses) -> $titles" -ForegroundColor Green
        }
    }
}

Write-Host "`n================ SUMMARY ================"
if ($missing.Count -eq 0) {
    Write-Host "ALL 56 COMBINATIONS (8 SEMESTERS x 7 BRANCHES) ARE FULLY COVERED!" -ForegroundColor Green
} else {
    Write-Host "Missing combinations count: $($missing.Count)" -ForegroundColor Yellow
}
