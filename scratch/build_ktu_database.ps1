# PowerShell script to build the clean KTU 2024 database
$courses = @()

function Add-Course {
    param(
        [string]$code,
        [string]$title,
        [string]$sem,
        [string]$branch,
        [string[]]$branches,
        [string]$category,
        [string]$group,
        [int]$credits,
        [string]$l_t_p_r,
        [string]$syllabusStatus,
        [string]$syllabusSource,
        [string]$syllabusSourceUrl,
        [array]$modules,
        [bool]$notesAvailable,
        [string]$notesPendingMsg,
        [array]$materials
    )
    $obj = [ordered]@{
        code = $code
        title = $title
        sem = $sem
        branch = $branch
        branches = $branches
        category = $category
        group = $group
        credits = $credits
        l_t_p_r = $l_t_p_r
        syllabus = [ordered]@{
            status = $syllabusStatus
            source = $syllabusSource
            sourceUrl = $syllabusSourceUrl
            modules = $modules
        }
        notesAvailable = $notesAvailable
        notesPendingMessage = $notesPendingMsg
        studyMaterials = $materials
    }
    $script:courses += $obj
}

# --- S1 ---
Add-Course 'GAMAT101' 'Mathematics for Information Science - 1' 's1' 'CSE' @('CSE','DS','AI') 'BSC' 'Group A' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group A' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Limits, Continuity & Single Variable Differential Calculus'; topics='Limits of function values, continuity at a point, continuous functions, rates of change, derivative as a function, second and higher order derivatives, chain rule, implicit differentiation, linearization, concavity, second derivative test.' },
        @{ num=2; title='Functions of Several Variables & Partial Differentiation'; topics='Domains and ranges, level curves of two variables, limits and continuity for functions of two variables, partial derivatives of functions of several variables, mixed derivative theorem, chain rule for multivariable functions.' },
        @{ num=3; title='Applications of Partial Derivatives & Optimization'; topics='Directional derivatives in the plane, gradient vector and properties, tangent planes, local extreme values for functions of several variables, critical points, saddle points, Lagrange multipliers method for constrained optimization.' },
        @{ num=4; title='Multiple Integrals'; topics='Double integrals over rectangular and general bounded regions, area and volume by double integration, double integrals in polar coordinates, triple integrals in rectangular coordinates.' },
        @{ num=5; title='Vector Calculus for Information Science'; topics='Vector fields, gradient, curl and divergence of vector fields, physical interpretation, line integrals of vector fields, work and circulation, path independence, Green theorem in the plane.' }
    ) $true '' @(
        @{ id='gamat101-mod1'; type='notes'; module=1; title='Module 1 - Limits, Continuity & Single Variable Calculus Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
        @{ id='gamat101-mod2'; type='notes'; module=2; title='Module 2 - Functions of Several Variables & Partial Differentiation Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
        @{ id='gamat101-qp'; type='qp'; module=0; title='GAMAT101 Model & Solved University Question Papers'; source='KTU Examination Wing / Model Question Papers'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GAPHT121' 'Physics for Information Science' 's1' 'CSE' @('CSE','DS','AI') 'BSC' 'Group A' 4 '3-0-2-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group A' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Oscillations & Wave Optics'; topics='Simple harmonic motion, damped and forced oscillations, resonance, wave equation. Interference in thin films, Newton rings, air wedge, Fraunhofer diffraction at single slit and diffraction grating.' },
        @{ num=2; title='Quantum Mechanics for Computing'; topics='Inadequacy of classical mechanics, de Broglie hypothesis, matter waves, uncertainty principle, wave function and physical interpretation, time-dependent and time-independent Schrodinger equation, particle in 1D infinite potential well.' },
        @{ num=3; title='Semiconductor Physics & Microelectronics'; topics='Band theory of solids, intrinsic and extrinsic semiconductors, carrier concentration, Fermi level, drift and diffusion currents, Hall effect and applications, p-n junction under forward and reverse bias.' },
        @{ num=4; title='Lasers & Modern Optoelectronics'; topics='Interaction of radiation with matter, Einstein coefficients, population inversion, optical resonator, Ruby laser, He-Ne laser, semiconductor laser diode, photo-detectors, solar cells, light emitting diodes.' },
        @{ num=5; title='Fiber Optics & Nanomaterials'; topics='Principle of light transmission in optical fibers, acceptance angle, numerical aperture, step-index and graded-index fibers, attenuation and dispersion. Introduction to nanoscale materials, quantum dots, quantum wells, and carbon nanotubes.' }
    ) $true '' @(
        @{ id='gapht121-mod1'; type='notes'; module=1; title='Module 1 - Oscillations, Resonance & Wave Optics Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
        @{ id='gapht121-lab'; type='lab'; module=0; title='Physics Lab Experiments & Observations Record Manual'; source='KTU Physics Lab Manual / ASC Archive'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GXCYT122' 'Chemistry for Information Science and Electrical Science' 's1' 'CSE' @('CSE','DS','AI','ECE','EEE') 'BSC' 'Group A / Group B' 4 '3-0-2-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Electrochemistry and Energy Storage Systems'; topics='Electrochemical cells, cell potential, Nernst equation, reference electrodes, secondary batteries: lead-acid, lithium-ion battery chemistry, fuel cells (H2-O2 fuel cell).' },
        @{ num=2; title='Corrosion Science and Engineering Control'; topics='Electrochemical theory of corrosion, galvanic corrosion, differential aeration corrosion, stress corrosion, factors influencing corrosion rate, protective measures: cathodic protection, electroplating.' },
        @{ num=3; title='Advanced Materials & Conducting Polymers'; topics='Polymers in electronics, classification, conducting polymers: polyaniline, polypyrrole, synthesis, conduction mechanism, applications. Carbon nanotubes in electronic devices.' },
        @{ num=4; title='Instrumental Methods of Chemical Analysis'; topics='Principle and instrumentation of UV-Visible spectroscopy, Beer-Lambert law, infrared (FT-IR) spectroscopy, flame photometry, atomic absorption spectroscopy, thermal analysis (TGA and DSC).' },
        @{ num=5; title='Water Technology & Environmental Chemistry'; topics='Hardness of water, determination by EDTA method, boiler scale and sludge, softening methods: ion-exchange process, reverse osmosis, desalination of brackish water.' }
    ) $true '' @(
        @{ id='gxcyt122-notes'; type='notes'; module=1; title='Module 1 - Electrochemistry, Nernst Equation & Lithium Batteries Notes'; source='KTUNotes.in / Academic Cell Archive'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GMEST103' 'Engineering Graphics and Computer Aided Drawing' 's1' 'CSE' @('CSE','DS','AI','ECE','EEE') 'ESC' 'Group A / Group B' 3 '2-0-2-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Introduction to Technical Drawing & Projections of Points and Lines'; topics='Principles of drafting, BIS conventions, dimensioning, scales. Orthographic projection, projection of points in all quadrants, projection of straight lines inclined to reference planes, true length.' },
        @{ num=2; title='Projections of Planes'; topics='Projections of regular polygonal and circular planes inclined to one or both reference planes. Auxiliary plane method, true shape determination.' },
        @{ num=3; title='Projections of Regular Solids'; topics='Projections of prisms, pyramids, cylinders, and cones with axis inclined to reference planes.' },
        @{ num=4; title='Sections of Solids & Development of Surfaces'; topics='Sections of prisms, pyramids, cylinders, and cones cut by section planes. True shape of section. Development of lateral surfaces of simple and truncated solids.' },
        @{ num=5; title='Isometric Projections & Introduction to CAD'; topics='Isometric scale, isometric projection vs view. Introduction to CAD software interface, 2D drawing tools, editing commands, basic orthographic rendering.' }
    ) $true '' @(
        @{ id='gmest103-notes'; type='notes'; module=1; title='Module 1 - Projections of Points & Lines Solved Sheet Notes'; source='KTUNotes.in / MACE Graphics Studio'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GXEST104' 'Introduction to Electrical and Electronics Engineering' 's1' 'CSE' @('CSE','DS','AI','ECE','EEE') 'ESC' 'Group A / Group B' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Basic Electrical Circuits and DC Networks'; topics='Circuit elements, Ohm law, Kirchhoff laws, mesh current and node voltage analysis, Delta-Star conversions, network theorems: Thevenin, Norton, Superposition.' },
        @{ num=2; title='AC Circuits & Three Phase Systems'; topics='Sinusoidal AC voltage, RMS, average value, phasor representation of R, L, C circuits, power factor. Three phase systems: star and delta connections.' },
        @{ num=3; title='Electrical Machines and Power Systems'; topics='Single phase transformer working principle, EMF equation. DC machines, three-phase induction motor principle. Generation, transmission, distribution, wiring and earthing.' },
        @{ num=4; title='Semiconductor Devices & Diode Applications'; topics='P-N junction diode: characteristics, half-wave and full-wave rectifiers, capacitor filter. Zener diode voltage regulator. BJT characteristics.' },
        @{ num=5; title='Linear Integrated Circuits & Communication Basics'; topics='Operational amplifiers: inverting, non-inverting, adder, subtractor. Principles of electronic communication: modulation, AM, FM, transmitter and receiver block diagrams.' }
    ) $true '' @(
        @{ id='gxest104-mod1'; type='notes'; module=1; title='Module 1 - Mesh & Nodal Circuit Analysis Complete Notes'; source='KTUNotes.in / Academic Cell Archive'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'UCEST105' 'Algorithmic Thinking with Python' 's1' 'CSE' @('CSE','DS','AI','ECE','EEE','MECH','CIVIL') 'ESC' 'Common University Core (UC)' 4 '3-0-2-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme University Core' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Algorithmic Problem Solving & Python Essentials'; topics='Computational thinking, algorithm design: pseudo-code, flowcharts. Python environment, variables, data types, operators, precedence, expressions, console I/O.' },
        @{ num=2; title='Control Flow and Iteration'; topics='Conditional branching: if, if-else, if-elif-else statements. Loops: while loop, for loop with range(), loop control (break, continue, pass), nested loops.' },
        @{ num=3; title='Functions, Modularity & Recursion'; topics='Defining functions, arguments, return statement, default parameters, variable-length arguments (*args, **kwargs), scope of variables, recursion, lambda functions, math and random modules.' },
        @{ num=4; title='Composite Data Structures in Python'; topics='Strings: indexing, slicing, methods. Lists: mutability, operations, list comprehensions. Tuples, Dictionaries: key-value pairs, methods. Sets: mathematical set operations.' },
        @{ num=5; title='File I/O, Exceptions & Introductory Libraries'; topics='File handling: reading, writing files, with statement. Exception handling: try-except blocks, raising custom exceptions. Introduction to NumPy and Matplotlib.' }
    ) $true '' @(
        @{ id='ucest105-mod1'; type='notes'; module=1; title='Module 1 - Algorithmic Thinking & Python Syntax Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
        @{ id='ucest105-lab'; type='lab'; module=0; title='Python Programming Lab Exercises, Solutions & Outputs'; source='KTU Academic Practical Syllabus'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GYMAT101' 'Mathematics for Electrical Science and Physical Science - 1' 's1' 'ECE' @('ECE','EEE','MECH','CIVIL') 'BSC' 'Group B / Group C' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Differential Calculus & Series Expansions'; topics='Rolle theorem, Lagrange mean value theorem, Cauchy mean value theorem, Taylor and Maclaurin expansions, indeterminate forms and L-Hospital rule.' },
        @{ num=2; title='Multivariable Calculus & Partial Derivatives'; topics='Functions of two variables, partial derivatives, chain rule, total differential, Jacobians, extrema with and without constraints (Lagrange multipliers).' },
        @{ num=3; title='First Order Ordinary Differential Equations'; topics='Separable, homogeneous, exact differential equations, integrating factors, linear differential equations, Bernoulli equations, orthogonal trajectories.' },
        @{ num=4; title='Higher Order Linear Differential Equations'; topics='Linear ODEs with constant coefficients, complementary function and particular integral, method of variation of parameters, Cauchy-Euler equations.' },
        @{ num=5; title='Laplace Transforms and Applications'; topics='Laplace transform definition, shifting theorems, transforms of derivatives and integrals, unit step function, Dirac delta function, inverse Laplace transforms, convolution theorem, solving initial value ODE problems.' }
    ) $true '' @(
        @{ id='gymat101-mod1'; type='notes'; module=1; title='Module 1 - Mean Value Theorems & Taylor Series Notes'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GBPHT121' 'Physics for Electrical Science' 's1' 'ECE' @('ECE','EEE') 'BSC' 'Group B' 4 '3-0-2-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Harmonic Oscillations & Electromagnetic Waves'; topics='Damped harmonic oscillator, Q-factor, forced oscillations, resonance. Maxwell equations, wave equation for EM waves in free space, Poynting vector.' },
        @{ num=2; title='Wave Optics & Interference'; topics='Interference in thin films, Newton rings, air wedge, anti-reflection coatings. Fraunhofer diffraction at single slit, double slit, and transmission grating.' },
        @{ num=3; title='Quantum Mechanics for Devices'; topics='De Broglie waves, uncertainty principle, wave function, Schrodinger equation, quantum tunneling across a potential barrier, STM overview.' },
        @{ num=4; title='Magnetic Materials and Superconductivity'; topics='Magnetic moments, dia, para, ferro, ferri and anti-ferromagnetic materials, hysteresis loop. Superconductivity: Meissner effect, Type I/II, BCS overview, Josephson junctions.' },
        @{ num=5; title='Semiconductor Optoelectronics & Photonics'; topics='Direct/indirect bandgap semiconductors, solar cells, LED, photodiode, avalanche photodiode. Optical fibers, attenuation, fiber optic sensors.' }
    ) $true '' @(
        @{ id='gbpht121-mod1'; type='notes'; module=1; title='Module 1 - EM Waves & Harmonic Oscillators Notes'; source='KTUNotes.in / Academic Cell Archive'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GCEST103' 'Engineering Mechanics' 's1' 'MECH' @('MECH','CIVIL') 'ESC' 'Group C' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Statics of Coplanar Force Systems'; topics='Principles of statics, Varignon theorem, resultant of concurrent and non-concurrent coplanar force systems, free-body diagrams, equations of equilibrium.' },
        @{ num=2; title='Friction and Analysis of Trusses'; topics='Laws of friction, ladder friction, wedge friction, screw jack. Simple plane trusses: method of joints, method of sections.' },
        @{ num=3; title='Centroid, Moment of Inertia & Centre of Gravity'; topics='Centroid of composite figures, Pappus-Guldinus theorems. Moment of inertia: parallel and perpendicular axis theorems, polar moment of inertia, principal axes.' },
        @{ num=4; title='Kinematics of Particles'; topics='Rectilinear motion with uniform and variable acceleration, projectile motion, circular motion, normal and tangential components of acceleration.' },
        @{ num=5; title='Kinetics of Particles and Rigid Bodies'; topics='Newton second law, D-Alembert principle, work-energy theorem, impulse and momentum, direct central impact of elastic bodies.' }
    ) $true '' @(
        @{ id='gcest103-mod1'; type='notes'; module=1; title='Module 1 - Statics of Coplanar Force Systems Solved Problems'; source='KTUNotes.in / MACE Civil & Mech Faculty Notes'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GCEST104' 'Introduction to Mechanical and Civil Engineering' 's1' 'MECH' @('MECH','CIVIL') 'ESC' 'Group C' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Thermodynamics and Power Generation (Mechanical)'; topics='Laws of thermodynamics, Air standard cycles (Otto, Diesel), IC engines, steam turbines, gas turbines, hydraulic turbines.' },
        @{ num=2; title='Manufacturing Processes & Machine Elements (Mechanical)'; topics='Casting, forging, rolling, welding, machine tools: lathe, milling. Transmission of power: belts, gears.' },
        @{ num=3; title='Civil Engineering Materials & Building Construction'; topics='Stones, bricks, cement, concrete, steel. Types of buildings, building components: foundation, masonry, beams, slabs, roofs.' },
        @{ num=4; title='Surveying & Levelling (Civil)'; topics='Principles of surveying, linear measurements, chain, compass surveying, levelling concepts, contours, total station, GPS/GIS basics.' },
        @{ num=5; title='Environmental and Transportation Engineering (Civil)'; topics='Water supply, rainwater harvesting, sewage disposal, solid waste management. Transportation: highways, railways, air transport.' }
    ) $true '' @(
        @{ id='gcest104-civil'; type='notes'; module=3; title='Module 3 & 4 - Civil Building Construction & Surveying Notes'; source='KTUNotes.in / MACE Civil Wing'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

# --- S2 ---
Add-Course 'GAMAT201' 'Mathematics for Information Science - 2' 's2' 'CSE' @('CSE','DS','AI') 'BSC' 'Group A' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group A' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Systems of Linear Equations and Matrix Algebra'; topics='Rank of a matrix, row echelon form, existence and uniqueness of solutions of linear systems Ax = b, Gauss elimination and Gauss-Jordan methods.' },
        @{ num=2; title='Vector Spaces and Subspaces'; topics='Vector spaces, subspaces, linear span, linear independence, basis and dimension, coordinates, dimension theorem.' },
        @{ num=3; title='Linear Transformations & Matrix Representations'; topics='Linear transformations, kernel and range, rank-nullity theorem, matrix representation, change of basis.' },
        @{ num=4; title='Eigenvalues, Eigenvectors & Diagonalization'; topics='Eigenvalues and eigenvectors, Cayley-Hamilton theorem, conditions for matrix diagonalization, power of a matrix.' },
        @{ num=5; title='Inner Product Spaces & Singular Value Decomposition'; topics='Inner product, norm, Cauchy-Schwarz inequality, orthonormal basis, Gram-Schmidt orthogonalization, introduction to SVD.' }
    ) $true '' @(
        @{ id='gamat201-mod1'; type='notes'; module=1; title='Module 1 - Linear Systems & Row Echelon Solutions Notes'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GXEST203' 'Foundations of Computing: From Hardware Essentials to Web Design' 's2' 'CSE' @('CSE','DS','AI','ECE','EEE') 'ESC' 'Group A / Group B' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Computer Hardware Architecture & Subsystems'; topics='Von Neumann architecture, CPU components: ALU, control unit, registers, bus structures, memory hierarchy.' },
        @{ num=2; title='Binary Systems and Digital Logic Fundamentals'; topics='Number systems, binary arithmetic, signed numbers, floating point numbers (IEEE 754), logic gates, Boolean algebra.' },
        @{ num=3; title='Operating System & Shell Environment'; topics='OS roles, process management, CPU scheduling, memory management, Linux command line interface, shell scripting basics.' },
        @{ num=4; title='Computer Networks and Internet Protocols'; topics='Network topologies, OSI model, TCP/IP, IPv4, IPv6, DNS, DHCP, HTTP/HTTPS, client-server architecture.' },
        @{ num=5; title='Modern Web Design and Interactive Front-End'; topics='HTML5 semantic tags, forms, media, CSS3 styling, flexbox, responsive media queries, JavaScript DOM manipulation.' }
    ) $true '' @(
        @{ id='gxest203-notes'; type='notes'; module=1; title='Module 1 & 2 - Hardware Architecture, Number Systems & Logic Gates Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GXEST204' 'Programming in C' 's2' 'CSE' @('CSE','DS','AI','ECE','EEE') 'ESC' 'Group A / Group B' 4 '3-0-2-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Introduction to C Programming and Elementary Constructs'; topics='Structure of C program, compilation, variables, constants, data types, operators, precedence, formatted I/O.' },
        @{ num=2; title='Conditional Branching and Looping Statements'; topics='Decision making: if-else, switch-case. Loops: while, do-while, for loops, nested loops, break, continue.' },
        @{ num=3; title='Arrays and String Processing'; topics='1D and 2D arrays, matrix operations, string manipulation, standard string handling functions.' },
        @{ num=4; title='Functions, Pointers and Dynamic Memory Allocation'; topics='User-defined functions, call by value, call by reference, recursion, pointer arithmetic, dynamic memory allocation (malloc, free).' },
        @{ num=5; title='Structures, Unions and File Management in C'; topics='Structures, nested structures, unions, file pointers, file modes, formatted file I/O, error handling.' }
    ) $true '' @(
        @{ id='gxest204-c-notes'; type='notes'; module=1; title='Module 1 & 2 - C Programming Fundamentals, Loops & Arrays Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'UCEST206' 'Engineering Entrepreneurship and IPR' 's2' 'CSE' @('CSE','DS','AI','ECE','EEE','MECH','CIVIL') 'ESC' 'Common University Core (UC)' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme University Core' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Entrepreneurial Mindset, Ideation & Design Thinking'; topics='Entrepreneurship concepts, traits, design thinking process (empathize, define, ideate, prototype, test), problem-solution fit.' },
        @{ num=2; title='Business Model Formulation & Customer Discovery'; topics='Business model canvas, Lean Canvas, value proposition, Minimum Viable Product (MVP), customer development.' },
        @{ num=3; title='Startup Finance, Funding and Unit Economics'; topics='Financial forecasting, break-even analysis, bootstrapping, angel investors, venture capital, government startup schemes.' },
        @{ num=4; title='Intellectual Property Rights (IPR) Framework'; topics='Patents, criteria for patentability, patent search, provisional and complete specifications, copyrights, trademarks, trade secrets.' },
        @{ num=5; title='Legal Structure, Ethics & Scaling the Venture'; topics='Business entity types (LLP, Pvt Ltd), regulatory compliance, startup policies, business ethics, case studies.' }
    ) $true '' @(
        @{ id='ucest206-notes'; type='notes'; module=1; title='Module 1 & 4 - Design Thinking & Intellectual Property Rights (IPR) Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'UCHUT128' 'Life Skills and Professional Communication' 's2' 'CSE' @('CSE','DS','AI','ECE','EEE','MECH','CIVIL') 'HMC' 'Common University Core (UC)' 1 '2-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Self-Awareness & Interpersonal Skills'; topics='SWOT analysis, emotional intelligence, goal setting, time and stress management, critical thinking.' },
        @{ num=2; title='Professional Communication & Team Dynamics'; topics='Verbal/non-verbal communication, active listening, group discussions, presentation skills, team leadership.' },
        @{ num=3; title='Technical Writing and Workplace Ethics'; topics='Resume preparation, professional email etiquette, technical reports, workplace ethics.' }
    ) $true '' @(
        @{ id='uchut128-notes'; type='notes'; module=1; title='Life Skills Lecture Summaries & Resume Writing Guide'; source='KTUNotes.in / MACE Soft Skills Cell'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GYMAT201' 'Mathematics for Electrical Science and Physical Science - 2' 's2' 'ECE' @('ECE','EEE','MECH','CIVIL') 'BSC' 'Group B / Group C' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Partial Differentiation'; topics='Limits, continuity, partial derivatives, chain rule, total derivatives, Euler theorem, maxima and minima.' },
        @{ num=2; title='Multiple Integrals'; topics='Double integrals, change of order, polar coordinates, area and volume, triple integrals.' },
        @{ num=3; title='Vector Differentiation'; topics='Vector functions, gradient, divergence, curl, directional derivative, scalar and vector potentials.' },
        @{ num=4; title='Vector Integration'; topics='Line integrals, surface integrals, volume integrals, Green theorem, Gauss divergence theorem, Stokes theorem.' }
    ) $true '' @(
        @{ id='gymat201-notes'; type='notes'; module=1; title='Module 1 & 2 - Partial Derivatives & Multiple Integrals Notes'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'GZEST204' 'Basic Electrical & Electronics Engineering (for Group C)' 's2' 'MECH' @('MECH','CIVIL') 'ESC' 'Group C' 4 '2-2-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Electrical Circuits and AC Quantities'; topics='DC circuit analysis, Kirchhoff laws, AC sinusoidal quantities, impedance in R-L-C circuits, power factor.' },
        @{ num=2; title='Electrical Machines (Transformers & Motors)'; topics='Single phase transformer, DC shunt/series motors, three-phase induction motor principle.' },
        @{ num=3; title='Basic Electronics & Semiconductor Diodes'; topics='P-N junction diode, rectifiers, zener diode, voltage regulation, BJT switching.' },
        @{ num=4; title='Sensors and Industrial Instrumentation'; topics='Transducers: thermocouples, strain gauges, LVDT, introductory operational amplifiers.' }
    ) $true '' @(
        @{ id='gzest204-notes'; type='notes'; module=1; title='Basic Electrical & Electronics Modules 1-4 Complete Notes'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

# --- S3 ---
Add-Course 'PCCST303' 'Data Structures and Algorithms' 's3' 'CSE' @('CSE','DS','AI') 'PCC' 'Group A Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme S3 Programme Core' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Introduction to Data Structures & Algorithmic Complexity'; topics='Abstract Data Types, space and time complexity, asymptotic Big-O notations, multidimensional arrays, sparse matrices.' },
        @{ num=2; title='Linear Data Structures: Stacks and Queues'; topics='Stack ADT, infix to postfix conversion, evaluation of postfix, queue ADT, circular queue, priority queue, deque.' },
        @{ num=3; title='Linked Structures: Singly, Doubly and Circular Lists'; topics='Singly linked list operations, doubly linked list, circular list, polynomial arithmetic using linked lists.' },
        @{ num=4; title='Non-Linear Data Structures: Trees & Binary Search Trees'; topics='Binary trees, tree traversals (preorder, inorder, postorder), BST search/insertion/deletion, AVL trees, heaps.' },
        @{ num=5; title='Graphs & Advanced Search/Sort Algorithms'; topics='Graph representations, BFS, DFS, topological sort, merge sort, quick sort, hashing techniques.' }
    ) $true '' @(
        @{ id='pccst303-mod1'; type='notes'; module=1; title='Module 1 & 2 - Complexity Analysis, Stacks & Queues Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCCST302' 'Object Oriented Programming with Project-Based Learning' 's3' 'CSE' @('CSE','DS','AI') 'PCC' 'Group A Core' 4 '3-0-2-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Object Oriented Paradigms and Java/C++ Basics'; topics='OOP principles: abstraction, encapsulation, inheritance, polymorphism, classes, objects, constructors, static members.' },
        @{ num=2; title='Inheritance and Polymorphism'; topics='Single, multilevel, hierarchical inheritance, method overriding, abstract classes, super, interfaces.' },
        @{ num=3; title='Packages, Interfaces & Exception Handling'; topics='Packages, interface implementation, exception handling (try, catch, finally, custom exceptions).' },
        @{ num=4; title='Multithreading & Generics / Collections'; topics='Thread lifecycle, synchronization, generic programming, Collections framework (List, Set, Map).' },
        @{ num=5; title='Event-Driven GUI & Project Development'; topics='Graphical user interfaces, event handling, delegation event model, mini-project integration.' }
    ) $true '' @(
        @{ id='pccst302-notes'; type='notes'; module=1; title='Module 1 & 2 - OOP Fundamentals, Classes & Inheritance Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'UCHUT346' 'Economics for Engineers' 's3' 'CSE' @('CSE','DS','AI','ECE','EEE','MECH','CIVIL') 'HMC' 'Common University Core' 2 '2-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Engineering Economics, Demand and Supply Analysis'; topics='Demand, elasticity of demand, demand forecasting, law of supply, equilibrium price.' },
        @{ num=2; title='Cost Concepts and Market Structures'; topics='Fixed and variable costs, break-even analysis, market forms: perfect competition, monopoly, oligopoly.' },
        @{ num=3; title='Time Value of Money and Capital Budgeting'; topics='Cash flow diagrams, compound interest, present and future worth, IRR, BCR method.' }
    ) $true '' @(
        @{ id='uchut346-notes'; type='notes'; module=1; title='Engineering Economics Modules 1-3 Lecture Summaries & Formulae'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCECT302' 'Solid State Devices & Semiconductor Physics' 's3' 'ECE' @('ECE') 'PCC' 'Group B Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Carrier Transport in Semiconductors'; topics='Energy band models, carrier concentration, drift and diffusion, continuity equation, Hall effect.' },
        @{ num=2; title='P-N Junction Electrostatics and Dynamics'; topics='Built-in potential, depletion width, I-V characteristics, breakdown mechanisms (Zener and Avalanche).' },
        @{ num=3; title='Bipolar Junction Transistors (BJT)'; topics='BJT principles, minority carrier distribution, Early effect, Ebers-Moll model.' },
        @{ num=4; title='MOSFET Physics & Characteristics'; topics='MOS capacitor: accumulation, depletion, inversion, threshold voltage, drain current equations.' }
    ) $true '' @(
        @{ id='pcect302-notes'; type='notes'; module=1; title='Solid State Devices Complete Modules 1-4 Notes'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCEET302' 'Circuits and Networks' 's3' 'EEE' @('EEE') 'PCC' 'Group B Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Network Topology and Analysis Methods'; topics='Network graph, incidence matrix, tie-set and cut-set schedules, matrix methods.' },
        @{ num=2; title='Network Theorems in AC Circuits'; topics='Superposition, Thevenin, Norton, Maximum Power Transfer applied to AC circuits.' },
        @{ num=3; title='Transient Analysis of Dynamic Circuits'; topics='Transients in R-L, R-C, and R-L-C circuits using Laplace transform method.' },
        @{ num=4; title='Two-Port Network Parameters'; topics='Z, Y, ABCD, h parameters, interrelationships, cascade and parallel connections.' }
    ) $true '' @(
        @{ id='pceet302-notes'; type='notes'; module=1; title='Circuits & Networks Modules 1-4 Solved Sheet Notes'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCMET302' 'Mechanics of Solids' 's3' 'MECH' @('MECH') 'PCC' 'Group C Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Stress, Strain and Elastic Constants'; topics='Stress, strain, Hooke law, Poisson ratio, elastic constants relationships, thermal stresses.' },
        @{ num=2; title='Shear Force and Bending Moment in Beams'; topics='SFD and BMD for cantilevers, simply supported, overhanging beams.' },
        @{ num=3; title='Stresses in Beams (Bending & Shear)'; topics='Theory of simple bending, neutral axis, section modulus, transverse shear stress distribution.' },
        @{ num=4; title='Torsion of Circular Shafts & Springs'; topics='Torsion formula for solid and hollow shafts, power transmission, helical springs.' },
        @{ num=5; title='Columns and Thin Cylinders'; topics='Euler formula for long columns, Rankine formula, thin cylindrical shells under pressure.' }
    ) $true '' @(
        @{ id='pcmet302-notes'; type='notes'; module=1; title='Mechanics of Solids Modules 1-5 Formulae & Solved Problems'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCCET302' 'Fluid Mechanics (Civil)' 's3' 'CIVIL' @('CIVIL') 'PCC' 'Group C Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Fluid Properties and Fluid Statics'; topics='Viscosity, pressure measurement: manometers, hydrostatic forces on submerged planes, buoyancy.' },
        @{ num=2; title='Fluid Kinematics'; topics='Types of flow, continuity equation in 3D, velocity potential, stream function, flow net.' },
        @{ num=3; title='Fluid Dynamics & Flow Measurement'; topics='Euler and Bernoulli equations, venturimeter, orifice meter, pitot tube, momentum equation.' },
        @{ num=4; title='Flow Through Pipes'; topics='Laminar/turbulent flow, Darcy-Weisbach friction equation, minor losses, HGL, TEL.' },
        @{ num=5; title='Notches, Weirs & Open Channel Basics'; topics='Flow measurement using notches and weirs, introductory open channel Chezy/Manning equations.' }
    ) $true '' @(
        @{ id='pccet302-notes'; type='notes'; module=1; title='Fluid Mechanics Modules 1-5 Lecture Notes'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

# --- S4 ---
Add-Course 'PCCST402' 'Database Management Systems' 's4' 'CSE' @('CSE','DS','AI') 'PCC' 'Group A Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme S4 Programme Core' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Introduction to DBMS & Entity-Relationship Modeling'; topics='3-tier database architecture, data independence, ER model: entities, attributes, relationships, ER to relational mapping.' },
        @{ num=2; title='Relational Model, Relational Algebra and SQL'; topics='Relational algebra, SQL: DDL, DML, constraints, complex queries, nested subqueries, joins, views.' },
        @{ num=3; title='Relational Database Design and Normalization'; topics='Functional dependencies, Armstrong axioms, normal forms: 1NF, 2NF, 3NF, BCNF, lossless join decomposition.' },
        @{ num=4; title='Transaction Management & Concurrency Control'; topics='ACID properties, schedule serializability, concurrency control: lock-based 2PL, deadlock prevention.' },
        @{ num=5; title='Physical Storage, Indexing & Modern Databases'; topics='File organization, indexing: B-trees and B+ trees, introduction to NoSQL databases.' }
    ) $true '' @(
        @{ id='pccst402-mod1'; type='notes'; module=1; title='Module 1 & 2 - ER Modeling, Relational Algebra & SQL Complete Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCCST403' 'Operating Systems' 's4' 'CSE' @('CSE','DS','AI') 'PCC' 'Group A Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme S4 Programme Core' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Operating System Architectures & Process Management'; topics='System calls, OS structures, Process Control Block (PCB), process scheduling queues, context switching, IPC.' },
        @{ num=2; title='CPU Scheduling & Process Synchronization'; topics='CPU scheduling (FCFS, SJF, Round Robin, Priority), critical section, semaphores, classic synchronization problems.' },
        @{ num=3; title='Deadlock Characterization and Handling'; topics='Necessary conditions, resource allocation graphs, deadlock prevention, Banker avoidance algorithm, detection.' },
        @{ num=4; title='Memory Management and Virtual Memory'; topics='Contiguous memory allocation, paging, segmentation, demand paging, page replacement (FIFO, LRU), thrashing.' },
        @{ num=5; title='Storage Management, File Systems & Disk Scheduling'; topics='File attributes, directory structures, disk scheduling algorithms (FCFS, SSTF, SCAN, C-SCAN).' }
    ) $true '' @(
        @{ id='pccst403-mod1'; type='notes'; module=1; title='Module 1 & 2 - Process Scheduling & Semaphores Synchronization Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCECT402' 'Signals and Systems' 's4' 'ECE' @('ECE') 'PCC' 'Group B Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Continuous and Discrete Time Signals and Systems'; topics='Signal classification, system properties: linearity, time-invariance, causality, stability.' },
        @{ num=2; title='Linear Time-Invariant (LTI) Systems'; topics='Convolution integral, convolution sum, properties of LTI systems, impulse and step response.' },
        @{ num=3; title='Fourier Analysis of Continuous Time Signals'; topics='Fourier series, Continuous-Time Fourier Transform (CTFT), frequency response of LTI systems.' },
        @{ num=4; title='Sampling and Z-Transforms'; topics='Sampling theorem, aliasing, Z-transform: ROC, properties, inverse Z-transform, discrete system analysis.' }
    ) $true '' @(
        @{ id='pcect402-notes'; type='notes'; module=1; title='Signals and Systems Modules 1-4 Complete Notes & Problems'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCEET402' 'DC Machines and Transformers' 's4' 'EEE' @('EEE') 'PCC' 'Group B Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='DC Generators Principles & Performance'; topics='Armature reaction, commutation, open circuit and load characteristics of DC generators.' },
        @{ num=2; title='DC Motors Operating Characteristics & Speed Control'; topics='Back EMF, torque equation, characteristics, starters, speed control methods, testing: Swinburne test.' },
        @{ num=3; title='Single Phase Transformers Equivalent Circuits'; topics='Equivalent circuit, phasor diagrams, voltage regulation, efficiency, OC and SC tests.' },
        @{ num=4; title='Three Phase Transformers & Auto-Transformers'; topics='Three-phase connections (Star-Star, Delta-Delta), Scott connection, parallel operation, auto-transformers.' }
    ) $true '' @(
        @{ id='pceet402-notes'; type='notes'; module=1; title='DC Machines and Transformers Complete Lecture Notes & Equivalent Circuits'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCMET403' 'Engineering Thermodynamics' 's4' 'MECH' @('MECH') 'PCC' 'Group C Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='First Law of Thermodynamics & Energy Balances'; topics='Work and heat transfer, First law for closed/open systems, steady flow energy equation (SFEE).' },
        @{ num=2; title='Second Law of Thermodynamics & Entropy'; topics='Kelvin-Planck, Clausius statements, Carnot cycle, Clausius inequality, entropy principle.' },
        @{ num=3; title='Pure Substances & Steam Tables'; topics='Phase transformation of water, dryness fraction, Mollier chart, Rankine cycle calculations.' },
        @{ num=4; title='Thermodynamic Relations & Gas Mixtures'; topics='Maxwell relations, equations of state for real gases, ideal gas mixtures, psychrometric properties.' }
    ) $true '' @(
        @{ id='pcmet403-notes'; type='notes'; module=1; title='Engineering Thermodynamics Modules 1-4 Theory & Solved Numerical Problems'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCCET402' 'Geotechnical Engineering - I' 's4' 'CIVIL' @('CIVIL') 'PCC' 'Group C Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Soil Origin, Phase Relationships and Index Properties'; topics='3-phase system, void ratio, porosity, saturation, unit weights, grain size distribution, Atterberg limits.' },
        @{ num=2; title='Soil Water & Permeability'; topics='Darcy law, permeability tests, stratified soil permeability, seepage analysis, flow nets, quicksand.' },
        @{ num=3; title='Effective Stress Concept & Compaction'; topics='Total stress, pore water pressure, effective stress, Proctor compaction tests, moisture-density relation.' },
        @{ num=4; title='Consolidation of Soils'; topics='Terzaghi 1D consolidation theory, oedometer test, compression index, settlement calculations.' },
        @{ num=5; title='Shear Strength of Soils'; topics='Mohr-Coulomb failure criteria, direct shear test, triaxial shear test, unconfined compression test.' }
    ) $true '' @(
        @{ id='pccet402-notes'; type='notes'; module=1; title='Geotechnical Engineering - I Soil Mechanics Complete Notes'; source='MACE Civil Department / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

# --- S5 ---
Add-Course 'PCDST501' 'Data Analytics' 's5' 'DS' @('DS') 'PCC' 'Group A - Data Science Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme - S5 Data Science' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Exploratory Data Analysis and Descriptive Analytics'; topics='Data preparation, variable types, summary statistics: measures of central tendency, dispersion, variance, interquartile range. Normal, binomial, Poisson distributions. Missing values, outliers, covariance, Pearson/Spearman correlation, normalization, scaling.' },
        @{ num=2; title='Statistical Modeling & Regression Analysis'; topics='Simple linear regression, assumptions, Ordinary Least Squares (OLS) estimation, multiple linear regression, multicollinearity, VIF. Logistic regression: logit function, odds ratio, confusion matrix, ROC-AUC, k-fold cross validation.' },
        @{ num=3; title='Time Series Analysis & Forecasting Methods'; topics='Components of time series (trend, seasonality, cyclicity), stationary time series, moving averages, exponential smoothing (Holt-Winters), AR, MA, ARMA, ARIMA modeling, ACF/PACF plots.' },
        @{ num=4; title='Distributed Data Analytics & Big Data Systems'; topics='Big data analytics lifecycle, MapReduce paradigm, Apache Spark architecture, RDDs, Spark DataFrames, transformations and actions, Spark SQL, PySpark pipelines.' },
        @{ num=5; title='Classification, Clustering & Model Interpretability'; topics='Decision trees: ID3, CART, entropy, information gain, Gini index. Unsupervised: k-means clustering, hierarchical clustering, silhouette score, feature importance, bias-variance trade-off.' }
    ) $true '' @(
        @{ id='da-mod1'; type='notes'; module=1; title='Module 1 - Exploratory Data Analysis, Distributions & Summary Statistics'; source='MACE Academic Support Cell / Verified Curriculum'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
        @{ id='da-mod2'; type='notes'; module=2; title='Module 2 - Linear & Multiple Regression, OLS Estimation & Cross Validation'; source='MACE Academic Support Cell / Verified Curriculum'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
        @{ id='da-mod3'; type='notes'; module=3; title='Module 3 - Time Series Decomposition, ARIMA & Exponential Smoothing'; source='MACE Academic Support Cell / Verified Curriculum'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
        @{ id='da-mod4'; type='notes'; module=4; title='Module 4 - Distributed Analytics with Apache Spark, RDDs & PySpark'; source='MACE Academic Support Cell / Verified Curriculum'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
        @{ id='da-mod5'; type='notes'; module=5; title='Module 5 - Decision Trees, K-Means Clustering & Model Validation Metrics'; source='MACE Academic Support Cell / Verified Curriculum'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
        @{ id='da-qp'; type='qp'; module=0; title='PCDST501 Previous University & Model Question Papers'; source='KTU Exam Wing & Question Bank Archive'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
        @{ id='da-internal'; type='internal'; module=0; title='Data Analytics Solved Series 1 & 2 Examination Papers with Solutions'; source='MACE ASC Solved Series Archive'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
        @{ id='da-lab'; type='lab'; module=0; title='Data Analytics Python & R Practical Experiments & Observations Manual'; source='MACE Data Analytics Laboratory'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCDST502' 'Big Data Analytics and Mining' 's5' 'DS' @('DS') 'PCC' 'Group A - Data Science Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Big Data Foundations and Hadoop Eco-system'; topics='Big data characteristics, HDFS architecture, MapReduce programming paradigm, YARN.' },
        @{ num=2; title='NoSQL Databases and Data Ingestion'; topics='Key-value, column family, document, graph databases. Apache Cassandra, MongoDB, Flume, Sqoop, Kafka.' },
        @{ num=3; title='Frequent Pattern Mining & Association Rules'; topics='Market basket analysis, Apriori algorithm, FP-Growth algorithm, association rules, support, confidence, lift.' },
        @{ num=4; title='Advanced Clustering for Big Data'; topics='DBSCAN density clustering, grid clustering, high-dimensional outlier detection.' },
        @{ num=5; title='Stream Analytics & Big Data Applications'; topics='Stream processing, windowing, Spark Streaming real-time pipelines.' }
    ) $true '' @(
        @{ id='pcdst502-notes'; type='notes'; module=1; title='Module 1 - Big Data Foundations, HDFS Architecture & MapReduce Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCCST501' 'System Software and Compilers' 's5' 'CSE' @('CSE') 'PCC' 'Group A Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='System Software Foundations & Assemblers'; topics='System software concepts, SIC architecture, two-pass assembler design.' },
        @{ num=2; title='Macro Processors, Linkers and Loaders'; topics='Macro expansion, one-pass macro processor, absolute loaders, dynamic linking.' },
        @{ num=3; title='Compiler Lexical Analysis & Syntax Analysis'; topics='Lexical analysis, regular expressions to finite automata, LEX, LL(1) and LR parsing, YACC.' },
        @{ num=4; title='Syntax-Directed Translation & Intermediate Code'; topics='Syntax-directed definitions, three-address code, quadruples, triples.' },
        @{ num=5; title='Code Optimization and Code Generation'; topics='Basic blocks, flow graphs, loop optimization, dead code elimination, register allocation.' }
    ) $true '' @(
        @{ id='pccst501-ss-notes'; type='notes'; module=1; title='System Software Modules 1-3 Complete Notes & Algorithms'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCCST502' 'Computer Networks' 's5' 'CSE' @('CSE') 'PCC' 'Group A Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Network Layer Architecture & Data Link Layer'; topics='OSI and TCP/IP models, framing, error detection/correction, sliding window, CSMA/CD.' },
        @{ num=2; title='Network Layer Protocols and Routing'; topics='IPv4 addressing, subnetting, CIDR, Distance Vector (RIP), Link State (OSPF), BGP.' },
        @{ num=3; title='Transport Layer Protocols'; topics='UDP, TCP segment structure, connection management, flow control, TCP congestion control.' },
        @{ num=4; title='Application Layer Services'; topics='DNS, SMTP, POP3, HTTP/1.1, HTTP/2, FTP, socket programming.' },
        @{ num=5; title='Network Security and Modern Architectures'; topics='Encryption, digital signatures, SSL/TLS, firewalls, software-defined networking.' }
    ) $true '' @(
        @{ id='pccst502-cn-notes'; type='notes'; module=1; title='Computer Networks Complete Modules 1-5 Lecture Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCAIT501' 'Machine Learning' 's5' 'AI' @('AI') 'PCC' 'Group A Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Introduction to Learning Paradigms & Linear Regression'; topics='Supervised/unsupervised, loss functions, gradient descent, linear and polynomial regression, ridge/lasso.' },
        @{ num=2; title='Classification Models'; topics='Logistic regression, decision trees, entropy, information gain, Support Vector Machines (SVM), kernel trick.' },
        @{ num=3; title='Ensemble Learning'; topics='Bagging, Random Forests, Boosting: AdaBoost, Gradient Boosting, XGBoost.' },
        @{ num=4; title='Unsupervised Learning and Dimensionality Reduction'; topics='K-Means, hierarchical clustering, Principal Component Analysis (PCA), t-SNE.' },
        @{ num=5; title='Model Evaluation and Validation'; topics='Cross-validation, bias-variance trade-off, precision, recall, F1, ROC-AUC, hyperparameter tuning.' }
    ) $true '' @(
        @{ id='pcait501-notes'; type='notes'; module=1; title='Machine Learning Modules 1-5 Complete Course Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCECT501' 'Digital Signal Processing (DSP)' 's5' 'ECE' @('ECE') 'PCC' 'Group B Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Discrete Fourier Transform (DFT) & Properties'; topics='DFT definition, circular convolution, linear convolution using DFT, properties of DFT.' },
        @{ num=2; title='Fast Fourier Transform (FFT) Algorithms'; topics='Radix-2 DIT and DIF FFT algorithms, butterfly computation, computational complexity.' },
        @{ num=3; title='Design of IIR Digital Filters'; topics='Butterworth and Chebyshev analog approximations, bilinear transformation and impulse invariance methods.' },
        @{ num=4; title='Design of FIR Digital Filters'; topics='Linear phase FIR filters, windowing methods (Hamming, Hanning, Blackman), frequency sampling.' },
        @{ num=5; title='Finite Word Length Effects and DSP Processors'; topics='Quantization noise, limit cycle oscillations, overview of programmable DSP architectures.' }
    ) $true '' @(
        @{ id='pcect501-notes'; type='notes'; module=1; title='Digital Signal Processing Complete Handwritten Lecture Notes & Algorithms'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCEET501' 'Power Systems - I' 's5' 'EEE' @('EEE') 'PCC' 'Group B Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Power Generation & Economics'; topics='Conventional and renewable generation, load curves, load factor, diversity factor, tariffs.' },
        @{ num=2; title='Transmission Line Parameters'; topics='Resistance, skin effect, inductance and capacitance calculations for 1-phase and 3-phase lines, transposition.' },
        @{ num=3; title='Performance of Transmission Lines'; topics='Short, medium (nominal-T and Pi), and long line solutions, ABCD parameters, Ferranti effect.' },
        @{ num=4; title='Overhead Lines Mechanical Design & Insulators'; topics='Sag and tension calculations, insulators: pin, suspension, string efficiency.' },
        @{ num=5; title='Underground Cables & Corona Phenomenon'; topics='Cable construction, capacitance grading, corona phenomenon, critical disruptive voltage.' }
    ) $true '' @(
        @{ id='pceet501-notes'; type='notes'; module=1; title='Power Systems - I Transmission Line Calculations & Insulators Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCMET501' 'Design of Machine Elements - I' 's5' 'MECH' @('MECH') 'PCC' 'Group C Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Static Failure Theories in Machine Design'; topics='Stress concentration, factor of safety, failure theories: maximum principal stress, shear stress, distortion energy.' },
        @{ num=2; title='Fatigue Failure Criteria'; topics='Endurance limit, modifying factors, fatigue design: Goodman, Soderberg, Gerber criteria.' },
        @{ num=3; title='Design of Threaded Fasteners and Welded Joints'; topics='Bolted connections with pre-load, eccentric loading, butt and fillet welded joints.' },
        @{ num=4; title='Design of Transmission Shafts, Keys and Couplings'; topics='Shaft design based on strength and rigidity, ASME code, keys, rigid and flexible couplings.' },
        @{ num=5; title='Design of Helical and Leaf Springs'; topics='Stresses and deflection in helical compression/tension springs, Wahl factor, multi-leaf springs.' }
    ) $true '' @(
        @{ id='pcmet501-notes'; type='notes'; module=1; title='Design of Machine Elements Modules 1-5 Lecture Notes & Data Book Guide'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCCET501' 'Design of Concrete Structures' 's5' 'CIVIL' @('CIVIL') 'PCC' 'Group C Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Limit State Principles & Singly Reinforced Beams'; topics='IS 456 limit state design philosophy, partial safety factors, singly reinforced beam design.' },
        @{ num=2; title='Doubly Reinforced and Flanged Beams'; topics='Design of doubly reinforced rectangular beams, T-beams, and L-beams, moment of resistance.' },
        @{ num=3; title='Shear, Bond, Anchorage and Torsion'; topics='Shear reinforcement, bond stress, development length, combined bending and torsion.' },
        @{ num=4; title='Design of Slabs and Staircases'; topics='One-way and two-way slabs with corners held down, doglegged staircase design.' },
        @{ num=5; title='Design of Columns and Isolated Footings'; topics='Axially loaded short columns with lateral ties, isolated pad footing design.' }
    ) $true '' @(
        @{ id='pccet501-notes'; type='notes'; module=1; title='Design of Concrete Structures IS 456 Solved Sheets & Formula Notes'; source='MACE Civil Department / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

# --- S6 ---
Add-Course 'PCCST601' 'Compiler Design' 's6' 'CSE' @('CSE') 'PCC' 'Group A Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Lexical Analysis and Formal Languages'; topics='Compiler architecture, LEX, regular expressions, finite automata.' },
        @{ num=2; title='Parsing Techniques & Parser Generators'; topics='Top-down and bottom-up parsing, LL(1), LR(0), SLR, LALR, YACC.' },
        @{ num=3; title='Syntax Directed Translation'; topics='Syntax-directed definitions, attribute evaluation, translation schemes.' },
        @{ num=4; title='Intermediate Code & Runtime Environments'; topics='Three address code, quadruples, triples, symbol tables, storage allocation.' },
        @{ num=5; title='Code Optimization and Target Code Generation'; topics='Control flow graphs, DAG representation, peephole optimization, register allocation.' }
    ) $true '' @(
        @{ id='pccst601-notes'; type='notes'; module=1; title='Compiler Design Modules 1-5 Complete Course Notes'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCDST601' 'Data Visualization and Storytelling' 's6' 'DS' @('DS') 'PCC' 'Group A - Data Science Core' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Visual Perception and Visualization Design'; topics='Perceptual psychology, Gestalt principles, visual encoding, ethics in visualization.' },
        @{ num=2; title='Exploratory & Explanatory Charts'; topics='Distribution plots, scatter matrix, heatmap, boxplots, multi-dimensional representations.' },
        @{ num=3; title='Interactive Visualization Libraries'; topics='Dashboards with Plotly, Seaborn, Tableau, and D3.js fundamentals.' },
        @{ num=4; title='Spatial and Temporal Data Visualization'; topics='Geographical maps, choropleth maps, time-series visualizations, animated charts.' },
        @{ num=5; title='Data Storytelling & Executive Dashboards'; topics='Narrative structure in analytics, audience-centric design, dashboard KPIs.' }
    ) $true '' @(
        @{ id='pcdst601-notes'; type='notes'; module=1; title='Data Visualization Lecture Slides & Dashboard Guides'; source='KTUNotes.in / MACE Data Science Lab'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCAIT601' 'Deep Learning & Neural Networks' 's6' 'AI' @('AI') 'PCC' 'Group A - AI Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Neural Network Foundations'; topics='Perceptron, multi-layer perceptron, activation functions, backpropagation algorithm, loss functions.' },
        @{ num=2; title='Optimization and Regularization in Deep Learning'; topics='Gradient descent variants (SGD, Adam), dropout, batch normalization, weight decay.' },
        @{ num=3; title='Convolutional Neural Networks (CNNs)'; topics='Convolution operation, pooling, CNN architectures: LeNet, AlexNet, VGG, ResNet, vision applications.' },
        @{ num=4; title='Recurrent Neural Networks (RNNs)'; topics='Sequence modeling, vanishing gradients in RNNs, LSTM, GRU, sequence-to-sequence models.' },
        @{ num=5; title='Attention Mechanisms and Transformer Basics'; topics='Self-attention mechanism, Multi-head attention, Transformer architecture overview.' }
    ) $true '' @(
        @{ id='pcait601-notes'; type='notes'; module=1; title='Deep Learning Complete Lecture Modules & Architectures'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCECT601' 'VLSI Circuit Design' 's6' 'ECE' @('ECE') 'PCC' 'Group B Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='MOS Inverter Circuits & DC Characteristics'; topics='NMOS and CMOS inverters, voltage transfer characteristics, noise margins, delay estimations.' },
        @{ num=2; title='Combinational MOS Logic Circuits'; topics='Static CMOS design, dynamic logic, pass-transistor logic, transmission gates, logical effort analysis.' },
        @{ num=3; title='Sequential MOS Logic Circuits'; topics='Latches, flip-flops, clocked dynamic registers, setup and hold time considerations.' },
        @{ num=4; title='Semiconductor Memories & Testing'; topics='SRAM, DRAM cells, ROM arrays. VLSI testing: fault models, scan paths, BIST.' }
    ) $true '' @(
        @{ id='pcect601-notes'; type='notes'; module=1; title='VLSI Circuit Design Lecture Notes & Layout Diagrams'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCEET601' 'Power Systems - II (Analysis & Control)' 's6' 'EEE' @('EEE') 'PCC' 'Group B Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Per-Unit Representation & Symmetrical Fault Analysis'; topics='Per-unit quantities, impedance diagrams, symmetrical 3-phase fault calculations, circuit breakers.' },
        @{ num=2; title='Symmetrical Components & Unsymmetrical Faults'; topics='Sequence networks of machines and lines. LG, LL, LLG fault analysis.' },
        @{ num=3; title='Power Flow Analysis'; topics='Bus classification, Gauss-Seidel and Newton-Raphson load flow methods, Fast Decoupled Load Flow.' },
        @{ num=4; title='Power System Stability'; topics='Rotor dynamics, swing equation, equal area criterion, transient stability enhancement.' }
    ) $true '' @(
        @{ id='pceet601-notes'; type='notes'; module=1; title='Power Systems - II Fault Analysis & Load Flow Notes'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCMET601' 'Heat and Mass Transfer' 's6' 'MECH' @('MECH') 'PCC' 'Group C Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Conduction Heat Transfer'; topics='Fourier law, 1D steady-state conduction through composite walls, critical radius, fins.' },
        @{ num=2; title='Convection Heat Transfer'; topics='Boundary layer theory, forced convection over flat plates, flow through pipes, free convection.' },
        @{ num=3; title='Radiation Heat Transfer'; topics='Black body radiation laws, shape factors, radiation shields.' },
        @{ num=4; title='Heat Exchangers and Mass Transfer'; topics='LMTD and NTU methods for heat exchangers, Fick law of diffusion, mass transfer coefficients.' }
    ) $true '' @(
        @{ id='pcmet601-notes'; type='notes'; module=1; title='Heat and Mass Transfer Solved Numerical Problems & Formula Book'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCCET601' 'Design of Steel Structures' 's6' 'CIVIL' @('CIVIL') 'PCC' 'Group C Core' 4 '3-1-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Structural Steel Fasteners & Joint Design'; topics='Bolted connections, welded connections, limit state design of connections under axial and eccentric loads.' },
        @{ num=2; title='Design of Tension Members'; topics='Net effective area, shear lag, design of axially loaded tension members, lug angles.' },
        @{ num=3; title='Design of Compression Members'; topics='Column buckling, effective length, design of simple and built-up compression members, lacing and battening.' },
        @{ num=4; title='Design of Steel Beams'; topics='Laterally supported and unsupported beams, bending and shear strength, web buckling and crippling.' }
    ) $true '' @(
        @{ id='pccet601-notes'; type='notes'; module=1; title='Design of Steel Structures IS 800 Limit State Worked Sheets'; source='MACE Civil Wing / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

# --- S7 ---
Add-Course 'PCCST701' 'Cloud Computing & Distributed Infrastructure' 's7' 'CSE' @('CSE','DS') 'PCC' 'Group A Core' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Cloud Architecture & Service Models'; topics='NIST model, IaaS, PaaS, SaaS, virtualization, hypervisors.' },
        @{ num=2; title='Cloud Infrastructure and Storage Systems'; topics='Distributed file systems, S3, GCS, block vs object storage, cloud databases.' },
        @{ num=3; title='Containers and Serverless Computing'; topics='Docker, Kubernetes orchestration, microservices, serverless compute (AWS Lambda).' },
        @{ num=4; title='Cloud Security and Resource Scheduling'; topics='IAM, cloud security compliance, autoscaling.' },
        @{ num=5; title='Cloud Migration & Edge/Fog Computing'; topics='Migration strategies, edge computing architecture, IoT-cloud convergence.' }
    ) $true '' @(
        @{ id='pccst701-notes'; type='notes'; module=1; title='Cloud Computing & Distributed Systems Lecture Summaries'; source='KTUNotes.in / Verified Academic Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCAIT701' 'Reinforcement Learning and Autonomous Systems' 's7' 'AI' @('AI') 'PCC' 'Group A Core' 3 '3-0-0-0' `
    'Official Curriculum Guidelines Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Markov Decision Processes (MDP)'; topics='Agent, environment, reward hypothesis, Bellman equations, value functions.' },
        @{ num=2; title='Dynamic Programming & Monte Carlo Methods'; topics='Policy and value iteration, model-free prediction and control, on-policy Monte Carlo.' },
        @{ num=3; title='Temporal Difference Learning'; topics='TD(0), SARSA, Q-Learning, exploration vs exploitation, multi-armed bandits.' },
        @{ num=4; title='Deep Reinforcement Learning'; topics='DQN, experience replay, policy gradients, actor-critic methods.' }
    ) $true '' @(
        @{ id='pcait701-notes'; type='notes'; module=1; title='Reinforcement Learning Foundations & MDP Lecture Notes'; source='KTUNotes.in / Academic Cell Archive'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCECT701' 'Microwave and Optical Communication' 's7' 'ECE' @('ECE') 'PCC' 'Group B Core' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Microwave Transmission Lines & Waveguides'; topics='Rectangular waveguides, TE and TM modes, cut-off frequency, guide wavelength.' },
        @{ num=2; title='Microwave Semiconductor Devices & Tubes'; topics='Gunn diode, IMPATT diode, Klystron amplifier, Magnetron oscillator.' },
        @{ num=3; title='Optical Fiber Transmission Characteristics'; topics='Attenuation, dispersion (chromatic, PMD), non-linear effects in fibers.' },
        @{ num=4; title='Optical Sources, Detectors and WDM'; topics='LEDs, Laser diodes, PIN and APD photodetectors, Wavelength Division Multiplexing.' }
    ) $true '' @(
        @{ id='pcect701-notes'; type='notes'; module=1; title='Microwave and Optical Communication Modules 1-4 Complete Notes'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCEET701' 'Electric Vehicles and Smart Grid Technologies' 's7' 'EEE' @('EEE') 'PCC' 'Group B Core' 3 '3-0-0-0' `
    'Official Curriculum Guidelines Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Electric Vehicle Architecture & Dynamics'; topics='EV powertrain, vehicle resistance, tractive effort, battery technologies, BMS.' },
        @{ num=2; title='Electric Motors and Power Electronics for EVs'; topics='BLDC motors, PMSM motors, DC-DC converters, motor controllers.' },
        @{ num=3; title='Smart Grid Architecture and Metering'; topics='Smart grid vs conventional grid, Advanced Metering Infrastructure (AMI), PMUs.' },
        @{ num=4; title='Renewable Energy Integration & Microgrids'; topics='Solar/wind grid integration, energy storage systems, microgrid operation, V2G.' }
    ) $true '' @(
        @{ id='pceet701-notes'; type='notes'; module=1; title='Electric Vehicles & Smart Grid Technologies Complete Notes'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCMET701' 'Mechatronics and Industrial Automation' 's7' 'MECH' @('MECH') 'PCC' 'Group C Core' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Mechatronic System Architecture & Sensors'; topics='Key elements, displacement, position, proximity, velocity, pressure sensors.' },
        @{ num=2; title='Actuation Systems'; topics='Pneumatic and hydraulic actuators, control valves, stepper motors, servo motors.' },
        @{ num=3; title='Microcontroller & PLC Programming'; topics='Microcontroller architecture, PLCs, ladder logic programming, timers, counters.' },
        @{ num=4; title='Industrial Robotics and CNC Systems'; topics='Robot kinematics, end effectors, SCADA systems, Computer Numerical Control (CNC).' }
    ) $true '' @(
        @{ id='pcmet701-notes'; type='notes'; module=1; title='Mechatronics & Automation Modules 1-4 Complete Notes'; source='KTUNotes.in / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

Add-Course 'PCCET701' 'Quantity Surveying, Estimation and Valuation' 's7' 'CIVIL' @('CIVIL') 'PCC' 'Group C Core' 3 '3-0-0-0' `
    'Official Syllabus Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Estimation Principles & Quantity Take-off'; topics='Types of estimates, item rate analysis, units of measurement, centre-line and long-wall short-wall methods.' },
        @{ num=2; title='Rate Analysis and Specifications'; topics='Standard data book, rate analysis for concrete, masonry, plastering, specifications.' },
        @{ num=3; title='Contracts, Tendering and Project Accounts'; topics='Contract types, tender documents, EMD, security deposit, measurement books.' },
        @{ num=4; title='Valuation of Real Properties'; topics='Gross/net income, depreciation, rental method, land and building method, scrap value.' }
    ) $true '' @(
        @{ id='pccet701-notes'; type='notes'; module=1; title='Quantity Surveying & Estimation Complete Lecture Notes'; source='MACE Civil Wing / Verified Resource'; driveId='1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR'; driveUrl='https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    )

# --- S8 ---
Add-Course 'PCCST801' 'Comprehensive Course Viva & Capstone Project' 's8' 'CSE' @('CSE','DS','AI','ECE','EEE','MECH','CIVIL') 'PW' 'Common University Core' 6 '0-0-12-0' `
    'Official Curriculum Guidelines Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Problem Formulation & Literature Survey'; topics='Identification of engineering problem, societal relevance, literature review, objectives formulation.' },
        @{ num=2; title='System Architecture & Mathematical Modeling'; topics='Design of system components, mathematical modeling, algorithm development, feasibility analysis.' },
        @{ num=3; title='Implementation and Experimental Setup'; topics='Hardware fabrication, software implementation, integration testing, optimization.' },
        @{ num=4; title='Performance Analysis & Results Benchmarking'; topics='Experimental validation, error analysis, benchmarking against state-of-the-art results.' },
        @{ num=5; title='Technical Thesis, IPR & Oral Examination'; topics='Preparation of project report following KTU guidelines, technical presentation, oral defence and viva voce.' }
    ) $false 'Official KTU curriculum guidelines active. Supplementary study notes are not applicable for Capstone Project Phase II & Comprehensive Viva (evaluated via viva-voce and thesis defense).' @()

Add-Course 'PCCST802' 'Industrial Internship & Technical Seminar' 's8' 'CSE' @('CSE','DS','AI','ECE','EEE','MECH','CIVIL') 'PW' 'Common University Core' 2 '0-0-4-0' `
    'Official Curriculum Guidelines Published' 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme' 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech' `
    @(
        @{ num=1; title='Industrial Training / Internship'; topics='Minimum 4 to 6 weeks of industry internship or research laboratory training, logging daily activity diaries, and organizational structure analysis.' },
        @{ num=2; title='Technical Seminar & Report Writing'; topics='Literature survey on emerging technical topics, preparation of technical report following KTU format, oral presentation and evaluation.' }
    ) $false 'Official KTU curriculum guidelines active. Supplementary study notes are not applicable for Internship & Seminar.' @()

$json = $courses | ConvertTo-Json -Depth 10

$fileHeader = @"
/**
 * Official KTU B.Tech Full Time 2024 Scheme Curriculum & Study Materials Database
 * Source of Truth: APJ Abdul Kalam Technological University (KTU)
 * Official Portal: https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech
 *
 * Groups:
 * - Group A: Computer and Information Science (CSE, DS, AI, IT, CSD)
 * - Group B: Electrical Science (ECE, EEE, AEI, Robotics)
 * - Group C: Physical Science / Core Engineering (MECH, CIVIL, Chemical)
 * - Group D: Life Sciences & Allied Engineering
 */

const KTU_2024_CURRICULUM_DATA = $json;

if (typeof window !== 'undefined') {
  window.KTU_2024_CURRICULUM_DATA = KTU_2024_CURRICULUM_DATA;
}
"@

Set-Content -Path "js/ktu-2024-curriculum-data.js" -Value $fileHeader -Encoding UTF8
Set-Content -Path "asc/js/ktu-2024-curriculum-data.js" -Value $fileHeader -Encoding UTF8
Write-Host "Generated $($courses.Count) courses in KTU 2024 database!"
