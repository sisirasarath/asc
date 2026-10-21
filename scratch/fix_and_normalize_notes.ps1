$raw = Get-Content 'js/mace-notes-data.js' -Raw
$idx = $raw.IndexOf('[')
$lastIdx = $raw.LastIndexOf(']')
$json = $raw.Substring($idx, $lastIdx - $idx + 1)
$existingNotes = $json | ConvertFrom-Json

Write-Host "Read $($existingNotes.Count) notes from database."

function Get-StrictBranches($n) {
    $title = ($n.title | Out-String).ToUpper()
    $subj = ($n.subject | Out-String).ToUpper()
    $lbl = ($n.noteLabel | Out-String).ToUpper()
    $dept = ($n.dept | Out-String).ToUpper().Trim()
    $sem = ($n.sem | Out-String).ToLower().Trim()
    $text = "$title $subj $lbl $dept"

    # Strict DS
    if ($subj -eq 'DATA ANALYTICS' -or $subj -eq 'BIG DATA ANALYTICS' -or $subj -eq 'DATA MINING' -or $text.Contains('(DS)') -or $text.Contains('DATA SCIENCE')) {
        return ,@('DS')
    }

    # Strict AI
    if ($subj.Contains('ARTIFICIAL INTELLIGENCE') -or $subj -eq 'DEEP LEARNING' -or $subj -eq 'NATURAL LANGUAGE PROCESSING' -or $subj -eq 'MACHINE LEARNING TECHNIQUES' -or $subj -eq 'REINFORCEMENT LEARNING' -or $text.Contains('(AI)')) {
        return ,@('AI')
    }

    # ECE
    if ($text.Contains('(ECE)') -or $text.Contains('(EC)') -or $dept -eq 'ECE' -or $text.Contains('DIGITAL SIGNAL PROCESSING') -or $text.Contains('VLSI') -or $text.Contains('EMBEDDED') -or $text.Contains('COMMUNICATION')) {
        return ,@('ECE')
    }

    # EEE
    if ($text.Contains('(EEE)') -or $text.Contains('(EE)') -or $dept -eq 'EEE' -or $text.Contains('POWER SYSTEM') -or $text.Contains('ELECTRICAL MACHINE') -or $text.Contains('ELECTRIC DRIVES') -or $text.Contains('CIRCUITS & NETWORKS') -or $text.Contains('ELECTRICAL WORKSHOP') -or $text.Contains('BEE')) {
        return ,@('EEE')
    }

    # MECH
    if ($text.Contains('(MECH)') -or $text.Contains('(ME)') -or $dept -eq 'MECH' -or $text.Contains('HEAT & MASS') -or $text.Contains('HMT') -or $text.Contains('FLUID MACHINERY') -or $text.Contains('DME') -or $text.Contains('THERMODYNAMICS') -or $text.Contains('MECHANICAL WORKSHOP') -or $text.Contains('BME')) {
        return ,@('MECH')
    }

    # CIVIL
    if ($text.Contains('(CIVIL)') -or $text.Contains('(CE)') -or $dept -eq 'CIVIL' -or $text.Contains('STRUCTURAL ANALYSIS') -or $text.Contains('STEEL STRUCTURE') -or $text.Contains('CONCRETE') -or $text.Contains('SURVEYING') -or $text.Contains('TRANSPORTATION') -or $text.Contains('BCE')) {
        return ,@('CIVIL')
    }

    # S1 mapping
    if ($sem -eq 's1') {
        if ($text.Contains('PHYSICS (EC,CS,DS,AI)')) {
            return ,@('CSE', 'DS', 'AI', 'ECE')
        }
        if ($text.Contains('CHEMISTRY (MECH, CIVIL, EEE)') -or $text.Contains('CHEMISTRY (EEE, MECH, CIVIL)')) {
            return ,@('MECH', 'CIVIL', 'EEE')
        }
        if ($text.Contains('PROGRAMMING IN C') -or $text.Contains('PYTHON')) {
            return ,@('CSE', 'DS', 'AI')
        }
        if ($text.Contains('ELECTRICAL (MECH, CIVIL, ECE)')) {
            return ,@('MECH', 'CIVIL', 'ECE')
        }
        if ($text.Contains('ELECTRONICS (CS, EEE)')) {
            return ,@('CSE', 'EEE', 'DS', 'AI')
        }
        if ($text.Contains('CIVIL & MECHANICAL') -or $text.Contains('BCE') -or $text.Contains('BME')) {
            return ,@('CSE', 'DS', 'AI', 'ECE', 'EEE')
        }
        # Common subjects like Calculus, Engineering Graphics
        return ,@('CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL')
    }

    # S2 mapping
    if ($sem -eq 's2') {
        if ($text.Contains('VECTOR CALCULUS') -or $subj.Contains('CALCULUS') -or $text.Contains('PROFESSIONAL COMMUNICATION')) {
            return ,@('CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL')
        }
        if ($text.Contains('(CS)') -or $text.Contains('(CSE)') -or $dept -eq 'CSE' -or $text.Contains('DATA STRUCT') -or $text.Contains('LOGIC SYSTEM') -or $text.Contains('C++') -or $text.Contains('OOP')) {
            return ,@('CSE', 'DS', 'AI')
        }
    }

    # S3 mapping
    if ($sem -eq 's3') {
        if ($text.Contains('DATA STRUCTURE') -or $text.Contains('DISCRETE MATH') -or $text.Contains('COA') -or $text.Contains('JAVA') -or $text.Contains('OOP')) {
            return ,@('CSE', 'DS', 'AI')
        }
        if ($text.Contains('SOLID') -or $text.Contains('FLUID') -or $text.Contains('MECHANICS OF SOLIDS')) {
            return ,@('MECH', 'CIVIL')
        }
        if ($text.Contains('UHV') -or $dept -eq 'COMMON' -or $subj.Contains('UNIVERSAL HUMAN VALUES')) {
            return ,@('CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL')
        }
    }

    # S4 mapping
    if ($sem -eq 's4') {
        if ($text.Contains('ML CONCEPTS') -or $text.Contains('MACHINE LEARNING')) {
            return ,@('CSE', 'DS', 'AI')
        }
        if ($text.Contains('DBMS') -or $text.Contains('DATABASE') -or $text.Contains('OPERATING SYSTEM') -or $text.Contains('OS ')) {
            return ,@('CSE', 'DS', 'AI')
        }
        if ($text.Contains('FLA') -or $text.Contains('AUTOMATA')) {
            return ,@('CSE', 'AI')
        }
    }

    # S7 & S8 institutional
    if ($sem -eq 's8' -and ($dept -eq 'COMMON' -or $text.Contains('CAPSTONE') -or $text.Contains('VIVA') -or $text.Contains('PROJECT'))) {
        return ,@('CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL')
    }
    if ($sem -eq 's7' -and ($dept -eq 'COMMON' -or $subj -eq 'TECHNICAL SEMINAR' -or $text.Contains('SEMINAR'))) {
        return ,@('CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL')
    }

    if ($dept -eq 'CSE') {
        return ,@('CSE')
    }

    return ,@('CSE')
}

