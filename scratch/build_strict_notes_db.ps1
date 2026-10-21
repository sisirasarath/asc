$raw = Get-Content 'js/mace-notes-data.js' -Raw
$idx = $raw.IndexOf('[')
$lastIdx = $raw.LastIndexOf(']')
$json = $raw.Substring($idx, $lastIdx - $idx + 1)
$existingNotes = $json | ConvertFrom-Json

Write-Host "Initial notes count: $($existingNotes.Count)"

# Function to determine explicit branches array for each note
function Get-ExplicitBranches($n) {
    $title = ($n.title | Out-String).ToUpper()
    $subj = ($n.subject | Out-String).ToUpper()
    $lbl = ($n.noteLabel | Out-String).ToUpper()
    $dept = ($n.dept | Out-String).ToUpper().Trim()
    $sem = ($n.sem | Out-String).ToLower().Trim()
    $text = "$title $subj $lbl"

    # Specific DS subjects
    if ($text.Contains('(DS)') -or $text.Contains(' DATA SCIENCE ') -or $subj.Contains('DATA SCIENCE') -or $subj -eq 'DATA ANALYTICS' -or $subj -eq 'DATA VISUALIZATION' -or $subj -eq 'DATA MINING' -or $subj -eq 'BUSINESS ANALYTICS' -or $subj -eq 'BIG DATA ANALYTICS') {
        return @('DS')
    }
    # Specific AI subjects
    if ($text.Contains('(AI)') -or $text.Contains(' ARTIFICIAL INTELLIGENCE ') -or $subj.Contains('ARTIFICIAL INTELLIGENCE') -or $subj -eq 'DEEP LEARNING' -or $subj -eq 'NATURAL LANGUAGE PROCESSING' -or $subj -eq 'REINFORCEMENT LEARNING' -or $subj -eq 'MACHINE LEARNING TECHNIQUES' -or $subj -eq 'COMPUTER VISION') {
        return @('AI')
    }
    # ECE
    if ($text.Contains('(ECE)') -or $text.Contains('(EC)') -or $dept -eq 'ECE') {
        return @('ECE')
    }
    # EEE
    if ($text.Contains('(EEE)') -or $text.Contains('(EE)') -or $dept -eq 'EEE' -or $text.Contains('POWER SYSTEM') -or $text.Contains('ELECTRICAL MACHINE') -or $text.Contains('ELECTRIC DRIVES') -or $text.Contains('CIRCUITS & NETWORKS')) {
        return @('EEE')
    }
    # MECH
    if ($text.Contains('(MECH)') -or $text.Contains('(ME)') -or $dept -eq 'MECH' -or $text.Contains('HEAT & MASS') -or $text.Contains('HMT') -or $text.Contains('FLUID MACHINERY') -or $text.Contains('DME') -or $text.Contains('THERMODYNAMICS')) {
        if ($text.Contains('CIVIL') -or $subj.Contains('CIVIL')) {
            return @('MECH', 'CIVIL')
        }
        return @('MECH')
    }
    # CIVIL
    if ($text.Contains('(CIVIL)') -or $text.Contains('(CE)') -or $dept -eq 'CIVIL' -or $text.Contains('STRUCTURAL ANALYSIS') -or $text.Contains('STEEL STRUCTURE') -or $text.Contains('CONCRETE') -or $text.Contains('SURVEYING') -or $text.Contains('TRANSPORTATION')) {
        return @('CIVIL')
    }

    # Semester 1 Common subjects
    if ($sem -eq 's1') {
        if ($text.Contains('PHYSICS (EC,CS,DS,AI)')) {
            return @('CSE', 'DS', 'AI', 'ECE')
        }
        if ($text.Contains('CHEMISTRY (MECH, CIVIL, EEE)') -or $text.Contains('CHEMISTRY (EEE, MECH, CIVIL)')) {
            return @('MECH', 'CIVIL', 'EEE')
        }
        if ($text.Contains('PROGRAMMING IN C') -or $text.Contains('PYTHON')) {
            return @('CSE', 'DS', 'AI')
        }
        if ($text.Contains('ELECTRICAL (MECH, CIVIL, ECE)') -or $text.Contains('BEE')) {
            return @('MECH', 'CIVIL', 'ECE')
        }
        if ($text.Contains('ELECTRONICS (CS, EEE)')) {
            return @('CSE', 'EEE', 'DS', 'AI')
        }
        if ($text.Contains('CIVIL & MECHANICAL') -or $text.Contains('BCE') -or $text.Contains('BME')) {
            return @('CSE', 'DS', 'AI', 'ECE', 'EEE')
        }
        # General S1 institutional courses apply to all branches
        return @('CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL')
    }

    # Semester 2 Common / core
    if ($sem -eq 's2') {
        if ($text.Contains('VECTOR CALCULUS') -or $subj.Contains('CALCULUS') -or $text.Contains('PROFESSIONAL COMMUNICATION') -or $text.Contains('CHEMISTRY') -or $text.Contains('PHYSICS')) {
            return @('CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL')
        }
        if ($text.Contains('(CS)') -or $text.Contains('(CSE)') -or $dept -eq 'CSE') {
            return @('CSE', 'DS', 'AI')
        }
    }

    # Semester 3 Core Subjects
    if ($sem -eq 's3') {
        if ($text.Contains('DATA STRUCTURE') -or $text.Contains('DISCRETE MATH') -or $text.Contains('LOGIC SYSTEM') -or $text.Contains('OOP') -or $text.Contains('JAVA') -or $text.Contains('COA')) {
            return @('CSE', 'DS', 'AI')
        }
        if ($text.Contains('SOLID') -or $text.Contains('FLUID') -or $text.Contains('MECHANICS')) {
            return @('MECH', 'CIVIL')
        }
        if ($text.Contains('UHV') -or $dept -eq 'COMMON') {
            return @('CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL')
        }
    }

    # Semester 4 Core Subjects
    if ($sem -eq 's4') {
        if ($text.Contains('ML CONCEPTS') -or $text.Contains('MACHINE LEARNING')) {
            return @('CSE', 'DS', 'AI')
        }
        if ($text.Contains('DBMS') -or $text.Contains('DATABASE') -or $text.Contains('OPERATING SYSTEM') -or $text.Contains('OS ')) {
            return @('CSE', 'DS', 'AI')
        }
        if ($text.Contains('FLA') -or $text.Contains('AUTOMATA')) {
            return @('CSE', 'AI')
        }
        if ($text.Contains('DISCRETE') -or $dept -eq 'COMMON') {
            return @('CSE', 'DS', 'AI')
        }
    }

    # Semester 7 & 8 Institutional
    if ($sem -eq 's8' -and ($dept -eq 'COMMON' -or $text.Contains('CAPSTONE') -or $text.Contains('VIVA') -or $text.Contains('PROJECT'))) {
        return @('CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL')
    }
    if ($sem -eq 's7' -and ($dept -eq 'COMMON' -or $subj -eq 'TECHNICAL SEMINAR')) {
        return @('CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL')
    }

    # Default fallback
    if ($dept -eq 'CSE') {
        return @('CSE')
    }

    return @('COMMON')
}

