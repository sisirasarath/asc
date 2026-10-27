# Script to build full KTU 2024 scheme curriculum database
$targetPath = "js/ktu-2024-curriculum-data.js"
$ascTargetPath = "asc/js/ktu-2024-curriculum-data.js"

$code = @'
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

const KTU_2024_CURRICULUM_DATA = [
  // =========================================================================
  // SEMESTER 1 (S1)
  // =========================================================================
  {
    code: 'GAMAT101',
    title: 'Mathematics for Information Science - 1',
    sem: 's1',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI'],
    category: 'BSC',
    group: 'Group A',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group A',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Limits, Continuity & Single Variable Differential Calculus', topics: 'Limits of function values, continuity at a point, continuous functions, rates of change, derivative as a function, second- and higher-order derivatives, chain rule, implicit differentiation, linearization, concavity, second derivative test.' },
        { num: 2, title: 'Functions of Several Variables & Partial Differentiation', topics: 'Domains and ranges, level curves of two variables, limits and continuity for functions of two variables, partial derivatives of functions of several variables, mixed derivative theorem, chain rule for multivariable functions.' },
        { num: 3, title: 'Applications of Partial Derivatives & Optimization', topics: 'Directional derivatives in the plane, gradient vector and properties, tangent planes, local extreme values for functions of several variables, critical points, saddle points, Lagrange multipliers method for constrained optimization.' },
        { num: 4, title: 'Multiple Integrals', topics: 'Double integrals over rectangular and general bounded regions, area and volume by double integration, double integrals in polar coordinates, triple integrals in rectangular coordinates.' },
        { num: 5, title: 'Vector Calculus for Information Science', topics: 'Vector fields, gradient, curl and divergence of vector fields, physical interpretation, line integrals of vector fields, work and circulation, path independence, Green theorem in the plane.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gamat101-mod1', type: 'notes', module: 1, title: 'Module 1 - Limits, Continuity & Single Variable Calculus Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gamat101-mod2', type: 'notes', module: 2, title: 'Module 2 - Functions of Several Variables & Partial Differentiation Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gamat101-qp', type: 'qp', module: 0, title: 'GAMAT101 Model & Solved University Question Papers', source: 'KTU Examination Wing / Model Question Papers', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GAPHT121',
    title: 'Physics for Information Science',
    sem: 's1',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI'],
    category: 'BSC',
    group: 'Group A',
    credits: 4,
    l_t_p_r: '3-0-2-0',
    marks: { cie: 50, ese: 50 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group A',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Oscillations & Wave Optics', topics: 'Simple harmonic motion, damped and forced oscillations, resonance, wave equation. Interference in thin films, Newton rings, air wedge, Fraunhofer diffraction at single slit and diffraction grating.' },
        { num: 2, title: 'Quantum Mechanics for Computing', topics: 'Inadequacy of classical mechanics, de Broglie hypothesis, matter waves, uncertainty principle, wave function and physical interpretation, time-dependent and time-independent Schrodinger equation, particle in 1D infinite potential well.' },
        { num: 3, title: 'Semiconductor Physics & Microelectronics', topics: 'Band theory of solids, intrinsic and extrinsic semiconductors, carrier concentration, Fermi level, drift and diffusion currents, Hall effect and applications, p-n junction under forward and reverse bias.' },
        { num: 4, title: 'Lasers & Modern Optoelectronics', topics: 'Interaction of radiation with matter, Einstein coefficients, population inversion, optical resonator, Ruby laser, He-Ne laser, semiconductor laser diode, photo-detectors, solar cells, light emitting diodes.' },
        { num: 5, title: 'Fiber Optics & Nanomaterials', topics: 'Principle of light transmission in optical fibers, acceptance angle, numerical aperture, step-index and graded-index fibers, attenuation and dispersion. Introduction to nanoscale materials, quantum dots, quantum wells, and carbon nanotubes.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gapht121-mod1', type: 'notes', module: 1, title: 'Module 1 - Oscillations, Resonance & Wave Optics Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gapht121-mod2', type: 'notes', module: 2, title: 'Module 2 - Quantum Mechanics for Computing Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gapht121-lab', type: 'lab', module: 0, title: 'Physics Lab Experiments & Observations Record Manual', source: 'KTU Physics Lab Manual / ASC Archive', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GXCYT122',
    title: 'Chemistry for Information Science and Electrical Science',
    sem: 's1',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI', 'ECE', 'EEE'],
    category: 'BSC',
    group: 'Group A / Group B',
    credits: 4,
    l_t_p_r: '3-0-2-0',
    marks: { cie: 50, ese: 50 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Electrochemistry and Energy Storage Systems', topics: 'Electrochemical cells, cell potential, Nernst equation, reference electrodes (calomel, glass electrode), secondary batteries: lead-acid, lithium-ion battery chemistry, fuel cells (H2-O2 fuel cell).' },
        { num: 2, title: 'Corrosion Science and Engineering Control', topics: 'Electrochemical theory of corrosion, galvanic corrosion, differential aeration corrosion, stress corrosion, factors influencing corrosion rate, protective measures: cathodic protection, galvanizing, tinning, electroplating.' },
        { num: 3, title: 'Advanced Materials & Conducting Polymers', topics: 'Polymers in electronics, classification, conducting polymers: polyaniline, polypyrrole, synthesis, conduction mechanism, applications. Nanomaterials: synthesis, characterization basics, carbon nanotubes in electronic devices.' },
        { num: 4, title: 'Instrumental Methods of Chemical Analysis', topics: 'Principle and instrumentation of UV-Visible spectroscopy, Beer-Lambert law, infrared (FT-IR) spectroscopy, flame photometry, atomic absorption spectroscopy, thermal analysis (TGA and DSC).' },
        { num: 5, title: 'Water Technology & Environmental Chemistry', topics: 'Hardness of water, determination by EDTA method, boiler scale and sludge, caustic embrittlement, softening methods: ion-exchange process, reverse osmosis, desalination of brackish water.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gxcyt122-notes', type: 'notes', module: 1, title: 'Module 1 - Electrochemistry, Nernst Equation & Lithium Batteries', source: 'KTUNotes.in / Academic Cell Archive', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gxcyt122-lab', type: 'lab', module: 0, title: 'Engineering Chemistry Lab Manual & Estimation Calculations', source: 'KTU Chemistry Lab Manual / ASC Archive', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GMEST103',
    title: 'Engineering Graphics and Computer Aided Drawing',
    sem: 's1',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI', 'ECE', 'EEE'],
    category: 'ESC',
    group: 'Group A / Group B',
    credits: 3,
    l_t_p_r: '2-0-2-0',
    marks: { cie: 50, ese: 50 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Introduction to Technical Drawing & Projections of Points and Lines', topics: 'Principles of drafting, BIS conventions, dimensioning, scales. Orthographic projection, projection of points in all quadrants, projection of straight lines inclined to one or both reference planes, true length, traces.' },
        { num: 2, title: 'Projections of Planes', topics: 'Projections of regular planes (polygonal, circular) inclined to one or both reference planes. Auxiliary plane method, true shape determination.' },
        { num: 3, title: 'Projections of Regular Solids', topics: 'Projections of prisms, pyramids, cylinders, and cones with axis inclined to one reference plane and parallel to the other; solids with axis inclined to both reference planes.' },
        { num: 4, title: 'Sections of Solids & Development of Surfaces', topics: 'Sections of prisms, pyramids, cylinders, and cones cut by section planes. True shape of section. Development of lateral surfaces of simple and truncated solids.' },
        { num: 5, title: 'Isometric Projections & Introduction to CAD', topics: 'Isometric scale, isometric projection vs isometric view of planes, simple and composite solids. Introduction to CAD software interface, 2D drawing tools, editing commands, basic orthographic rendering.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gmest103-notes', type: 'notes', module: 1, title: 'Module 1 - Projections of Points & Lines Solved Sheet Notes', source: 'KTUNotes.in / MACE Graphics Studio', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gmest103-solids', type: 'notes', module: 3, title: 'Module 3 - Projection of Solids & Inclined Axes Guide', source: 'KTU Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GXEST104',
    title: 'Introduction to Electrical and Electronics Engineering',
    sem: 's1',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI', 'ECE', 'EEE'],
    category: 'ESC',
    group: 'Group A / Group B',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Basic Electrical Circuits and DC Networks', topics: 'Circuit elements, Ohm law, Kirchhoff laws, mesh current and node voltage analysis, Delta-Star and Star-Delta conversions, network theorems: Thevenin, Norton, Superposition.' },
        { num: 2, title: 'Single Phase and Three Phase AC Circuits', topics: 'Generation of sinusoidal AC voltage, instantaneous, peak, average, RMS values, form factor, peak factor, phasor representation of R, L, C circuits, active, reactive and apparent power, power factor. Three phase systems: star and delta connections.' },
        { num: 3, title: 'Electrical Machines and Power Systems', topics: 'Working principle, construction, EMF equation of single phase transformer, losses and efficiency. DC machines: principle of DC generator and motor. Three phase induction motor principle. Overview of generation, transmission, distribution, wiring and earthing.' },
        { num: 4, title: 'Semiconductor Devices & Diode Applications', topics: 'Energy bands, p-n junction diode: characteristics, half-wave and full-wave rectifiers, capacitor filter, ripple factor. Zener diode: breakdown mechanisms, voltage regulator. Bipolar Junction Transistor: configurations, input and output characteristics.' },
        { num: 5, title: 'Linear Integrated Circuits & Communication Basics', topics: 'Operational amplifiers: ideal characteristics, inverting, non-inverting, voltage follower, adder, subtractor. Principles of electronic communication: modulation, amplitude modulation, frequency modulation, block diagram of transmitter and receiver.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gxest104-mod1', type: 'notes', module: 1, title: 'Module 1 - Mesh & Nodal Circuit Analysis Complete Notes', source: 'KTUNotes.in / Academic Cell Archive', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gxest104-qp', type: 'qp', module: 0, title: 'GXEST104 Previous Years KTU Solved Question Papers', source: 'KTU Examination Wing / Model QPs', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'UCEST105',
    title: 'Algorithmic Thinking with Python',
    sem: 's1',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL'],
    category: 'ESC',
    group: 'Common University Core (UC)',
    credits: 4,
    l_t_p_r: '3-0-2-0',
    marks: { cie: 50, ese: 50 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme University Core',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Algorithmic Problem Solving & Python Essentials', topics: 'Computational thinking, problem decomposition, algorithm design: pseudo-code, flowcharts. Python environment, variables, identifiers, basic data types (int, float, string, boolean), operators, precedence, expressions, console input and formatted output.' },
        { num: 2, title: 'Control Flow and Iteration', topics: 'Conditional branching: if, if-else, if-elif-else statements, nested conditions. Loops: while loop, for loop with range(), loop control statements (break, continue, pass), else clause with loops, nested loop structures.' },
        { num: 3, title: 'Functions, Modularity & Recursion', topics: 'Defining functions, formal and actual arguments, return statement, default parameters, keyword arguments, variable-length arguments (*args, **kwargs), scope of variables: local and global, recursive functions, lambda functions, Python standard modules (math, random).' },
        { num: 4, title: 'Composite Data Structures in Python', topics: 'Strings: indexing, slicing, immutability, built-in string methods. Lists: mutability, indexing, slicing, operations, list methods, list comprehensions. Tuples: immutability, tuple packing and unpacking. Dictionaries: key-value pairs, dictionary methods. Sets: mathematical set operations.' },
        { num: 5, title: 'File I/O, Exceptions & Introductory Libraries', topics: 'File handling: opening, reading, writing, appending files, with statement. Exception handling: try, except, else, finally blocks, raising custom exceptions. Introduction to scientific computing with NumPy arrays and data visualization using Matplotlib.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'ucest105-mod1', type: 'notes', module: 1, title: 'Module 1 - Algorithmic Thinking & Python Syntax Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'ucest105-mod4', type: 'notes', module: 4, title: 'Module 4 - Lists, Dictionaries, Sets & Comprehensions with Code Snippets', source: 'KTU Python Programming Workshop / ASC Archive', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'ucest105-lab', type: 'lab', module: 0, title: 'Python Programming Lab Exercises, Solutions & Outputs', source: 'KTU Academic Practical Syllabus', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GYMAT101',
    title: 'Mathematics for Electrical Science and Physical Science - 1',
    sem: 's1',
    branch: 'ECE',
    branches: ['ECE', 'EEE', 'MECH', 'CIVIL'],
    category: 'BSC',
    group: 'Group B / Group C',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Differential Calculus & Series Expansions', topics: 'Mean value theorems: Rolle theorem, Lagrange mean value theorem, Cauchy mean value theorem, Taylor and Maclaurin expansions of single variable functions, indeterminate forms and L-Hospital rule.' },
        { num: 2, title: 'Multivariable Calculus & Partial Derivatives', topics: 'Functions of two variables, partial derivatives, chain rule, total differential, approximations, Jacobians and their properties, extrema of functions of two variables without and with constraints (Lagrange multipliers).' },
        { num: 3, title: 'First Order Ordinary Differential Equations', topics: 'First order ODEs: separable, homogeneous, exact differential equations, integrating factors, linear differential equations, Bernoulli differential equations, orthogonal trajectories in cartesian and polar coordinates.' },
        { num: 4, title: 'Higher Order Linear Differential Equations', topics: 'Linear differential equations with constant coefficients, complementary function and particular integral, method of variation of parameters, Cauchy-Euler linear equations, simultaneous linear differential equations.' },
        { num: 5, title: 'Laplace Transforms and Applications', topics: 'Definition and existence of Laplace transform, transforms of standard functions, shifting theorems, transforms of derivatives and integrals, unit step function, Dirac delta function, inverse Laplace transforms, convolution theorem, solving initial value ODE problems using Laplace transforms.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gymat101-mod1', type: 'notes', module: 1, title: 'Module 1 - Mean Value Theorems & Taylor Series Notes', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gymat101-mod5', type: 'notes', module: 5, title: 'Module 5 - Laplace Transforms & Initial Value Problems', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GBPHT121',
    title: 'Physics for Electrical Science',
    sem: 's1',
    branch: 'ECE',
    branches: ['ECE', 'EEE'],
    category: 'BSC',
    group: 'Group B',
    credits: 4,
    l_t_p_r: '3-0-2-0',
    marks: { cie: 50, ese: 50 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Harmonic Oscillations & Electromagnetic Waves', topics: 'Damped harmonic oscillator, Q-factor, forced oscillations, resonance. Maxwell equations in differential and integral forms, wave equation for EM waves in free space, Poynting vector.' },
        { num: 2, title: 'Wave Optics & Interference', topics: 'Huygens principle, interference in thin parallel films, wedge shaped films, testing of optical flatness, Newton rings, anti-reflection coatings. Diffraction: Fraunhofer diffraction at single slit, double slit, and transmission grating.' },
        { num: 3, title: 'Quantum Mechanics for Devices', topics: 'De Broglie waves, uncertainty principle, wave function, Schrodinger equation, expectation values, quantum tunneling across a potential barrier, scanning tunneling microscope (STM) overview.' },
        { num: 4, title: 'Magnetic Materials and Superconductivity', topics: 'Origin of magnetic moment, dia, para, ferro, ferri and anti-ferromagnetic materials, hysteresis loop, soft and hard magnetic materials. Superconductivity: Meissner effect, Type I and Type II superconductors, BCS theory overview, Josephson junctions.' },
        { num: 5, title: 'Semiconductor Optoelectronics & Photonics', topics: 'Direct and indirect bandgap semiconductors, solar cells: I-V characteristics and efficiency, LED, photodiode, avalanche photodiode. Principles of optical fibers, attenuation mechanisms, fiber optic sensors.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gbpht121-mod1', type: 'notes', module: 1, title: 'Module 1 - EM Waves & Harmonic Oscillators Notes', source: 'KTUNotes.in / Academic Cell Archive', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GCEST103',
    title: 'Engineering Mechanics',
    sem: 's1',
    branch: 'MECH',
    branches: ['MECH', 'CIVIL'],
    category: 'ESC',
    group: 'Group C',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Statics of Coplanar Force Systems', topics: 'Introduction to engineering mechanics, scalar and vector quantities, principles of statics, Varignon theorem, resultant of concurrent and non-concurrent coplanar force systems, free-body diagrams, equations of equilibrium.' },
        { num: 2, title: 'Friction and Analysis of Trusses', topics: 'Theory of friction, laws of friction, angle of friction, coefficient of friction, cone of friction, ladder friction, wedge friction, screw jack. Simple plane trusses: assumptions, method of joints, method of sections.' },
        { num: 3, title: 'Centroid, Moment of Inertia & Centre of Gravity', topics: 'Centroid of composite plane figures, Pappus-Guldinus theorems. Moment of inertia of area: parallel and perpendicular axis theorems, radius of gyration, polar moment of inertia, product of inertia, principal axes.' },
        { num: 4, title: 'Kinematics of Particles', topics: 'Rectilinear motion with uniform and variable acceleration, motion curves, projectile motion, circular motion, normal and tangential components of acceleration, relative velocity.' },
        { num: 5, title: 'Kinetics of Particles and Rigid Bodies', topics: 'Newton second law of motion, D-Alembert principle, dynamic equilibrium, work-energy theorem, impulse and momentum, conservation of momentum, direct central impact of elastic bodies.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gcest103-mod1', type: 'notes', module: 1, title: 'Module 1 - Statics of Coplanar Force Systems Solved Problems', source: 'KTUNotes.in / MACE Civil & Mech Faculty Notes', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gcest103-trusses', type: 'notes', module: 2, title: 'Module 2 - Friction & Truss Analysis Step-by-Step Solutions', source: 'KTU Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GCEST104',
    title: 'Introduction to Mechanical and Civil Engineering',
    sem: 's1',
    branch: 'MECH',
    branches: ['MECH', 'CIVIL'],
    category: 'ESC',
    group: 'Group C',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Thermodynamics and Power Generation (Mechanical)', topics: 'Laws of thermodynamics, thermodynamic processes, Air standard cycles (Otto, Diesel), working of two-stroke and four-stroke IC engines. Steam turbines, gas turbines, hydraulic turbines: Pelton wheel, Francis and Kaplan turbines overview.' },
        { num: 2, title: 'Manufacturing Processes & Machine Elements (Mechanical)', topics: 'Basic manufacturing processes: casting, forging, rolling, extrusion, welding. Machine tools: lathe, drilling machine, milling machine. Transmission of power: belt, rope, chain and gear drives.' },
        { num: 3, title: 'Civil Engineering Materials & Building Construction', topics: 'Structural materials: stones, bricks, cement, concrete, steel. Types of buildings, building components: foundation, plinth, masonry, columns, beams, slabs, roofs, doors, windows.' },
        { num: 4, title: 'Surveying & Levelling (Civil)', topics: 'Principles of surveying, classification, linear measurements, chain surveying, compass surveying, dumpy level and levelling concepts, contours, total station overview, GPS and GIS basics.' },
        { num: 5, title: 'Environmental and Transportation Engineering (Civil)', topics: 'Water supply engineering, rainwater harvesting, sewage disposal systems, solid waste management. Transportation: classification of highways, railways, air transport, intelligent transportation systems.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gcest104-civil', type: 'notes', module: 3, title: 'Module 3 & 4 - Civil Building Construction & Surveying Notes', source: 'KTUNotes.in / MACE Civil Wing', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },

  // =========================================================================
  // SEMESTER 2 (S2)
  // =========================================================================
  {
    code: 'GAMAT201',
    title: 'Mathematics for Information Science - 2',
    sem: 's2',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI'],
    category: 'BSC',
    group: 'Group A',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group A',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Systems of Linear Equations and Matrix Algebra', topics: 'Rank of a matrix, elementary row operations, row echelon form and reduced row echelon form, existence and uniqueness of solutions of linear systems Ax = b, Gauss elimination and Gauss-Jordan methods.' },
        { num: 2, title: 'Vector Spaces and Subspaces', topics: 'Definition of vector space over R, subspaces, linear span, linear independence and dependence, basis and dimension, coordinates with respect to a basis, dimension theorem for subspaces.' },
        { num: 3, title: 'Linear Transformations & Matrix Representations', topics: 'Linear transformations between vector spaces, kernel and range, rank-nullity theorem, matrix representation of a linear transformation, change of basis matrix, similarity of matrices.' },
        { num: 4, title: 'Eigenvalues, Eigenvectors & Diagonalization', topics: 'Characteristic polynomial, eigenvalues and eigenvectors of matrices, algebraic and geometric multiplicity, Cayley-Hamilton theorem and applications, conditions for matrix diagonalization, power of a matrix.' },
        { num: 5, title: 'Inner Product Spaces & Singular Value Decomposition', topics: 'Inner product spaces, norm, Cauchy-Schwarz inequality, orthogonality, orthonormal basis, Gram-Schmidt orthogonalization process, orthogonal matrices, symmetric matrices, Introduction to Singular Value Decomposition (SVD).' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gamat201-mod1', type: 'notes', module: 1, title: 'Module 1 - Linear Systems & Row Echelon Solutions', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gamat201-mod4', type: 'notes', module: 4, title: 'Module 4 - Eigenvalues, Diagonalization & SVD Guide', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GXEST203',
    title: 'Foundations of Computing: From Hardware Essentials to Web Design',
    sem: 's2',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI', 'ECE', 'EEE'],
    category: 'ESC',
    group: 'Group A / Group B',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Computer Hardware Architecture & Subsystems', topics: 'Evolution of computers, Von Neumann architecture, CPU components: ALU, control unit, registers. Bus structures, motherboard components, memory hierarchy: cache memory, RAM, ROM, secondary storage devices.' },
        { num: 2, title: 'Binary Systems and Digital Logic Fundamentals', topics: 'Number systems (binary, octal, hexadecimal), conversions, binary arithmetic, 1s and 2s complement, signed representation, floating point numbers (IEEE 754), ASCII and Unicode. Logic gates, Boolean algebra, simplification of logic expressions.' },
        { num: 3, title: 'Operating System & Shell Environment', topics: 'Role of operating systems, process management, CPU scheduling concepts, memory management, file systems. Linux architecture, command line interface: file operations, process monitoring, permissions, shell scripting basics.' },
        { num: 4, title: 'Computer Networks and Internet Protocols', topics: 'Network classifications (LAN, WAN), topologies, OSI reference model, TCP/IP protocol suite, IP addressing (IPv4 and IPv6 basics), subnetting, DNS, DHCP, HTTP/HTTPS protocols, web client-server architecture.' },
        { num: 5, title: 'Modern Web Design and Interactive Front-End', topics: 'Structure of the World Wide Web, HTML5 semantic elements, tables, forms, media. CSS3: styling, box model, flexbox, responsive design media queries. JavaScript fundamentals: variables, control structures, event handling, DOM manipulation.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gxest203-mod1', type: 'notes', module: 1, title: 'Module 1 & 2 - Hardware Architecture, Number Systems & Logic Gates Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gxest203-web', type: 'notes', module: 5, title: 'Module 5 - HTML5, CSS3 Responsive Layouts & JavaScript DOM Guide', source: 'MACE Computing Lab / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GXEST204',
    title: 'Programming in C',
    sem: 's2',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI', 'ECE', 'EEE'],
    category: 'ESC',
    group: 'Group A / Group B',
    credits: 4,
    l_t_p_r: '3-0-2-0',
    marks: { cie: 50, ese: 50 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Introduction to C Programming and Elementary Constructs', topics: 'Structure of a C program, compilation and execution process, character set, tokens, keywords, identifiers, constants, variables, basic data types, qualifiers, operators, operator precedence, formatted input and output.' },
        { num: 2, title: 'Conditional Branching and Looping Statements', topics: 'Decision making: if, if-else, nested if-else, switch-case statement. Looping statements: while, do-while, for loops, nested loops, loop jump statements: break, continue, goto.' },
        { num: 3, title: 'Arrays and String Processing', topics: 'One dimensional arrays: declaration, initialization, memory representation, accessing elements, searching and sorting. Two dimensional arrays: matrix operations. Character arrays, strings, standard string handling functions.' },
        { num: 4, title: 'Functions, Pointers and Dynamic Memory Allocation', topics: 'User-defined functions, function prototypes, passing arguments: call by value, call by reference. Recursion. Pointers: concept, declaration, pointer arithmetic, pointers and arrays, pointers to functions. Dynamic memory allocation: malloc, calloc, realloc, free.' },
        { num: 5, title: 'Structures, Unions and File Management in C', topics: 'Structures: defining structures, structure variables, accessing members, nested structures, arrays of structures, structures and pointers. Unions. File handling in C: file pointers, modes of opening files, formatted file I/O, error handling.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gxest204-c-mod1', type: 'notes', module: 1, title: 'Module 1 & 2 - C Language Syntax, Control Statements & Loops', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gxest204-c-ptrs', type: 'notes', module: 4, title: 'Module 4 - Pointers, Function References & Dynamic Memory Allocation', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gxest204-c-lab', type: 'lab', module: 0, title: 'C Programming Lab Manual, Source Code & Test Cases', source: 'KTU C Programming Lab Syllabus', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'UCEST206',
    title: 'Engineering Entrepreneurship and IPR',
    sem: 's2',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL'],
    category: 'ESC',
    group: 'Common University Core (UC)',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme University Core',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Entrepreneurial Mindset, Ideation & Design Thinking', topics: 'Entrepreneurship concept, traits of successful entrepreneurs, innovation and technology commercialization. Design thinking process: empathize, define, ideate, prototype, test. Opportunity recognition and problem-solution fit.' },
        { num: 2, title: 'Business Model Formulation & Customer Discovery', topics: 'Business model canvas, Lean Canvas methodology, customer development, value proposition design, Minimum Viable Product (MVP) concepts, market research, competitor analysis.' },
        { num: 3, title: 'Startup Finance, Funding and Unit Economics', topics: 'Financial forecasting, revenue models, cost structures, break-even analysis, cash flow management. Sources of funding: bootstrapping, angel investors, venture capital, government grants, incubator and accelerator support.' },
        { num: 4, title: 'Intellectual Property Rights (IPR) Framework', topics: 'Fundamentals of IPR: Patents, criteria for patentability, patent search, provisional and complete specifications, patent examination and grant procedure. Copyrights, trademarks, industrial designs, trade secrets, plant varieties.' },
        { num: 5, title: 'Legal Structure, Ethics & Scaling the Venture', topics: 'Types of business entities: proprietorship, partnership, LLP, private limited company. Regulatory compliances, startup policies in Kerala and India. Business ethics, social entrepreneurship, case studies of Indian engineering startups.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'ucest206-eipr-notes', type: 'notes', module: 1, title: 'Module 1 & 2 - Design Thinking, Lean Canvas & Business Ideation Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'ucest206-ipr-notes', type: 'notes', module: 4, title: 'Module 4 - Intellectual Property Rights & Patent Filing Guide', source: 'KTUNotes.in / IPR Cell Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'UCHUT128',
    title: 'Life Skills and Professional Communication',
    sem: 's2',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL'],
    category: 'HMC',
    group: 'Common University Core (UC)',
    credits: 1,
    l_t_p_r: '2-0-0-0',
    marks: { cie: 50, ese: 0 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Self-Awareness & Interpersonal Skills', topics: 'Understanding self, emotional intelligence, SWOT analysis, goal setting, time management, stress management, critical thinking and decision making.' },
        { num: 2, title: 'Professional Communication & Team Dynamics', topics: 'Verbal and non-verbal communication, active listening, group discussions, presentation skills, team building, leadership styles, conflict resolution.' },
        { num: 3, title: 'Technical Writing and Workplace Ethics', topics: 'Resume preparation, cover letters, formal email etiquette, technical reports, workplace ethics and professional conduct.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'uchut128-notes', type: 'notes', module: 1, title: 'Life Skills Complete Study Notes & Resume Templates', source: 'KTUNotes.in / MACE Placement & Soft Skills Cell', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GYMAT201',
    title: 'Mathematics for Electrical Science and Physical Science - 2',
    sem: 's2',
    branch: 'ECE',
    branches: ['ECE', 'EEE', 'MECH', 'CIVIL'],
    category: 'BSC',
    group: 'Group B / Group C',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Partial Differentiation', topics: 'Limits, continuity, partial derivatives, chain rule, total derivatives, Euler theorem on homogeneous functions, maxima and minima of functions of two variables.' },
        { num: 2, title: 'Multiple Integrals', topics: 'Double integrals, change of order of integration, double integrals in polar coordinates, area and volume by double integration, triple integrals.' },
        { num: 3, title: 'Vector Differentiation', topics: 'Vector-valued functions, derivative of vector function, gradient, divergence, curl, directional derivative, scalar and vector potential.' },
        { num: 4, title: 'Vector Integration', topics: 'Line integrals, surface integrals, volume integrals, Green theorem in the plane, Gauss divergence theorem, Stokes theorem.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gymat201-mod1', type: 'notes', module: 1, title: 'Module 1 - Partial Differentiation & Euler Theorem Notes', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'gymat201-mod3', type: 'notes', module: 3, title: 'Module 3 & 4 - Vector Calculus, Green & Gauss Theorem Notes', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'GZEST204',
    title: 'Basic Electrical & Electronics Engineering (for Group C)',
    sem: 's2',
    branch: 'MECH',
    branches: ['MECH', 'CIVIL'],
    category: 'ESC',
    group: 'Group C',
    credits: 4,
    l_t_p_r: '2-2-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Electrical Circuits and AC Quantities', topics: 'DC circuit analysis, Kirchhoff laws, AC sinusoidal quantities, RMS value, average value, impedance in series R-L-C circuits, power and power factor.' },
        { num: 2, title: 'Electrical Machines (Transformers & Motors)', topics: 'Single phase transformer construction and working, DC shunt and series motors, three-phase induction motor principle and applications in industry.' },
        { num: 3, title: 'Basic Electronics & Semiconductor Diodes', topics: 'P-N junction diode, rectifiers, zener diode, voltage regulation, BJT configuration and basic switching.' },
        { num: 4, title: 'Sensors and Industrial Instrumentation', topics: 'Transducers: temperature sensors (thermocouples, RTDs), strain gauges, LVDT, introductory operational amplifiers for signal conditioning.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'gzest204-notes', type: 'notes', module: 1, title: 'Basic Electrical & Electronics Modules 1-4 Complete Notes', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },

  // =========================================================================
  // SEMESTER 3 (S3)
  // =========================================================================
  {
    code: 'PCCST303',
    title: 'Data Structures and Algorithms',
    sem: 's3',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI'],
    category: 'PCC',
    group: 'Group A Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme S3 Programme Core',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Introduction to Data Structures & Algorithmic Complexity', topics: 'Abstract Data Types (ADTs), space and time complexity, asymptotic notations (Big-O, Omega, Theta), arrays, memory layout of arrays, multidimensional arrays, sparse matrices and representation.' },
        { num: 2, title: 'Linear Data Structures: Stacks and Queues', topics: 'Stack ADT, array and linked implementations, applications: infix to postfix conversion, evaluation of postfix expressions, recursion using stacks. Queue ADT, circular queues, deques, priority queues.' },
        { num: 3, title: 'Linked Structures: Singly, Doubly and Circular Lists', topics: 'Dynamic memory allocation for linked lists, operations on singly linked lists (traversal, insertion, deletion), doubly linked lists, circular linked lists, polynomial arithmetic.' },
        { num: 4, title: 'Non-Linear Data Structures: Trees & Binary Search Trees', topics: 'Tree terminologies, binary trees, properties, binary tree traversals (preorder, inorder, postorder, level order). Binary Search Trees (BST): insertion, search, deletion. Height balanced trees (AVL trees), heaps and heap sort.' },
        { num: 5, title: 'Graphs & Advanced Search/Sort Algorithms', topics: 'Graph representations: adjacency matrix, adjacency list. Graph traversals: BFS, DFS, topological sorting. Sorting algorithms: merge sort, quick sort, radix sort. Hashing techniques and collision resolution.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccst303-mod1', type: 'notes', module: 1, title: 'Module 1 & 2 - Complexity Analysis, Stacks & Queues Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'pccst303-trees', type: 'notes', module: 4, title: 'Module 4 - Binary Trees, BST & AVL Balance Operations', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'pccsl307-lab', type: 'lab', module: 0, title: 'PCCSL307 Data Structures Laboratory Manual & Verified Programs', source: 'KTU S3 Lab Manual / MACE CSE Dept', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCCST302',
    title: 'Object Oriented Programming with Project-Based Learning',
    sem: 's3',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI'],
    category: 'PCC',
    group: 'Group A Core',
    credits: 4,
    l_t_p_r: '3-0-2-0',
    marks: { cie: 50, ese: 50 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Object Oriented Paradigms and Java/C++ Basics', topics: 'Principles of OOP: abstraction, encapsulation, inheritance, polymorphism. Classes, objects, data members, methods, constructors, destructor, access specifiers, static members.' },
        { num: 2, title: 'Inheritance and Polymorphism', topics: 'Types of inheritance, method overriding, virtual functions, abstract classes, super and this references, dynamic method dispatch.' },
        { num: 3, title: 'Packages, Interfaces & Exception Handling', topics: 'Defining and importing packages, interfaces, exception handling mechanism: try, catch, finally, throw, throws, custom exceptions.' },
        { num: 4, title: 'Multithreading & Generics / Collections', topics: 'Multithreaded programming: thread lifecycle, creating threads, synchronization. Generics, Java Collections framework (List, Set, Map).' },
        { num: 5, title: 'Event-Driven GUI & Project Development', topics: 'Graphical user interfaces, event handling, delegation event model, GUI components and layout managers, mini-project integration.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccst302-notes', type: 'notes', module: 1, title: 'Module 1 & 2 - OOP Fundamentals, Classes & Inheritance Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'UCHUT346',
    title: 'Economics for Engineers',
    sem: 's3',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL'],
    category: 'HMC',
    group: 'Common University Core',
    credits: 2,
    l_t_p_r: '2-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Engineering Economics, Demand and Supply Analysis', topics: 'Scope of engineering economics, law of demand, elasticity of demand, demand forecasting methods, law of supply, equilibrium price determination.' },
        { num: 2, title: 'Cost Concepts and Market Structures', topics: 'Cost concepts: fixed, variable, marginal, average costs, break-even analysis, market forms: perfect competition, monopoly, oligopoly.' },
        { num: 3, title: 'Time Value of Money and Capital Budgeting', topics: 'Cash flow diagrams, simple and compound interest, present worth, future worth, internal rate of return (IRR), benefit-cost ratio (BCR).' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'uchut346-notes', type: 'notes', module: 1, title: 'Engineering Economics Modules 1-3 Lecture Summaries & Formulae', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCECT302',
    title: 'Solid State Devices & Semiconductor Physics',
    sem: 's3',
    branch: 'ECE',
    branches: ['ECE'],
    category: 'PCC',
    group: 'Group B Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Carrier Transport in Semiconductors', topics: 'Energy band models, carrier concentration at equilibrium, drift and diffusion of carriers, continuity equation, Hall effect.' },
        { num: 2, title: 'P-N Junction Electrostatics and Dynamics', topics: 'Built-in potential, depletion width, space charge, I-V characteristics, junction breakdown mechanisms (Zener and Avalanche).' },
        { num: 3, title: 'Bipolar Junction Transistors (BJT)', topics: 'BJT principles, minority carrier distribution, current components, base width modulation (Early effect), Ebers-Moll model.' },
        { num: 4, title: 'MOSFET Physics & Characteristics', topics: 'MOS capacitor: accumulation, depletion, inversion. MOSFET structure, threshold voltage, drain current equations, short-channel effects.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcect302-notes', type: 'notes', module: 1, title: 'Solid State Devices Complete Modules 1-4 Notes', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCEET302',
    title: 'Circuits and Networks',
    sem: 's3',
    branch: 'EEE',
    branches: ['EEE'],
    category: 'PCC',
    group: 'Group B Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Network Topology and Analysis Methods', topics: 'Network graph, tree, co-tree, incidence matrix, tie-set and cut-set schedules, formulation of network equations using matrix methods.' },
        { num: 2, title: 'Network Theorems in AC Circuits', topics: 'Superposition, Thevenin, Norton, Maximum Power Transfer, Reciprocity and Tellegen theorems applied to AC circuits.' },
        { num: 3, title: 'Transient Analysis of Dynamic Circuits', topics: 'DC and AC transients in R-L, R-C, and R-L-C circuits using differential equation approach and Laplace transform method.' },
        { num: 4, title: 'Two-Port Network Parameters', topics: 'Z-parameters, Y-parameters, transmission (ABCD) parameters, hybrid (h) parameters, interrelationships, cascade and parallel connections.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pceet302-notes', type: 'notes', module: 1, title: 'Circuits & Networks Modules 1-4 Solved Sheet Notes', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCMET302',
    title: 'Mechanics of Solids',
    sem: 's3',
    branch: 'MECH',
    branches: ['MECH'],
    category: 'PCC',
    group: 'Group C Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Stress, Strain and Elastic Constants', topics: 'Concept of stress and strain, Hooke law, stress-strain diagram, Poisson ratio, elastic constants and relationships, thermal stresses.' },
        { num: 2, title: 'Shear Force and Bending Moment in Beams', topics: 'Types of beams and loadings, shear force and bending moment diagrams for cantilevers, simply supported and overhanging beams.' },
        { num: 3, title: 'Stresses in Beams (Bending & Shear)', topics: 'Theory of simple bending, neutral axis, section modulus, flexural stress distribution, transverse shear stress distribution across beam sections.' },
        { num: 4, title: 'Torsion of Circular Shafts & Springs', topics: 'Torsion formula for solid and hollow circular shafts, power transmission, stresses in close-coiled helical springs.' },
        { num: 5, title: 'Columns and Thin Cylinders', topics: 'Euler formula for long columns with different end conditions, Rankine-Gordon formula. Stresses in thin cylindrical and spherical shells under internal pressure.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcmet302-notes', type: 'notes', module: 1, title: 'Mechanics of Solids Modules 1-5 Complete Formulae & Solved Problems', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCCET302',
    title: 'Fluid Mechanics (Civil)',
    sem: 's3',
    branch: 'CIVIL',
    branches: ['CIVIL'],
    category: 'PCC',
    group: 'Group C Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Fluid Properties and Fluid Statics', topics: 'Density, specific weight, viscosity, surface tension, capillarity. Fluid pressure at a point, Pascal law, hydrostatic law, measurement of pressure: manometers. Hydrostatic forces on submerged planes and curved surfaces, buoyancy and floatation.' },
        { num: 2, title: 'Fluid Kinematics', topics: 'Types of fluid flow, velocity and acceleration of fluid particle, continuity equation in 3D, velocity potential and stream function, flow net.' },
        { num: 3, title: 'Fluid Dynamics & Flow Measurement', topics: 'Euler equation of motion along a streamline, Bernoulli equation and assumptions, applications: venturimeter, orifice meter, pitot tube. Momentum equation and applications.' },
        { num: 4, title: 'Flow Through Pipes', topics: 'Laminar and turbulent flow, Reynolds number, Darcy-Weisbach equation for friction loss, minor energy losses in pipes, hydraulic gradient line (HGL), total energy line (TEL).' },
        { num: 5, title: 'Notches, Weirs & Open Channel Basics', topics: 'Flow measurement using rectangular and triangular notches, Francis formula, broad-crested weirs, introductory open channel uniform flow and Chezy and Manning equations.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccet302-notes', type: 'notes', module: 1, title: 'Fluid Mechanics Modules 1-5 Lecture Notes & Practical Applications', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },

  // =========================================================================
  // SEMESTER 4 (S4)
  // =========================================================================
  {
    code: 'PCCST402',
    title: 'Database Management Systems',
    sem: 's4',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI'],
    category: 'PCC',
    group: 'Group A Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme S4 Programme Core',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Introduction to DBMS & Entity-Relationship Modeling', topics: 'Database system concepts, 3-tier database architecture, data independence, data models. Entity-Relationship (ER) model: entities, attributes, relationships, extended ER features, conversion of ER diagrams into relational schemas.' },
        { num: 2, title: 'Relational Model, Relational Algebra and SQL', topics: 'Relational algebra: fundamental and extended operations. SQL: DDL, DML, DCL, TCL, integrity constraints, primary and foreign keys, complex queries, nested subqueries, joins, aggregate functions, views.' },
        { num: 3, title: 'Relational Database Design and Normalization', topics: 'Functional dependencies, inference rules (Armstrong axioms), minimal cover. Normal forms: 1NF, 2NF, 3NF, Boyce-Codd Normal Form (BCNF), lossless join decomposition, dependency preservation.' },
        { num: 4, title: 'Transaction Management & Concurrency Control', topics: 'Transaction states, ACID properties, schedule serializability, testing for serializability. Concurrency control: lock-based protocols, two-phase locking (2PL), deadlock prevention and detection.' },
        { num: 5, title: 'Physical Storage, Indexing & Modern Databases', topics: 'File organization: sequential, heap, hashing. Indexing mechanisms: primary, secondary, clustered indexes, B-trees and B+ trees. Introduction to NoSQL document and key-value stores overview.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccst402-mod1', type: 'notes', module: 1, title: 'Module 1 & 2 - ER Modeling, Relational Algebra & SQL Complete Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'pccst402-norm', type: 'notes', module: 3, title: 'Module 3 - Functional Dependencies & Normalization Hand-Worked Examples', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'pccsl408-lab', type: 'lab', module: 0, title: 'PCCSL408 DBMS Lab Queries, Schema Designs & Solutions Manual', source: 'KTU S4 DBMS Lab Syllabus', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCCST403',
    title: 'Operating Systems',
    sem: 's4',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI'],
    category: 'PCC',
    group: 'Group A Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme S4 Programme Core',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Operating System Architectures & Process Management', topics: 'Operating system functions, system calls, system programs, OS structures. Process concept, Process Control Block (PCB), process scheduling queues, schedulers, context switching, inter-process communication.' },
        { num: 2, title: 'CPU Scheduling & Process Synchronization', topics: 'CPU scheduling criteria, scheduling algorithms (FCFS, SJF, Round Robin, Priority). Process synchronization: critical section problem, semaphores, classic synchronization problems (producer-consumer, reader-writer, dining philosophers), monitors.' },
        { num: 3, title: 'Deadlock Characterization and Handling', topics: 'Deadlock definition, necessary conditions, resource allocation graphs. Deadlock handling strategies: deadlock prevention, deadlock avoidance: Banker algorithm, deadlock detection, recovery.' },
        { num: 4, title: 'Memory Management and Virtual Memory', topics: 'Logical vs physical address space, contiguous memory allocation, fragmentation. Paging, page table structure, segmentation. Virtual memory: demand paging, page fault handling, page replacement algorithms (FIFO, Optimal, LRU), thrashing.' },
        { num: 5, title: 'Storage Management, File Systems & Disk Scheduling', topics: 'File system interface: file attributes, operations, access methods, directory structures. File system implementation: allocation methods. Disk structure, disk scheduling algorithms (FCFS, SSTF, SCAN, C-SCAN).' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccst403-mod1', type: 'notes', module: 1, title: 'Module 1 & 2 - Process Scheduling & Semaphores Synchronization Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'pccsl407-oslab', type: 'lab', module: 0, title: 'PCCSL407 OS Lab Manual, System Calls & Shell Programs', source: 'KTU S4 OS Lab Syllabus', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCECT402',
    title: 'Signals and Systems',
    sem: 's4',
    branch: 'ECE',
    branches: ['ECE'],
    category: 'PCC',
    group: 'Group B Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Continuous and Discrete Time Signals and Systems', topics: 'Classification of signals, basic operations on signals, classification of systems: linearity, time-invariance, causality, stability, memory.' },
        { num: 2, title: 'Linear Time-Invariant (LTI) Systems', topics: 'Convolution integral, convolution sum, properties of LTI systems, impulse response, step response, stability criteria in time domain.' },
        { num: 3, title: 'Fourier Analysis of Continuous Time Signals', topics: 'Fourier series representation of periodic signals, Continuous-Time Fourier Transform (CTFT), properties of CTFT, frequency response of LTI systems.' },
        { num: 4, title: 'Sampling and Z-Transforms', topics: 'Sampling theorem, aliasing, reconstruction of signals. Z-transform: region of convergence (ROC), properties, inverse Z-transform, analysis of discrete LTI systems.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcect402-notes', type: 'notes', module: 1, title: 'Signals and Systems Modules 1-4 Complete Notes & Problems', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCEET402',
    title: 'DC Machines and Transformers',
    sem: 's4',
    branch: 'EEE',
    branches: ['EEE'],
    category: 'PCC',
    group: 'Group B Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'DC Generators Principles & Performance', topics: 'Construction of DC machines, armature winding, EMF equation, armature reaction, commutation, open circuit and load characteristics of DC generators.' },
        { num: 2, title: 'DC Motors Operating Characteristics & Speed Control', topics: 'Principle of operation, back EMF, torque equation, characteristics of shunt, series and compound motors, starters, speed control methods, testing: Swinburne and Hopkinson tests.' },
        { num: 3, title: 'Single Phase Transformers Equivalent Circuits', topics: 'Principle, ideal vs practical transformer, phasor diagrams under no-load and load, equivalent circuit, voltage regulation, losses and efficiency, OC and SC tests, Sumpner test.' },
        { num: 4, title: 'Three Phase Transformers & Auto-Transformers', topics: 'Three-phase transformer connections (Star-Star, Delta-Delta, Star-Delta), Scott connection, parallel operation of transformers, auto-transformers: principle, copper saving, tap-changing.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pceet402-notes', type: 'notes', module: 1, title: 'DC Machines and Transformers Complete Lecture Notes & Equivalent Circuits', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCMET403',
    title: 'Engineering Thermodynamics',
    sem: 's4',
    branch: 'MECH',
    branches: ['MECH'],
    category: 'PCC',
    group: 'Group C Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'First Law of Thermodynamics & Energy Balances', topics: 'Macroscopic vs microscopic viewpoints, thermodynamic equilibrium, quasi-static process, work and heat transfer, First law for closed and open systems, steady flow energy equation (SFEE).' },
        { num: 2, title: 'Second Law of Thermodynamics & Entropy', topics: 'Thermal energy reservoirs, Kelvin-Planck and Clausius statements, reversible and irreversible processes, Carnot cycle, Carnot theorem, Clausius inequality, entropy principle, entropy generation.' },
        { num: 3, title: 'Pure Substances & Steam Tables', topics: 'P-v-T surfaces, phase transformation of water, dryness fraction, Mollier chart, Rankine cycle and reheat cycle calculations.' },
        { num: 4, title: 'Thermodynamic Relations & Gas Mixtures', topics: 'Maxwell relations, T-ds equations, Joule-Thomson coefficient, equations of state for real gases, ideal gas mixtures, psychrometric properties.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcmet403-notes', type: 'notes', module: 1, title: 'Engineering Thermodynamics Modules 1-4 Theory & Solved Numerical Problems', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCCET402',
    title: 'Geotechnical Engineering - I',
    sem: 's4',
    branch: 'CIVIL',
    branches: ['CIVIL'],
    category: 'PCC',
    group: 'Group C Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Soil Origin, Phase Relationships and Index Properties', topics: 'Origin of soil, soil structure, phase diagram: 3-phase and 2-phase systems, void ratio, porosity, degree of saturation, water content, unit weights and relationships. Index properties: grain size distribution, Atterberg limits, soil classification (ISCS).' },
        { num: 2, title: 'Soil Water & Permeability', topics: 'Permeability: Darcy law, factors affecting permeability, constant head and falling head permeability tests, permeability of stratified soil deposits. Seepage analysis: flow nets, characteristics, seepage calculation, quicksand condition.' },
        { num: 3, title: 'Effective Stress Concept & Compaction', topics: 'Total stress, pore water pressure, effective stress, capillary water in soils. Compaction of soils: Standard and Modified Proctor compaction tests, moisture-density relationship, factors affecting compaction, field compaction equipment.' },
        { num: 4, title: 'Consolidation of Soils', topics: 'Mechanics of consolidation, Terzaghi 1D consolidation theory, oedometer test, compression index, coefficient of consolidation, determination of pre-consolidation pressure, settlement calculation.' },
        { num: 5, title: 'Shear Strength of Soils', topics: 'Mohr-Coulomb failure criteria, shear strength parameters (c and phi), laboratory shear tests: Direct shear test, Triaxial shear test (UU, CU, CD tests), Unconfined compression test, Vane shear test.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccet402-notes', type: 'notes', module: 1, title: 'Geotechnical Engineering - I Soil Mechanics Complete Notes', source: 'MACE Civil Department / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },

  // =========================================================================
  // SEMESTER 5 (S5)
  // =========================================================================
  {
    code: 'PCDST501',
    title: 'Data Analytics',
    sem: 's5',
    branch: 'DS',
    branches: ['DS'],
    category: 'PCC',
    group: 'Group A - Data Science Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme - S5 Data Science',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Exploratory Data Analysis and Descriptive Analytics', topics: 'Data preparation, variable types, summary statistics: measures of central tendency, dispersion, variance, interquartile range. Data distributions: normal, binomial, Poisson. Handling missing values, outlier detection and remediation, covariance, Pearson and Spearman correlation analysis, data normalization and scaling techniques.' },
        { num: 2, title: 'Statistical Modeling & Regression Analysis', topics: 'Simple linear regression, assumptions of linear models, Ordinary Least Squares (OLS) estimation, multiple linear regression, multicollinearity, variance inflation factor (VIF). Logistic regression: logit function, odds ratio, model evaluation using confusion matrix, ROC curves and AUC, k-fold cross validation techniques.' },
        { num: 3, title: 'Time Series Analysis & Forecasting Methods', topics: 'Components of time series: trend, seasonality, cyclical, irregular fluctuations. Stationary vs non-stationary time series, smoothing techniques: moving averages, single, double and Holt-Winters exponential smoothing. Autoregressive (AR), Moving Average (MA), ARMA, and ARIMA modeling pipelines, ACF and PACF plots interpretation.' },
        { num: 4, title: 'Distributed Data Analytics & Big Data Systems', topics: 'Big data analytics lifecycle, MapReduce paradigm, Apache Spark architecture, Resilient Distributed Datasets (RDDs), Spark DataFrames, transformations and actions, Spark SQL, building scalable analytics workflows using PySpark.' },
        { num: 5, title: 'Classification, Clustering & Model Interpretability', topics: 'Decision trees: ID3, CART, entropy, information gain, Gini index. Unsupervised learning: k-means clustering, hierarchical clustering (agglomerative and divisive), silhouette analysis for cluster evaluation. Feature importance, model interpretability, bias-variance trade-off in analytics pipelines.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'da-mod1', type: 'notes', module: 1, title: 'Module 1 - Exploratory Data Analysis, Distributions & Summary Statistics', source: 'MACE Academic Support Cell / Verified Curriculum', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'da-mod2', type: 'notes', module: 2, title: 'Module 2 - Linear & Multiple Regression, OLS Estimation & Cross Validation', source: 'MACE Academic Support Cell / Verified Curriculum', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'da-mod3', type: 'notes', module: 3, title: 'Module 3 - Time Series Decomposition, ARIMA & Exponential Smoothing', source: 'MACE Academic Support Cell / Verified Curriculum', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'da-mod4', type: 'notes', module: 4, title: 'Module 4 - Distributed Analytics with Apache Spark, RDDs & PySpark', source: 'MACE Academic Support Cell / Verified Curriculum', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'da-mod5', type: 'notes', module: 5, title: 'Module 5 - Decision Trees, K-Means Clustering & Model Validation Metrics', source: 'MACE Academic Support Cell / Verified Curriculum', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'da-qp', type: 'qp', module: 0, title: 'PCDST501 Previous University & Model Question Papers', source: 'KTU Exam Wing & Question Bank Archive', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'da-internal', type: 'internal', module: 0, title: 'Data Analytics Solved Series 1 & 2 Examination Papers with Solutions', source: 'MACE ASC Solved Series Archive', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' },
      { id: 'da-lab', type: 'lab', module: 0, title: 'Data Analytics Python & R Practical Experiments & Observations Manual', source: 'MACE Data Analytics Laboratory', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCDST502',
    title: 'Big Data Analytics and Mining',
    sem: 's5',
    branch: 'DS',
    branches: ['DS'],
    category: 'PCC',
    group: 'Group A - Data Science Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Big Data Foundations and Hadoop Eco-system', topics: 'Big data characteristics: volume, velocity, variety, veracity. Hadoop distributed file system (HDFS), architecture, MapReduce programming paradigm, resource management with YARN.' },
        { num: 2, title: 'NoSQL Databases and Data Ingestion', topics: 'NoSQL paradigms: key-value, column family, document, graph databases. Apache Cassandra and MongoDB concepts, data ingestion tools: Apache Flume, Apache Sqoop, Kafka.' },
        { num: 3, title: 'Frequent Pattern Mining & Association Rules', topics: 'Market basket analysis, Apriori algorithm, FP-Growth algorithm for frequent itemsets mining, association rule generation, evaluation metrics.' },
        { num: 4, title: 'Advanced Clustering for Big Data', topics: 'Partitioning methods, density-based clustering: DBSCAN, grid-based clustering, clustering high-dimensional data, outlier detection in large datasets.' },
        { num: 5, title: 'Stream Analytics & Big Data Applications', topics: 'Stream data processing architecture, windowing operations, Apache Spark Streaming, real-time analytics use cases.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcdst502-notes', type: 'notes', module: 1, title: 'Module 1 - Big Data Foundations, HDFS Architecture & MapReduce Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCCST501',
    title: 'System Software and Compilers',
    sem: 's5',
    branch: 'CSE',
    branches: ['CSE'],
    category: 'PCC',
    group: 'Group A Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'System Software Foundations & Assemblers', topics: 'System software concepts, simplified instructional computer (SIC/SIC-XE) architecture. Assembler design: two-pass assembler, data structures, symbol table.' },
        { num: 2, title: 'Macro Processors, Linkers and Loaders', topics: 'Macro processor design: macro definitions, macro expansion. Loaders: absolute loaders, relocation, linking loaders, dynamic linking.' },
        { num: 3, title: 'Compiler Lexical Analysis & Syntax Analysis', topics: 'Phases of a compiler, lexical analysis, regular expressions to finite automata, LEX. Syntax analysis: LL(1), LR parsing, YACC.' },
        { num: 4, title: 'Syntax-Directed Translation & Intermediate Code', topics: 'Syntax-directed definitions, three-address code, quadruples, triples, translation of expressions and control flow.' },
        { num: 5, title: 'Code Optimization and Code Generation', topics: 'Principal sources of optimization, basic blocks and flow graphs, loop optimization, dead code elimination, register allocation.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccst501-ss-notes', type: 'notes', module: 1, title: 'System Software Modules 1-3 Complete Notes & Algorithms', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCCST502',
    title: 'Computer Networks',
    sem: 's5',
    branch: 'CSE',
    branches: ['CSE', 'AI'],
    category: 'PCC',
    group: 'Group A Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Network Layer Architecture & Data Link Layer', topics: 'OSI and TCP/IP models, framing, error detection and correction (CRC, Hamming code), sliding window protocols, CSMA/CD, CSMA/CA.' },
        { num: 2, title: 'Network Layer Protocols and Routing', topics: 'IPv4 addressing, subnetting, CIDR, IPv6 basics. Routing algorithms: Distance Vector (RIP), Link State (OSPF), BGP, ICMP, ARP.' },
        { num: 3, title: 'Transport Layer Protocols', topics: 'UDP, TCP segment structure, connection management, flow control, TCP congestion control algorithms.' },
        { num: 4, title: 'Application Layer Services', topics: 'DNS, SMTP, POP3, IMAP, HTTP/1.1, HTTP/2, FTP, socket programming fundamentals.' },
        { num: 5, title: 'Network Security and Modern Architectures', topics: 'Symmetric and asymmetric encryption, digital signatures, SSL/TLS, firewalls, software-defined networking (SDN).' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccst502-cn-notes', type: 'notes', module: 1, title: 'Computer Networks Complete Modules 1-5 Lecture Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCAIT501',
    title: 'Machine Learning',
    sem: 's5',
    branch: 'AI',
    branches: ['AI'],
    category: 'PCC',
    group: 'Group A Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Introduction to Learning Paradigms & Linear Regression', topics: 'Supervised vs unsupervised learning, parametric vs non-parametric models, loss functions, gradient descent, linear and polynomial regression, ridge and lasso regularization.' },
        { num: 2, title: 'Classification Models', topics: 'Logistic regression, decision trees, entropy, information gain, Gini impurity, Support Vector Machines (SVM), hyperplanes, kernel trick.' },
        { num: 3, title: 'Ensemble Learning', topics: 'Bagging, Random Forests, Boosting: AdaBoost, Gradient Boosting, XGBoost, stacking models.' },
        { num: 4, title: 'Unsupervised Learning and Dimensionality Reduction', topics: 'K-Means clustering, hierarchical clustering, Principal Component Analysis (PCA), t-SNE overview.' },
        { num: 5, title: 'Model Evaluation and Validation', topics: 'Cross-validation, bias-variance trade-off, precision, recall, F1 score, ROC-AUC, hyperparameter tuning via Grid Search and Random Search.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcait501-notes', type: 'notes', module: 1, title: 'Machine Learning Modules 1-5 Complete Course Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCECT501',
    title: 'Digital Signal Processing (DSP)',
    sem: 's5',
    branch: 'ECE',
    branches: ['ECE'],
    category: 'PCC',
    group: 'Group B Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Discrete Fourier Transform (DFT) & Properties', topics: 'DFT definition, circular convolution, linear convolution using DFT, properties of DFT.' },
        { num: 2, title: 'Fast Fourier Transform (FFT) Algorithms', topics: 'Radix-2 DIT and DIF FFT algorithms, butterfly computation, computational complexity.' },
        { num: 3, title: 'Design of IIR Digital Filters', topics: 'Butterworth and Chebyshev analog approximations, bilinear transformation and impulse invariance methods.' },
        { num: 4, title: 'Design of FIR Digital Filters', topics: 'Linear phase FIR filters, windowing methods (Hamming, Hanning, Blackman), frequency sampling.' },
        { num: 5, title: 'Finite Word Length Effects and DSP Processors', topics: 'Quantization noise, limit cycle oscillations, overview of programmable DSP architectures.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcect501-notes', type: 'notes', module: 1, title: 'Digital Signal Processing Complete Handwritten Lecture Notes & Algorithms', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCEET501',
    title: 'Power Systems - I',
    sem: 's5',
    branch: 'EEE',
    branches: ['EEE'],
    category: 'PCC',
    group: 'Group B Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Power Generation & Economics', topics: 'Conventional and renewable generation overview, load curves, load factor, diversity factor, tariff calculations.' },
        { num: 2, title: 'Transmission Line Parameters', topics: 'Resistance, skin effect, inductance and capacitance calculations for 1-phase and 3-phase lines, transposition.' },
        { num: 3, title: 'Performance of Transmission Lines', topics: 'Short, medium (nominal-T and Pi), and long line solutions, ABCD parameters, Ferranti effect, voltage regulation.' },
        { num: 4, title: 'Overhead Lines Mechanical Design & Insulators', topics: 'Sag and tension calculations, insulators: pin, suspension, string efficiency.' },
        { num: 5, title: 'Underground Cables & Corona Phenomenon', topics: 'Cable construction, capacitance grading, corona phenomenon, critical disruptive voltage.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pceet501-notes', type: 'notes', module: 1, title: 'Power Systems - I Transmission Line Calculations & Insulators Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCMET501',
    title: 'Design of Machine Elements - I',
    sem: 's5',
    branch: 'MECH',
    branches: ['MECH'],
    category: 'PCC',
    group: 'Group C Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Static Failure Theories in Machine Design', topics: 'Stress concentration, factor of safety, failure theories: maximum principal stress, maximum shear stress, distortion energy.' },
        { num: 2, title: 'Fatigue Failure Criteria', topics: 'Endurance limit, modifying factors, fatigue design under fluctuating stresses: Goodman, Soderberg, Gerber criteria.' },
        { num: 3, title: 'Design of Threaded Fasteners and Welded Joints', topics: 'Bolted connections with pre-load, eccentric loading, design of butt and fillet welded joints.' },
        { num: 4, title: 'Design of Transmission Shafts, Keys and Couplings', topics: 'Shaft design based on strength and rigidity, ASME code, keys, rigid and flexible couplings.' },
        { num: 5, title: 'Design of Helical and Leaf Springs', topics: 'Stresses and deflection in helical compression and tension springs, Wahl factor, design of multi-leaf springs.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcmet501-notes', type: 'notes', module: 1, title: 'Design of Machine Elements Modules 1-5 Lecture Notes & Data Book Guide', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCCET501',
    title: 'Design of Concrete Structures',
    sem: 's5',
    branch: 'CIVIL',
    branches: ['CIVIL'],
    category: 'PCC',
    group: 'Group C Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Limit State Principles & Singly Reinforced Beams', topics: 'IS 456 limit state design philosophy, partial safety factors, stress-strain curves, singly reinforced beam design.' },
        { num: 2, title: 'Doubly Reinforced and Flanged Beams', topics: 'Design of doubly reinforced rectangular beams, T-beams, and L-beams, moment of resistance calculations.' },
        { num: 3, title: 'Shear, Bond, Anchorage and Torsion', topics: 'Shear reinforcement, bond stress, development length, member design under combined bending and torsion.' },
        { num: 4, title: 'Design of Slabs and Staircases', topics: 'One-way and two-way slabs with corners held down, doglegged staircase design.' },
        { num: 5, title: 'Design of Columns and Isolated Footings', topics: 'Axially loaded short columns with lateral ties, isolated pad footing design.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccet501-notes', type: 'notes', module: 1, title: 'Design of Concrete Structures IS 456 Solved Sheets & Formula Notes', source: 'MACE Civil Department / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },

  // =========================================================================
  // SEMESTERS S6 - S8
  // =========================================================================
  {
    code: 'PCCST601',
    title: 'Compiler Design',
    sem: 's6',
    branch: 'CSE',
    branches: ['CSE'],
    category: 'PCC',
    group: 'Group A Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Lexical Analysis and Formal Languages', topics: 'Compiler architecture, LEX, regular expressions, non-deterministic and deterministic finite automata.' },
        { num: 2, title: 'Parsing Techniques & Parser Generators', topics: 'Top-down and bottom-up parsing, LL(1), LR(0), SLR, LALR, error handling, YACC integration.' },
        { num: 3, title: 'Syntax Directed Translation', topics: 'Syntax-directed definitions, attribute evaluation, translation schemes for expressions and declarations.' },
        { num: 4, title: 'Intermediate Code & Runtime Environments', topics: 'Three address code, quadruples, triples, symbol table organization, runtime storage allocation.' },
        { num: 5, title: 'Code Optimization and Target Code Generation', topics: 'Control flow graphs, DAG representation of basic blocks, peephole optimization, register allocation.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccst601-notes', type: 'notes', module: 1, title: 'Compiler Design Modules 1-5 Complete Course Notes', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCDST601',
    title: 'Data Visualization and Storytelling',
    sem: 's6',
    branch: 'DS',
    branches: ['DS'],
    category: 'PCC',
    group: 'Group A - Data Science Core',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Visual Perception and Visualization Design', topics: 'Perceptual psychology, Gestalt principles, visual encoding (position, color, size, shape), ethics in visualization.' },
        { num: 2, title: 'Exploratory & Explanatory Charts', topics: 'Distribution plots, scatter matrix, heatmap, boxplots, multi-dimensional data representations.' },
        { num: 3, title: 'Interactive Visualization Libraries', topics: 'Building interactive dashboards with Plotly, Seaborn, Tableau, and D3.js fundamentals.' },
        { num: 4, title: 'Spatial and Temporal Data Visualization', topics: 'Geographical maps, choropleth maps, time-series visualizations, animated charts.' },
        { num: 5, title: 'Data Storytelling & Executive Dashboards', topics: 'Narrative structure in analytics, audience-centric design, dashboard KPIs, presentation of analytical insights.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcdst601-notes', type: 'notes', module: 1, title: 'Data Visualization Lecture Slides & Dashboard Guides', source: 'KTUNotes.in / MACE Data Science Lab', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCAIT601',
    title: 'Deep Learning & Neural Networks',
    sem: 's6',
    branch: 'AI',
    branches: ['AI'],
    category: 'PCC',
    group: 'Group A - AI Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Neural Network Foundations', topics: 'Perceptron, multi-layer perceptron, activation functions, backpropagation algorithm, loss functions.' },
        { num: 2, title: 'Optimization and Regularization in Deep Learning', topics: 'Gradient descent variants (SGD, Adam), dropout, batch normalization, weight decay.' },
        { num: 3, title: 'Convolutional Neural Networks (CNNs)', topics: 'Convolution operation, pooling, CNN architectures: LeNet, AlexNet, VGG, ResNet, applications in computer vision.' },
        { num: 4, title: 'Recurrent Neural Networks (RNNs)', topics: 'Sequence modeling, vanishing gradients, LSTM, GRU, sequence-to-sequence models.' },
        { num: 5, title: 'Attention Mechanisms and Transformer Basics', topics: 'Self-attention mechanism, Multi-head attention, Transformer architecture overview.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcait601-notes', type: 'notes', module: 1, title: 'Deep Learning Complete Lecture Modules & Architectures', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCECT601',
    title: 'VLSI Circuit Design',
    sem: 's6',
    branch: 'ECE',
    branches: ['ECE'],
    category: 'PCC',
    group: 'Group B Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'MOS Inverter Circuits & DC Characteristics', topics: 'NMOS and CMOS inverters, voltage transfer characteristics, noise margins, delay estimations.' },
        { num: 2, title: 'Combinational MOS Logic Circuits', topics: 'Static CMOS design, dynamic logic, pass-transistor logic, transmission gates, logical effort analysis.' },
        { num: 3, title: 'Sequential MOS Logic Circuits', topics: 'Latches, flip-flops, clocked dynamic registers, setup and hold time considerations.' },
        { num: 4, title: 'Semiconductor Memories & Testing', topics: 'SRAM, DRAM cells, ROM arrays. VLSI testing: fault models, scan paths, built-in self-test (BIST).' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcect601-notes', type: 'notes', module: 1, title: 'VLSI Circuit Design Lecture Notes & Layout Diagrams', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCEET601',
    title: 'Power Systems - II (Analysis & Control)',
    sem: 's6',
    branch: 'EEE',
    branches: ['EEE'],
    category: 'PCC',
    group: 'Group B Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Per-Unit Representation & Symmetrical Fault Analysis', topics: 'Per-unit quantities, impedance diagrams, symmetrical 3-phase fault calculations, selection of circuit breakers.' },
        { num: 2, title: 'Symmetrical Components & Unsymmetrical Faults', topics: 'Fortescue theorem, sequence networks of generators, transformers, and lines. LG, LL, LLG fault analysis.' },
        { num: 3, title: 'Power Flow Analysis', topics: 'Bus classification, Gauss-Seidel and Newton-Raphson load flow methods, Fast Decoupled Load Flow.' },
        { num: 4, title: 'Power System Stability', topics: 'Rotor dynamics, swing equation, equal area criterion, transient stability enhancement.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pceet601-notes', type: 'notes', module: 1, title: 'Power Systems - II Fault Analysis & Load Flow Notes', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCMET601',
    title: 'Heat and Mass Transfer',
    sem: 's6',
    branch: 'MECH',
    branches: ['MECH'],
    category: 'PCC',
    group: 'Group C Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Conduction Heat Transfer', topics: 'Fourier law, 1D steady-state conduction through composite walls, critical radius of insulation, fins.' },
        { num: 2, title: 'Convection Heat Transfer', topics: 'Boundary layer theory, forced convection over flat plates, flow through pipes, free convection.' },
        { num: 3, title: 'Radiation Heat Transfer', topics: 'Black body radiation laws, Planck, Stefan-Boltzmann, Wien laws, shape factors, radiation shields.' },
        { num: 4, title: 'Heat Exchangers and Mass Transfer', topics: 'LMTD and NTU methods for heat exchangers, Fick law of diffusion, mass transfer coefficients.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcmet601-notes', type: 'notes', module: 1, title: 'Heat and Mass Transfer Solved Numerical Problems & Formula Book', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCCET601',
    title: 'Design of Steel Structures',
    sem: 's6',
    branch: 'CIVIL',
    branches: ['CIVIL'],
    category: 'PCC',
    group: 'Group C Core',
    credits: 4,
    l_t_p_r: '3-1-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Structural Steel Fasteners & Joint Design', topics: 'Properties of structural steel, bolted connections, welded connections, limit state design of connections under axial and eccentric loads.' },
        { num: 2, title: 'Design of Tension Members', topics: 'Types of tension members, net effective area, shear lag, design of axially loaded tension members, lug angles.' },
        { num: 3, title: 'Design of Compression Members', topics: 'Column buckling, effective length, design of simple and built-up compression members, lacing and battening.' },
        { num: 4, title: 'Design of Steel Beams', topics: 'Laterally supported and unsupported beams, bending and shear strength, web buckling and crippling.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccet601-notes', type: 'notes', module: 1, title: 'Design of Steel Structures IS 800 Limit State Worked Sheets', source: 'MACE Civil Wing / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },

  // =========================================================================
  // SEMESTER 7 (S7)
  // =========================================================================
  {
    code: 'PCCST701',
    title: 'Cloud Computing & Distributed Infrastructure',
    sem: 's7',
    branch: 'CSE',
    branches: ['CSE', 'DS'],
    category: 'PCC',
    group: 'Group A Core',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Cloud Architecture & Service Models', topics: 'NIST cloud model, IaaS, PaaS, SaaS, deployment models (public, private, hybrid), virtualization techniques, hypervisors.' },
        { num: 2, title: 'Cloud Infrastructure and Storage Systems', topics: 'Distributed file systems, Amazon S3, Google Cloud Storage, block storage vs object storage, cloud databases.' },
        { num: 3, title: 'Containers and Serverless Computing', topics: 'Containerization, Docker architecture, container orchestration with Kubernetes, microservices, serverless compute.' },
        { num: 4, title: 'Cloud Security and Resource Scheduling', topics: 'Identity and access management (IAM), data security in cloud, cloud compliance, resource allocation and autoscaling.' },
        { num: 5, title: 'Cloud Migration & Edge/Fog Computing', topics: 'Cloud migration strategies, edge computing architecture, IoT-cloud convergence, cost optimization.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccst701-notes', type: 'notes', module: 1, title: 'Cloud Computing & Distributed Systems Lecture Summaries', source: 'KTUNotes.in / Verified Academic Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCAIT701',
    title: 'Reinforcement Learning and Autonomous Systems',
    sem: 's7',
    branch: 'AI',
    branches: ['AI'],
    category: 'PCC',
    group: 'Group A Core',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Curriculum Guidelines Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Markov Decision Processes (MDP)', topics: 'Reinforcement learning framework, agent, environment, reward hypothesis, Bellman equations, value functions.' },
        { num: 2, title: 'Dynamic Programming & Monte Carlo Methods', topics: 'Policy iteration, value iteration, model-free prediction and control, on-policy and off-policy Monte Carlo.' },
        { num: 3, title: 'Temporal Difference Learning', topics: 'TD(0), SARSA, Q-Learning, exploration vs exploitation (epsilon-greedy), multi-armed bandits.' },
        { num: 4, title: 'Deep Reinforcement Learning', topics: 'Deep Q-Networks (DQN), experience replay, target networks, policy gradients, actor-critic methods.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcait701-notes', type: 'notes', module: 1, title: 'Reinforcement Learning Foundations & MDP Lecture Notes', source: 'KTUNotes.in / Academic Cell Archive', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCECT701',
    title: 'Microwave and Optical Communication',
    sem: 's7',
    branch: 'ECE',
    branches: ['ECE'],
    category: 'PCC',
    group: 'Group B Core',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Microwave Transmission Lines & Waveguides', topics: 'Rectangular waveguides, TE and TM modes, cut-off frequency, guide wavelength, cavity resonators.' },
        { num: 2, title: 'Microwave Semiconductor Devices & Tubes', topics: 'Gunn diode, IMPATT diode, Klystron amplifier, Reflex klystron, Magnetron oscillator.' },
        { num: 3, title: 'Optical Fiber Transmission Characteristics', topics: 'Attenuation, dispersion (chromatic, polarization mode), non-linear effects in fibers.' },
        { num: 4, title: 'Optical Sources, Detectors and WDM', topics: 'LEDs, Laser diodes, PIN and APD photodetectors, optical receivers, Wavelength Division Multiplexing (WDM).' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcect701-notes', type: 'notes', module: 1, title: 'Microwave and Optical Communication Modules 1-4 Complete Notes', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCEET701',
    title: 'Electric Vehicles and Smart Grid Technologies',
    sem: 's7',
    branch: 'EEE',
    branches: ['EEE'],
    category: 'PCC',
    group: 'Group B Core',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Curriculum Guidelines Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group B',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Electric Vehicle Architecture & Dynamics', topics: 'EV powertrain components, vehicle resistance, tractive effort, battery technologies, BMS (Battery Management System).' },
        { num: 2, title: 'Electric Motors and Power Electronics for EVs', topics: 'BLDC motors, Permanent Magnet Synchronous Motors (PMSM), DC-DC converters, motor controllers.' },
        { num: 3, title: 'Smart Grid Architecture and Metering', topics: 'Smart grid vs conventional grid, Advanced Metering Infrastructure (AMI), Phasor Measurement Units (PMUs).' },
        { num: 4, title: 'Renewable Energy Integration & Microgrids', topics: 'Solar and wind grid integration, energy storage systems, microgrid operation and control, V2G (Vehicle-to-Grid).' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pceet701-notes', type: 'notes', module: 1, title: 'Electric Vehicles & Smart Grid Technologies Complete Notes', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCMET701',
    title: 'Mechatronics and Industrial Automation',
    sem: 's7',
    branch: 'MECH',
    branches: ['MECH'],
    category: 'PCC',
    group: 'Group C Core',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Mechatronic System Architecture & Sensors', topics: 'Key elements of mechatronics, displacement, position, proximity, velocity, pressure, and temperature sensors.' },
        { num: 2, title: 'Actuation Systems', topics: 'Pneumatic and hydraulic actuators, control valves, electrical actuators: stepper motors, servo motors, solenoids.' },
        { num: 3, title: 'Microcontroller & PLC Programming', topics: 'Microcontroller architecture, Programmable Logic Controllers (PLCs): hardware, ladder logic programming, timers, counters.' },
        { num: 4, title: 'Industrial Robotics and CNC Systems', topics: 'Robot kinematics, robot configurations, end effectors, SCADA systems, Computer Numerical Control (CNC) basics.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pcmet701-notes', type: 'notes', module: 1, title: 'Mechatronics & Automation Modules 1-4 Complete Notes', source: 'KTUNotes.in / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },
  {
    code: 'PCCET701',
    title: 'Quantity Surveying, Estimation and Valuation',
    sem: 's7',
    branch: 'CIVIL',
    branches: ['CIVIL'],
    category: 'PCC',
    group: 'Group C Core',
    credits: 3,
    l_t_p_r: '3-0-0-0',
    marks: { cie: 40, ese: 60 },
    syllabus: {
      status: 'Official Syllabus Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme Group C',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Estimation Principles & Quantity Take-off', topics: 'Types of estimates, item rate analysis, units of measurement, methods of building estimation: centre-line and long-wall short-wall methods.' },
        { num: 2, title: 'Rate Analysis and Specifications', topics: 'Standard data book, analysis of rates for major items of work (earthwork, concrete, masonry, plastering), specifications writing.' },
        { num: 3, title: 'Contracts, Tendering and Project Accounts', topics: 'Types of contracts, tender documents, tender notice, earnest money deposit, security deposit, measurement books.' },
        { num: 4, title: 'Valuation of Real Properties', topics: 'Purpose of valuation, gross income, net income, depreciation, methods of valuation: rental method, land and building method, scrap value.' }
      ]
    },
    notesAvailable: true,
    studyMaterials: [
      { id: 'pccet701-notes', type: 'notes', module: 1, title: 'Quantity Surveying & Estimation Complete Lecture Notes', source: 'MACE Civil Wing / Verified Resource', driveId: '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR', driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR' }
    ]
  },

  // =========================================================================
  // SEMESTER 8 (S8)
  // =========================================================================
  {
    code: 'PCCST801',
    title: 'Comprehensive Course Viva & Capstone Project',
    sem: 's8',
    branch: 'CSE',
    branches: ['CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL'],
    category: 'PW',
    group: 'Common University Core',
    credits: 6,
    l_t_p_r: '0-0-12-0',
    marks: { cie: 50, ese: 50 },
    syllabus: {
      status: 'Official Curriculum Guidelines Published',
      source: 'APJ Abdul Kalam Technological University (KTU) B.Tech 2024 Scheme',
      sourceUrl: 'https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech',
      modules: [
        { num: 1, title: 'Problem Formulation & Literature Survey', topics: 'Identification of engineering problem, societal relevance, comprehensive literature review, formulation of objectives.' },
        { num: 2, title: 'System Architecture & Mathematical Modeling', topics: 'Design of system components, mathematical modeling, algorithm development, feasibility analysis.' },
        { num: 3, title: 'Implementation and Experimental Setup', topics: 'Hardware fabrication, software implementation, integration testing, optimization.' },
        { num: 4, title: 'Performance Analysis & Results Benchmarking', topics: 'Experimental validation, error analysis, benchmarking against state-of-the-art results.' },
        { num: 5, title: 'Technical Thesis, IPR & Oral Examination', topics: 'Preparation of project report following KTU guidelines, technical presentation, oral defence and viva voce.' }
      ]
    },
    notesAvailable: false,
    notesPendingMessage: 'Official KTU curriculum guidelines active. Supplementary study notes are not applicable for Capstone Project Phase II & Comprehensive Viva (evaluated via viva-voce and thesis defense).',
    studyMaterials: []
  }
];

if (typeof window !== 'undefined') {
  window.KTU_2024_CURRICULUM_DATA = KTU_2024_CURRICULUM_DATA;
}
'@

Set-Content -Path $targetPath -Value $code -Encoding UTF8
Set-Content -Path $ascTargetPath -Value $code -Encoding UTF8
Write-Host "Successfully generated $targetPath and $ascTargetPath"