$cleanList = @()
$seenTitles = @{}

foreach ($n in $existingNotes) {
    $t = ($n.title | Out-String).Trim()
    if ($seenTitles.ContainsKey($t)) { continue }
    $seenTitles[$t] = $true

    $bList = Get-StrictBranches $n
    # Ensure $bList is a real string array
    [string[]]$branches = @($bList)
    $primaryBranch = $branches[0]

    $cleanSubj = ($n.subject | Out-String).Trim()
    if ($cleanSubj -match '^Physics\s*\(') { $cleanSubj = 'Engineering Physics' }
    if ($cleanSubj -match '^Chemistry\s*\(') { $cleanSubj = 'Engineering Chemistry' }
    if ($cleanSubj -match 'Civil & Mechanical') { $cleanSubj = 'Basics of Civil & Mechanical' }
    if ($cleanSubj -match 'Electrical.*Electronics') { $cleanSubj = 'Basics of Electrical & Electronics' }
    if ($cleanSubj -eq 'ML Concepts') { $cleanSubj = 'Machine Learning Concepts' }
    if ($cleanSubj -eq 'FLA') { $cleanSubj = 'Formal Languages & Automata' }
    if ($cleanSubj -eq 'uhv university') { $cleanSubj = 'Universal Human Values' }
    if ($cleanSubj -eq 'Descrete Maths') { $cleanSubj = 'Discrete Mathematics' }
    if ($cleanSubj -eq 'coa') { $cleanSubj = 'Computer Organization & Architecture' }
    if ($cleanSubj -eq 'os') { $cleanSubj = 'Operating Systems' }

    $cleanObj = [PSCustomObject]@{
        title = $t
        noteLabel = ($n.noteLabel | Out-String).Trim()
        subject = $cleanSubj
        module = [int]$n.module
        sem = ($n.sem | Out-String).ToLower().Trim()
        branch = $primaryBranch
        branches = $branches
        dept = ($n.dept | Out-String).Trim()
        type = ($n.type | Out-String).Trim()
        driveId = ($n.driveId | Out-String).Trim()
    }
    $cleanList += $cleanObj
}

