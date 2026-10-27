$raw = Get-Content 'js/mace-notes-data.js' -Raw
$idx = $raw.IndexOf('[')
$lastIdx = $raw.LastIndexOf(']')
$json = $raw.Substring($idx, $lastIdx - $idx + 1)
$data = $json | ConvertFrom-Json

function matchesBranch($n, $b) {
    if (!$b -or $b -eq 'ALL') { return $true }
    $b = $b.ToUpper()
    $title = ($n.title | Out-String).ToUpper()
    $subj = ($n.subject | Out-String).ToUpper()
    $lbl = ($n.noteLabel | Out-String).ToUpper()
    $dept = ($n.dept | Out-String).ToUpper().Trim()
    $sem = ($n.sem | Out-String).ToLower().Trim()
    $text = "$title $subj $lbl"

    if ($dept -eq 'COMMON' -and $sem -ne 's1' -and $sem -ne 's2') {
        return $true
    }

    if ($b -eq 'CS' -or $b -eq 'CSE') {
        if ($dept -eq 'CSE' -or $text.Contains('CS ') -or $text.Contains('(CS') -or $text.Contains('CSE') -or $text.Contains('PYTHON') -or $text.Contains('C PROG') -or $text.Contains('PSPT')) { return $true }
        if (($sem -eq 's1' -or $sem -eq 's2') -and $dept -eq 'COMMON') {
            if ($text.Contains('(MECH)') -or $text.Contains('(CIVIL)') -or $text.Contains('(EEE)') -or $text.Contains('(EC)')) { return $false }
            return $true
        }
        return $false
    }
    if ($b -eq 'AI') {
        if ($text.Contains('AI') -or $text.Contains('ARTIFICIAL') -or $text.Contains('MACHINE LEARN') -or $text.Contains('ML ') -or $text.Contains('PYTHON') -or $text.Contains('DEEP LEARN') -or $text.Contains('NLP')) { return $true }
        if ($dept -eq 'CSE' -and ($text.Contains('DATA') -or $text.Contains('ALGO') -or $text.Contains('DBMS') -or $text.Contains('FLA'))) { return $true }
        if (($sem -eq 's1' -or $sem -eq 's2') -and $dept -eq 'COMMON') {
            if ($text.Contains('(MECH)') -or $text.Contains('(CIVIL)') -or $text.Contains('(EEE)') -or $text.Contains('(EC)')) { return $false }
            return $true
        }
        return $false
    }
    if ($b -eq 'DS') {
        if ($text.Contains('DS') -or $text.Contains('DATA SCIENCE') -or $text.Contains('DATA STRUCT') -or $text.Contains('DBMS') -or $text.Contains('PYTHON') -or $text.Contains('ANALYTICS')) { return $true }
        if ($dept -eq 'CSE' -and ($text.Contains('ML') -or $text.Contains('ALGO') -or $text.Contains('DATABASE'))) { return $true }
        if (($sem -eq 's1' -or $sem -eq 's2') -and $dept -eq 'COMMON') {
            if ($text.Contains('(MECH)') -or $text.Contains('(CIVIL)') -or $text.Contains('(EEE)') -or $text.Contains('(EC)')) { return $false }
            return $true
        }
        return $false
    }
    if ($b -eq 'EC' -or $b -eq 'ECE') {
        if ($dept -eq 'ECE' -or $text.Contains('ECE') -or $text.Contains('EC ') -or $text.Contains('(EC') -or $text.Contains('ELECTRONIC') -or $text.Contains('BLE') -or $text.Contains('LSD') -or $text.Contains('LIC') -or $text.Contains('LCD') -or $text.Contains('DSP') -or $text.Contains('VLSI')) { return $true }
        if (($sem -eq 's1' -or $sem -eq 's2') -and $dept -eq 'COMMON') {
            if ($text.Contains('(MECH)') -or $text.Contains('(CIVIL)') -or $text.Contains('PSPT') -or $text.Contains('PYTHON')) { return $false }
            return $true
        }
        return $false
    }
    if ($b -eq 'EEE') {
        if ($dept -eq 'EEE' -or $text.Contains('EEE') -or $text.Contains('EE ') -or $text.Contains('(EE') -or $text.Contains('ELECTRICAL') -or $text.Contains('BEE') -or $text.Contains('POWER') -or $text.Contains('CIRCUIT') -or $text.Contains('IEE')) { return $true }
        if (($sem -eq 's1' -or $sem -eq 's2') -and $dept -eq 'COMMON') {
            if ($text.Contains('(MECH)') -or $text.Contains('(CIVIL)') -or $text.Contains('PSPT') -or $text.Contains('PYTHON')) { return $false }
            return $true
        }
        return $false
    }
    if ($b -eq 'ME' -or $b -eq 'MECH') {
        if ($dept -eq 'MECH' -or $text.Contains('MECH') -or $text.Contains('(ME') -or $text.Contains('BME') -or $text.Contains('DME') -or $text.Contains('FLUID') -or $text.Contains('HEAT') -or $text.Contains('THERMAL') -or $text.Contains('MACHINE')) { return $true }
        if (($sem -eq 's1' -or $sem -eq 's2') -and $dept -eq 'COMMON') {
            if ($text.Contains('ELECTRONICS (CS)') -or $text.Contains('PSPT') -or $text.Contains('PYTHON') -or $text.Contains('(EEE)')) { return $false }
            return $true
        }
        return $false
    }
    if ($b -eq 'CE' -or $b -eq 'CIVIL') {
        if ($dept -eq 'CIVIL' -or $text.Contains('CIVIL') -or $text.Contains('(CE') -or $text.Contains('BCE') -or $text.Contains('STRUCTUR') -or $text.Contains('CONCRETE') -or $text.Contains('SURVEY') -or $text.Contains('DISASTER') -or $text.Contains('ENVIRONMENT')) { return $true }
        if (($sem -eq 's1' -or $sem -eq 's2') -and $dept -eq 'COMMON') {
            if ($text.Contains('ELECTRONICS (CS)') -or $text.Contains('PSPT') -or $text.Contains('PYTHON') -or $text.Contains('(EEE)')) { return $false }
            return $true
        }
        return $false
    }
    return $true
}

$branches = @('ALL','CS','AI','DS','EC','EEE','ME','CE')
$sems = @('s1','s2','s3','s4','s5','s6','s7','s8')

foreach ($s in $sems) {
    Write-Host "=== $s ==="
    $semNotes = $data | Where-Object { $_.sem -eq $s }
    foreach ($b in $branches) {
        $c = ($semNotes | Where-Object { matchesBranch $_ $b }).Count
        Write-Host "  $($b): $($c)"
    }
}
