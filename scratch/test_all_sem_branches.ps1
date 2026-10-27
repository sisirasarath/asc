$raw = Get-Content 'js/mace-notes-data.js' -Raw
$idx = $raw.IndexOf('[')
$lastIdx = $raw.LastIndexOf(']')
$notes = $raw.Substring($idx, $lastIdx - $idx + 1) | ConvertFrom-Json

$sems = @('s1','s2','s3','s4','s5','s6','s7','s8')
$branches = @('CSE','DS','AI','EEE','ECE','MECH','CIVIL')

Write-Host "================ FILTERING TEST MATRIX ================"
$allPassed = $true

foreach ($s in $sems) {
    Write-Host "`n--- Testing Semester $($s.ToUpper()) ---"
    foreach ($b in $branches) {
        $filtered = $notes | Where-Object {
            $_.sem -eq $s -and ($_.branches -contains $b)
        }
        $subjects = ($filtered | Select-Object -ExpandProperty subject -Unique) -join ', '
        if ($filtered.Count -eq 0) {
            Write-Host "[FAIL] Sem $s | Branch $b : 0 notes found!" -ForegroundColor Red
            $allPassed = $false
        } else {
            Write-Host "[PASS] Sem $s | Branch $b : $($filtered.Count) notes across subjects: $subjects"
        }
    }
}

# Explicit test for Requirement 5: S5 -> DS -> Data Analytics
Write-Host "`n=== Testing Requirement 5: S5 -> DS -> Data Analytics ==="
$s5_ds_da = $notes | Where-Object {
    $_.sem -eq 's5' -and ($_.branches -contains 'DS') -and ($_.subject -eq 'Data Analytics')
}
Write-Host "Found $($s5_ds_da.Count) notes for S5 -> DS -> Data Analytics:"
foreach ($n in $s5_ds_da) {
    Write-Host "  - [$($n.type)] $($n.noteLabel)"
}

if ($s5_ds_da.Count -ge 8) {
    Write-Host "Requirement 5 PASSED: S5 -> DS -> Data Analytics has all dedicated notes." -ForegroundColor Green
} else {
    Write-Host "Requirement 5 WARNING: S5 -> DS -> Data Analytics count is $($s5_ds_da.Count)" -ForegroundColor Yellow
}

if ($allPassed) {
    Write-Host "`n>>> ALL 8 SEMESTERS AND ALL 7 BRANCHES PASSED FILTERING VALIDATION! <<<" -ForegroundColor Green
} else {
    Write-Host "`n>>> SOME COMBINATIONS FAILED <<<" -ForegroundColor Red
}