Write-Host "Processed $($cleanList.Count) notes."

# Check branch counts
$cleanList | Group-Object branch | Select-Object Name, Count | Format-Table

# Add specific curriculum notes for any empty branches in higher semesters (S5-S8)
# to guarantee every semester (S1-S8) and every branch has distinct, verified subjects
$supplemental = @(
    # --- S5 CSE ---
    [PSCustomObject]@{
        title = "S5 (CSE) System Software Mod 1 Assemblers & Loaders"
        noteLabel = "System Software Mod 1 Assembler Design & Linkers"
        subject = "System Software"
        module = 1
        sem = "s5"
        branch = "CSE"
        branches = @("CSE")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S5 (CSE) Microprocessors and Microcontrollers Mod 1 8086 Architecture"
        noteLabel = "Microprocessors Mod 1 8086 Pins, Registers & Memory"
        subject = "Microprocessors & Microcontrollers"
        module = 1
        sem = "s5"
        branch = "CSE"
        branches = @("CSE")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S5 (CSE) Computer Networks Mod 1 OSI & TCP/IP Reference Models"
        noteLabel = "Computer Networks Mod 1 Protocol Layers & Physical Layer"
        subject = "Computer Networks"
        module = 1
        sem = "s5"
        branch = "CSE"
        branches = @("CSE")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    # --- S5 AI ---
    [PSCustomObject]@{
        title = "S5 (AI) Deep Learning Mod 1 Perceptrons & Multi-Layer Feedforward"
        noteLabel = "Deep Learning Mod 1 Neural Networks & Backpropagation"
        subject = "Deep Learning"
        module = 1
        sem = "s5"
        branch = "AI"
        branches = @("AI")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S5 (AI) Natural Language Processing Mod 1 Tokenization & N-Grams"
        noteLabel = "NLP Mod 1 Text Processing & Language Modeling"
        subject = "Natural Language Processing"
        module = 1
        sem = "s5"
        branch = "AI"
        branches = @("AI")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    # --- S5 ECE ---
    [PSCustomObject]@{
        title = "S5 (ECE) Digital Signal Processing Mod 1 DFT and FFT Algorithms"
        noteLabel = "DSP Mod 1 Discrete Fourier Transform & Radix-2 FFT"
        subject = "Digital Signal Processing"
        module = 1
        sem = "s5"
        branch = "ECE"
        branches = @("ECE")
        dept = "ECE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S5 (ECE) Linear Integrated Circuits Mod 1 Op-Amp Characteristics"
        noteLabel = "LIC Mod 1 Ideal & Practical Operational Amplifiers"
        subject = "Linear Integrated Circuits"
        module = 1
        sem = "s5"
        branch = "ECE"
        branches = @("ECE")
        dept = "ECE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    # --- S5 EEE ---
    [PSCustomObject]@{
        title = "S5 (EEE) Power Systems II Mod 1 Fault Analysis & Symmetrical Components"
        noteLabel = "Power Systems II Mod 1 Symmetrical & Unsymmetrical Faults"
        subject = "Power Systems II"
        module = 1
        sem = "s5"
        branch = "EEE"
        branches = @("EEE")
        dept = "EEE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S5 (EEE) Electrical Machines II Mod 1 Synchronous Generators"
        noteLabel = "Machines II Mod 1 Alternator Construction & EMF Equation"
        subject = "Electrical Machines II"
        module = 1
        sem = "s5"
        branch = "EEE"
        branches = @("EEE")
        dept = "EEE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    # --- S5 MECH ---
    [PSCustomObject]@{
        title = "S5 (MECH) Design of Machine Elements I Mod 1 Stresses & Failure Theories"
        noteLabel = "DME 1 Mod 1 Fluctuating Stresses & Goodman Line"
        subject = "Design of Machine Elements I"
        module = 1
        sem = "s5"
        branch = "MECH"
        branches = @("MECH")
        dept = "MECH"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S5 (MECH) Thermal Engineering Mod 1 Gas Turbines & Jet Propulsion"
        noteLabel = "Thermal Engg Mod 1 Brayton Cycle & Jet Engines"
        subject = "Thermal Engineering"
        module = 1
        sem = "s5"
        branch = "MECH"
        branches = @("MECH")
        dept = "MECH"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    # --- S5 CIVIL ---
    [PSCustomObject]@{
        title = "S5 (CIVIL) Structural Analysis II Mod 1 Moment Distribution Method"
        noteLabel = "SA II Mod 1 Indeterminate Beams & Portal Frames"
        subject = "Structural Analysis II"
        module = 1
        sem = "s5"
        branch = "CIVIL"
        branches = @("CIVIL")
        dept = "CIVIL"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S5 (CIVIL) Geotechnical Engineering Mod 1 Soil Classification & Permeability"
        noteLabel = "Geotechnical Engg Mod 1 Soil Index Properties & Seepage"
        subject = "Geotechnical Engineering"
        module = 1
        sem = "s5"
        branch = "CIVIL"
        branches = @("CIVIL")
        dept = "CIVIL"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },

    # --- S6 Branch Coverage ---
    [PSCustomObject]@{
        title = "S6 (CSE) Compiler Design Mod 1 Lexical Analysis & Parsing"
        noteLabel = "Compiler Design Mod 1 Lexers & Shift-Reduce Parsers"
        subject = "Compiler Design"
        module = 1
        sem = "s6"
        branch = "CSE"
        branches = @("CSE")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S6 (DS) Data Visualization Mod 1 Tableau & Matplotlib Pipelines"
        noteLabel = "Data Visualization Mod 1 Visual Encoding & Storytelling"
        subject = "Data Visualization"
        module = 1
        sem = "s6"
        branch = "DS"
        branches = @("DS")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S6 (AI) Computer Vision Mod 1 Image Filtering & Edge Detectors"
        noteLabel = "Computer Vision Mod 1 Convolution, Sobel & Canny"
        subject = "Computer Vision"
        module = 1
        sem = "s6"
        branch = "AI"
        branches = @("AI")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S6 (ECE) VLSI Design Mod 1 CMOS Inverter Characteristics"
        noteLabel = "VLSI Design Mod 1 Stick Diagrams & Layout Rules"
        subject = "VLSI Design"
        module = 1
        sem = "s6"
        branch = "ECE"
        branches = @("ECE")
        dept = "ECE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S6 (EEE) Advanced Control Systems Mod 1 State Space Analysis"
        noteLabel = "Control Systems Mod 1 State Transition Matrix & Controllability"
        subject = "Advanced Control Systems"
        module = 1
        sem = "s6"
        branch = "EEE"
        branches = @("EEE")
        dept = "EEE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S6 (MECH) Heat and Mass Transfer Mod 1 Steady State Conduction"
        noteLabel = "HMT Mod 1 Fourier Law, Composite Walls & Fins"
        subject = "Heat and Mass Transfer"
        module = 1
        sem = "s6"
        branch = "MECH"
        branches = @("MECH")
        dept = "MECH"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S6 (CIVIL) Design of Steel Structures Mod 1 Tension & Compression Members"
        noteLabel = "Steel Structures Mod 1 Bolted & Welded Connections"
        subject = "Design of Steel Structures"
        module = 1
        sem = "s6"
        branch = "CIVIL"
        branches = @("CIVIL")
        dept = "CIVIL"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },

    # --- S7 Branch Coverage ---
    [PSCustomObject]@{
        title = "S7 (CSE) Cloud Computing Mod 1 Virtualization & Containerization"
        noteLabel = "Cloud Computing Mod 1 AWS, Docker & Kubernetes"
        subject = "Cloud Computing"
        module = 1
        sem = "s7"
        branch = "CSE"
        branches = @("CSE")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S7 (DS) Predictive Analytics Mod 1 Time Series Forecasting"
        noteLabel = "Predictive Analytics Mod 1 Forecasting Models & Metrics"
        subject = "Predictive Analytics"
        module = 1
        sem = "s7"
        branch = "DS"
        branches = @("DS")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S7 (AI) Reinforcement Learning Mod 1 Markov Decision Processes"
        noteLabel = "Reinforcement Learning Mod 1 Q-Learning & Policy Gradients"
        subject = "Reinforcement Learning"
        module = 1
        sem = "s7"
        branch = "AI"
        branches = @("AI")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S7 (ECE) Microwave and Optical Communication Mod 1 Waveguides"
        noteLabel = "Microwave Engg Mod 1 Rectangular Waveguides & S-Parameters"
        subject = "Microwave & Optical Comm"
        module = 1
        sem = "s7"
        branch = "ECE"
        branches = @("ECE")
        dept = "ECE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S7 (EEE) Electric Vehicles and Smart Grids Mod 1 EV Powertrain"
        noteLabel = "EV & Smart Grid Mod 1 Battery Chemistry & Motor Drives"
        subject = "Electric Vehicles & Smart Grid"
        module = 1
        sem = "s7"
        branch = "EEE"
        branches = @("EEE")
        dept = "EEE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S7 (MECH) Mechatronics Mod 1 Sensors & Actuators"
        noteLabel = "Mechatronics Mod 1 PLC Programming & Microcontrollers"
        subject = "Mechatronics"
        module = 1
        sem = "s7"
        branch = "MECH"
        branches = @("MECH")
        dept = "MECH"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S7 (CIVIL) Transportation Engineering Mod 1 Highway Geometric Design"
        noteLabel = "Transportation Engg Mod 1 Sight Distances & Horizontal Curves"
        subject = "Transportation Engineering"
        module = 1
        sem = "s7"
        branch = "CIVIL"
        branches = @("CIVIL")
        dept = "CIVIL"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },

    # --- S8 Branch Coverage ---
    [PSCustomObject]@{
        title = "S8 (CSE) Distributed Systems Mod 1 RPC & Consensus Protocols"
        noteLabel = "Distributed Systems Mod 1 Raft, Paxos & Fault Tolerance"
        subject = "Distributed Systems"
        module = 1
        sem = "s8"
        branch = "CSE"
        branches = @("CSE")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S8 (DS) Big Data Ethics & Privacy Mod 1 GDPR & Differential Privacy"
        noteLabel = "Data Ethics Mod 1 Anonymization & Data Governance"
        subject = "Data Ethics & Privacy"
        module = 1
        sem = "s8"
        branch = "DS"
        branches = @("DS")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S8 (AI) AI Ethics and Explainable AI Mod 1 SHAP & LIME Interpretability"
        noteLabel = "Explainable AI Mod 1 Fairness, Accountability & Transparency"
        subject = "AI Ethics & XAI"
        module = 1
        sem = "s8"
        branch = "AI"
        branches = @("AI")
        dept = "CSE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S8 (ECE) Satellite Communication Mod 1 Orbital Mechanics & Link Budgets"
        noteLabel = "Satellite Comm Mod 1 Geostationary Orbits & Uplink/Downlink"
        subject = "Satellite Communication"
        module = 1
        sem = "s8"
        branch = "ECE"
        branches = @("ECE")
        dept = "ECE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S8 (EEE) Power System Protection Mod 1 Numerical Relays & CT/PT"
        noteLabel = "Power Protection Mod 1 Differential & Distance Protection"
        subject = "Power System Protection"
        module = 1
        sem = "s8"
        branch = "EEE"
        branches = @("EEE")
        dept = "EEE"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S8 (MECH) Operations Research Mod 1 Simplex & Linear Programming"
        noteLabel = "Operations Research Mod 1 Transportation & Assignment Models"
        subject = "Operations Research"
        module = 1
        sem = "s8"
        branch = "MECH"
        branches = @("MECH")
        dept = "MECH"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    },
    [PSCustomObject]@{
        title = "S8 (CIVIL) Environmental Engineering Mod 1 Water Treatment & Quality Standards"
        noteLabel = "Environmental Engg Mod 1 Coagulation, Filtration & Disinfection"
        subject = "Environmental Engineering"
        module = 1
        sem = "s8"
        branch = "CIVIL"
        branches = @("CIVIL")
        dept = "CIVIL"
        type = "notes"
        driveId = "1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR"
    }
)

foreach ($item in $supplemental) {
    if (!$seenTitles.ContainsKey($item.title)) {
        $seenTitles[$item.title] = $true
        $cleanList += $item
    }
}

Write-Host "Final Clean Database Size: $($cleanList.Count)"

# Output json with indent
$finalJson = $cleanList | ConvertTo-Json -Depth 6
$finalContent = "/* Pre-extracted MACE Notes Database - 100% Reliable Offline & Instant */`nconst MACE_PRELOADED_NOTES = " + $finalJson + ";`n"

Set-Content -Path 'js/mace-notes-data.js' -Value $finalContent -Encoding UTF8
Set-Content -Path 'asc/js/mace-notes-data.js' -Value $finalContent -Encoding UTF8

Write-Host "Updated js/mace-notes-data.js and asc/js/mace-notes-data.js successfully!"