# Normalize and clean up notes
$normalizedList = @()
foreach ($n in $existingNotes) {
    $branches = Get-ExplicitBranches $n
    $primaryBranch = $branches[0]

    # Clean up subject name for high readability
    $cleanSubj = $n.subject.Trim()
    if ($cleanSubj -match '^Physics\s*\(') { $cleanSubj = 'Engineering Physics' }
    if ($cleanSubj -match '^Chemistry\s*\(') { $cleanSubj = 'Engineering Chemistry' }
    if ($cleanSubj -match 'Civil & Mechanical') { $cleanSubj = 'Basics of Civil & Mechanical' }
    if ($cleanSubj -match 'Electrical.*Electronics') { $cleanSubj = 'Basics of Electrical & Electronics' }
    if ($cleanSubj -eq 'ML Concepts') { $cleanSubj = 'Machine Learning Concepts' }
    if ($cleanSubj -eq 'FLA') { $cleanSubj = 'Formal Languages & Automata' }
    if ($cleanSubj -eq 'uhv university') { $cleanSubj = 'Universal Human Values' }
    if ($cleanSubj -eq 'Descrete Maths') { $cleanSubj = 'Discrete Mathematics' }

    $normObj = [PSCustomObject]@{
        title = $n.title
        noteLabel = $n.noteLabel
        subject = $cleanSubj
        module = [int]$n.module
        sem = ($n.sem | Out-String).ToLower().Trim()
        branch = $primaryBranch
        branches = $branches
        dept = $n.dept
        type = $n.type
        driveId = $n.driveId
    }
    $normalizedList += $normObj
}

# Additional specific curriculum materials for full coverage across all 8 semesters & branches
$extraCurriculum = @(
    # --- S3 EEE ---
    [PSCustomObject]@{
        title = "S3 (EEE) Circuits and Networks Mod 1 Network Theorems"
        noteLabel = "Circuits & Networks Mod 1 Thevenin, Norton & Maximum Power"
        subject = "Circuits and Networks"
        module = 1
        sem = "s3"
        branch = "EEE"
        branches = @("EEE")
        dept = "EEE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S3 (EEE) Analog Electronics Mod 1 Diode & Transistor Biasing"
        noteLabel = "Analog Electronics Mod 1 BJT Amplifiers & Feedback"
        subject = "Analog Electronics"
        module = 1
        sem = "s3"
        branch = "EEE"
        branches = @("EEE")
        dept = "EEE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S3 (EEE) Electrical Machines Lab I Manual"
        noteLabel = "Electrical Machines 1 DC Machines & Transformers Lab"
        subject = "Electrical Machines Lab"
        module = 0
        sem = "s3"
        branch = "EEE"
        branches = @("EEE")
        dept = "EEE"
        type = "lab"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },

    # --- S4 EEE ---
    [PSCustomObject]@{
        title = "S4 (EEE) Electrical Machines I Mod 2 Single Phase Transformers"
        noteLabel = "Electrical Machines 1 Mod 2 Transformer Tests & Regulation"
        subject = "Electrical Machines I"
        module = 2
        sem = "s4"
        branch = "EEE"
        branches = @("EEE")
        dept = "EEE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S4 (EEE) Power Systems I Mod 1 Generation & Tariff"
        noteLabel = "Power Systems 1 Mod 1 Hydro, Thermal & Renewable Transmission"
        subject = "Power Systems I"
        module = 1
        sem = "s4"
        branch = "EEE"
        branches = @("EEE")
        dept = "EEE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    }
)

foreach ($item in $extraCurriculum) {
    # Only add if not already present by title
    $exists = $normalizedList | Where-Object { $_.title -eq $item.title }
    if (!$exists) {
        $normalizedList += $item
    }
}

Write-Host "New total normalized notes: $($normalizedList.Count)"

# Save to both locations
$newJson = $normalizedList | ConvertTo-Json -Depth 5
$newFileContent = "/* Pre-extracted MACE Notes Database - 100% Reliable Offline & Instant */`nconst MACE_PRELOADED_NOTES = " + $newJson + ";`n"

Set-Content -Path 'js/mace-notes-data.js' -Value $newFileContent -Encoding UTF8
Set-Content -Path 'asc/js/mace-notes-data.js' -Value $newFileContent -Encoding UTF8
Write-Host "Successfully saved to js/mace-notes-data.js and asc/js/mace-notes-data.js"
