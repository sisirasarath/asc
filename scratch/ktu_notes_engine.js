/**
 * KTU 2024 Scheme Navigation and Study Resources Engine
 * Source of truth: APJ Abdul Kalam Technological University (KTU)
 * Official Portal: https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech
 */

let allCourses = (typeof KTU_2024_CURRICULUM_DATA !== 'undefined') ? JSON.parse(JSON.stringify(KTU_2024_CURRICULUM_DATA)) : [];

// Navigation State: Semester -> Branch -> Subject -> Syllabus & Study Materials
let activeSem = 's1', activeBranch = null, activeSubject = null, activeCat = 'all', activeSearch = '';

const BRANCH_ORDER = ['CSE', 'DS', 'AI', 'ECE', 'EEE', 'MECH', 'CIVIL'];

const BRANCH_ASSETS = {
  CSE: {
    code: 'CSE',
    name: 'Computer Science',
    full: 'Computer Science & Engineering (CSE)',
    icon: 'fa-laptop-code',
    color: '#6366f1',
    group: 'Group A: Computer and Information Science',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 220" width="100%" height="100%"><defs><linearGradient id="gCS" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#3730a3"/><stop offset="100%" stop-color="#020617"/></linearGradient></defs><rect width="400" height="220" fill="url(#gCS)"/><rect x="60" y="40" width="280" height="140" rx="14" fill="rgba(15,23,42,0.85)" stroke="#6366f1" stroke-width="2"/><text x="85" y="75" font-family="monospace" font-size="18" fill="#38bdf8">&gt; class Student {</text><text x="110" y="105" font-family="monospace" font-size="16" fill="#a5b4fc">branch: "CSE_MACE";</text><text x="110" y="130" font-family="monospace" font-size="16" fill="#34d399">scheme: "KTU_2024";</text><text x="85" y="158" font-family="monospace" font-size="18" fill="#38bdf8">}</text><circle cx="300" cy="110" r="26" fill="rgba(99,102,241,0.25)" stroke="#818cf8" stroke-width="2"/><path d="M290 100 L300 110 L290 120 M310 100 L300 110 L310 120" stroke="#ffffff" stroke-width="2.5" fill="none"/></svg>`
  },
  DS: {
    code: 'DS',
    name: 'Data Science',
    full: 'Data Science & Analytics (DS)',
    icon: 'fa-database',
    color: '#06b6d4',
    group: 'Group A: Computer and Information Science',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 220" width="100%" height="100%"><defs><linearGradient id="gDS" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#155e75"/><stop offset="100%" stop-color="#020617"/></linearGradient></defs><rect width="400" height="220" fill="url(#gDS)"/><ellipse cx="150" cy="70" rx="45" ry="16" fill="#0891b2" stroke="#22d3ee" stroke-width="2"/><path d="M105 70 v30 c0 10 20 16 45 16 s45 -6 45 -16 v-30" fill="#0e7490" stroke="#22d3ee" stroke-width="2"/><path d="M105 100 v30 c0 10 20 16 45 16 s45 -6 45 -16 v-30" fill="#155e75" stroke="#22d3ee" stroke-width="2"/><rect x="230" y="115" width="20" height="45" fill="#22d3ee" rx="4"/><rect x="260" y="90" width="20" height="70" fill="#38bdf8" rx="4"/><rect x="290" y="65" width="20" height="95" fill="#06b6d4" rx="4"/><polyline points="230,110 260,85 290,60" fill="none" stroke="#facc15" stroke-width="3"/><text x="200" y="196" font-family="Arial,sans-serif" font-size="14" font-weight="800" fill="#cffafe" letter-spacing="3" text-anchor="middle">BIG DATA &amp; ANALYTICS</text></svg>`
  },
  AI: {
    code: 'AI',
    name: 'Artificial Intelligence',
    full: 'AI & Machine Learning (AIML)',
    icon: 'fa-brain',
    color: '#ec4899',
    group: 'Group A: Computer and Information Science',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 220" width="100%" height="100%"><defs><linearGradient id="gAI" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#831843"/><stop offset="100%" stop-color="#020617"/></linearGradient></defs><rect width="400" height="220" fill="url(#gAI)"/><circle cx="140" cy="80" r="10" fill="#f472b6"/><circle cx="140" cy="140" r="10" fill="#f472b6"/><circle cx="210" cy="60" r="12" fill="#ec4899"/><circle cx="210" cy="110" r="12" fill="#ec4899"/><circle cx="210" cy="160" r="12" fill="#ec4899"/><circle cx="280" cy="110" r="14" fill="#fb7185"/><line x1="140" y1="80" x2="210" y2="60" stroke="#f472b6" stroke-width="2" opacity="0.6"/><line x1="140" y1="80" x2="210" y2="110" stroke="#f472b6" stroke-width="2" opacity="0.6"/><line x1="140" y1="140" x2="210" y2="110" stroke="#f472b6" stroke-width="2" opacity="0.6"/><line x1="140" y1="140" x2="210" y2="160" stroke="#f472b6" stroke-width="2" opacity="0.6"/><line x1="210" y1="60" x2="280" y2="110" stroke="#ec4899" stroke-width="2.5" opacity="0.8"/><line x1="210" y1="110" x2="280" y2="110" stroke="#ec4899" stroke-width="2.5" opacity="0.8"/><line x1="210" y1="160" x2="280" y2="110" stroke="#ec4899" stroke-width="2.5" opacity="0.8"/><text x="200" y="198" font-family="Arial,sans-serif" font-size="14" font-weight="800" fill="#fbcfe8" letter-spacing="3" text-anchor="middle">NEURAL NETWORKS &amp; AI</text></svg>`
  },
  ECE: {
    code: 'ECE',
    name: 'Electronics & Comm',
    full: 'Electronics & Communication Engg (ECE)',
    icon: 'fa-microchip',
    color: '#3b82f6',
    group: 'Group B: Electrical Science',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 220" width="100%" height="100%"><defs><linearGradient id="gEC" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#1e3a8a"/><stop offset="100%" stop-color="#020617"/></linearGradient></defs><rect width="400" height="220" fill="url(#gEC)"/><rect x="140" y="55" width="120" height="100" rx="14" fill="#1e40af" stroke="#60a5fa" stroke-width="2.5"/><text x="200" y="112" font-family="Arial,sans-serif" font-size="22" font-weight="900" fill="#ffffff" text-anchor="middle">VLSI</text><text x="200" y="132" font-family="Arial,sans-serif" font-size="10" font-weight="700" fill="#93c5fd" letter-spacing="2" text-anchor="middle">MICROCHIP</text><path d="M120 75 h20 M120 105 h20 M120 135 h20 M260 75 h20 M260 105 h20 M260 135 h20 M170 35 v20 M200 35 v20 M230 35 v20 M170 155 v20 M200 155 v20 M230 155 v20" stroke="#60a5fa" stroke-width="3" stroke-linecap="round"/><path d="M30 110 Q70 70 100 110 T140 110" stroke="#38bdf8" stroke-width="2" fill="none" opacity="0.7"/><path d="M260 110 Q300 150 330 110 T370 110" stroke="#38bdf8" stroke-width="2" fill="none" opacity="0.7"/><text x="200" y="198" font-family="Arial,sans-serif" font-size="14" font-weight="800" fill="#bfdbfe" letter-spacing="3" text-anchor="middle">CIRCUITS &amp; EMBEDDED</text></svg>`
  },
  EEE: {
    code: 'EEE',
    name: 'Electrical & Electronics',
    full: 'Electrical & Electronics Engg (EEE)',
    icon: 'fa-bolt',
    color: '#f59e0b',
    group: 'Group B: Electrical Science',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 220" width="100%" height="100%"><defs><linearGradient id="gEE" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#78350f"/><stop offset="100%" stop-color="#020617"/></linearGradient></defs><rect width="400" height="220" fill="url(#gEE)"/><polygon points="205,35 170,115 205,115 190,175 235,95 200,95" fill="#f59e0b" stroke="#fde68a" stroke-width="2"/><circle cx="110" cy="110" r="32" fill="none" stroke="rgba(245,158,11,0.4)" stroke-width="2" stroke-dasharray="4 4"/><circle cx="290" cy="110" r="32" fill="none" stroke="rgba(245,158,11,0.4)" stroke-width="2" stroke-dasharray="4 4"/><text x="200" y="200" font-family="Arial,sans-serif" font-size="14" font-weight="800" fill="#fef3c7" letter-spacing="3" text-anchor="middle">POWER SYSTEMS &amp; GRIDS</text></svg>`
  },
  MECH: {
    code: 'MECH',
    name: 'Mechanical Engg',
    full: 'Mechanical Engineering (MECH)',
    icon: 'fa-gear',
    color: '#ef4444',
    group: 'Group C: Physical Science / Core Engineering',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 220" width="100%" height="100%"><defs><linearGradient id="gME" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#7f1d1d"/><stop offset="100%" stop-color="#020617"/></linearGradient></defs><rect width="400" height="220" fill="url(#gME)"/><circle cx="165" cy="105" r="42" fill="none" stroke="#f87171" stroke-width="12"/><circle cx="165" cy="105" r="22" fill="#ef4444"/><circle cx="245" cy="125" r="28" fill="none" stroke="#fca5a5" stroke-width="9"/><circle cx="245" cy="125" r="14" fill="#dc2626"/><text x="200" y="198" font-family="Arial,sans-serif" font-size="14" font-weight="800" fill="#fee2e2" letter-spacing="3" text-anchor="middle">THERMAL &amp; MACHINE DESIGN</text></svg>`
  },
  CIVIL: {
    code: 'CIVIL',
    name: 'Civil Engineering',
    full: 'Civil Engineering (CIVIL)',
    icon: 'fa-building',
    color: '#10b981',
    group: 'Group C: Physical Science / Core Engineering',
    svg: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 220" width="100%" height="100%"><defs><linearGradient id="gCE" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#064e3b"/><stop offset="100%" stop-color="#020617"/></linearGradient></defs><rect width="400" height="220" fill="url(#gCE)"/><path d="M80 160 L140 60 L200 160 Z" fill="none" stroke="#34d399" stroke-width="3"/><path d="M180 160 L240 75 L300 160 Z" fill="none" stroke="#10b981" stroke-width="3"/><line x1="50" y1="160" x2="350" y2="160" stroke="#6ee7b7" stroke-width="3"/><line x1="110" y1="110" x2="170" y2="110" stroke="#34d399" stroke-width="2"/><line x1="210" y1="118" x2="270" y2="118" stroke="#10b981" stroke-width="2"/><text x="200" y="198" font-family="Arial,sans-serif" font-size="14" font-weight="800" fill="#d1fae5" letter-spacing="3" text-anchor="middle">STRUCTURES &amp; GEOTECH</text></svg>`
  }
};
BRANCH_ASSETS.CS = BRANCH_ASSETS.CSE;
BRANCH_ASSETS.EC = BRANCH_ASSETS.ECE;
BRANCH_ASSETS.ME = BRANCH_ASSETS.MECH;
BRANCH_ASSETS.CE = BRANCH_ASSETS.CIVIL;

const SEM_INFO = {
  s1: {
    num: 'S1',
    name: 'Semester 1 — KTU 2024 Scheme Group Foundations',
    desc: 'Official KTU 2024 Scheme S1 syllabi and study resources across Group A (Computer & Information Science), Group B (Electrical Science), and Group C (Physical Science).',
    chips: ['GAMAT101', 'GAPHT121', 'GXCYT122', 'GMEST103', 'GXEST104', 'UCEST105', 'GYMAT101', 'GBPHT121', 'GCEST103', 'GCEST104'],
    driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR?usp=drive_link'
  },
  s2: {
    num: 'S2',
    name: 'Semester 2 — KTU 2024 Scheme Applied Foundations',
    desc: 'Official KTU 2024 Scheme S2 syllabi and verified materials across Groups A, B, and C.',
    chips: ['GAMAT201', 'GXEST203', 'GXEST204', 'UCEST206', 'UCHUT128', 'GYMAT201', 'GZEST204'],
    driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR?usp=drive_link'
  },
  s3: {
    num: 'S3',
    name: 'Semester 3 — KTU 2024 Department Core Foundations',
    desc: 'Official KTU 2024 Scheme S3 core courses across CSE, DS, AI, ECE, EEE, MECH, and CIVIL.',
    chips: ['PCCST303 (DSA)', 'PCCST302 (OOP)', 'UCHUT346 (Economics)', 'PCECT302', 'PCEET302', 'PCMET302', 'PCCET302'],
    driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR?usp=drive_link'
  },
  s4: {
    num: 'S4',
    name: 'Semester 4 — KTU 2024 Core Engineering Systems',
    desc: 'Official KTU 2024 Scheme S4 core departmental subjects, theory and lab curricula.',
    chips: ['PCCST402 (DBMS)', 'PCCST403 (OS)', 'PCECT402 (Signals)', 'PCEET402 (DC Machines)', 'PCMET403 (Thermo)', 'PCCET402 (Geotech)'],
    driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR?usp=drive_link'
  },
  s5: {
    num: 'S5',
    name: 'Semester 5 — KTU 2024 Advanced Core & Analytics',
    desc: 'Official KTU 2024 Scheme S5 advanced department courses including Data Analytics, Big Data, System Software, DSP, Power Systems, Machine Elements, and Concrete Structures.',
    chips: ['PCDST501 (Data Analytics)', 'PCDST502 (Big Data)', 'PCCST501 (System Software)', 'PCCST502 (Networks)', 'PCAIT501 (ML)', 'PCECT501 (DSP)'],
    driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR?usp=drive_link'
  },
  s6: {
    num: 'S6',
    name: 'Semester 6 — KTU 2024 Specialized Systems & Design',
    desc: 'Official KTU 2024 Scheme S6 specialized courses: Compiler Design, Data Visualization, Deep Learning, VLSI, Power Systems II, Heat & Mass Transfer, Steel Structures.',
    chips: ['PCCST601 (Compiler)', 'PCDST601 (Visualization)', 'PCAIT601 (Deep Learning)', 'PCECT601 (VLSI)', 'PCMET601 (HMT)', 'PCCET601 (Steel)'],
    driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR?usp=drive_link'
  },
  s7: {
    num: 'S7',
    name: 'Semester 7 — KTU 2024 Advanced Technologies & Seminars',
    desc: 'Official KTU 2024 Scheme S7 high-level core topics: Cloud Computing, Autonomous Systems, Microwaves, Electric Vehicles, Mechatronics, and Estimation.',
    chips: ['PCCST701 (Cloud)', 'PCAIT701 (RL & Robotics)', 'PCECT701 (Microwave)', 'PCEET701 (EV & Smart Grid)', 'PCMET701 (Mechatronics)'],
    driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR?usp=drive_link'
  },
  s8: {
    num: 'S8',
    name: 'Semester 8 — KTU 2024 Capstone Project & Internship',
    desc: 'Official KTU 2024 Scheme final semester curriculum: Capstone Project, Comprehensive Course Viva, Industrial Internship, and Technical Seminar.',
    chips: ['PCCST801 (Capstone & Viva)', 'PCCST802 (Internship & Seminar)'],
    driveUrl: 'https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR?usp=drive_link'
  }
};

const ICONS = {
  'DATA ANALYTICS': 'fa-chart-pie',
  'BIG DATA': 'fa-server',
  'DATA MINING': 'fa-database',
  'DATA SCIENCE': 'fa-database',
  'PYTHON': 'fa-brands fa-python',
  'C PROG': 'fa-code',
  'ML': 'fa-robot',
  'MACHINE LEARNING': 'fa-robot',
  'DEEP LEARNING': 'fa-brain',
  'ARTIFICIAL INTELLIGENCE': 'fa-brain',
  'AI': 'fa-brain',
  'FLA': 'fa-diagram-project',
  'AUTOMATA': 'fa-diagram-project',
  'GT': 'fa-circle-nodes',
  'GRAPH THEORY': 'fa-circle-nodes',
  'DBMS': 'fa-database',
  'DATABASE': 'fa-database',
  'OOP': 'fa-laptop-code',
  'DATA STRUCTURES': 'fa-sitemap',
  'DS LAB': 'fa-flask',
  'CN': 'fa-network-wired',
  'NETWORK': 'fa-network-wired',
  'OS': 'fa-microchip',
  'OPERATING SYSTEM': 'fa-microchip',
  'COA': 'fa-server',
  'COMPILER': 'fa-gears',
  'MATH': 'fa-square-root-variable',
  'CALCULUS': 'fa-calculator',
  'PHYSICS': 'fa-atom',
  'CHEMISTRY': 'fa-flask',
  'MANAGEMENT': 'fa-briefcase',
  'ECONOMICS': 'fa-coins',
  'MECHANICS': 'fa-gear',
  'FLUID': 'fa-droplet',
  'THERMAL': 'fa-fire',
  'DME': 'fa-compass-drafting',
  'HMT': 'fa-temperature-half',
  'HEAT': 'fa-temperature-half',
  'LIC': 'fa-microchip',
  'LCD': 'fa-tv',
  'LSD': 'fa-microchip',
  'DSP': 'fa-wave-square',
  'VLSI': 'fa-microchip',
  'POWER SYSTEM': 'fa-bolt',
  'ELECTRICAL MACHINE': 'fa-bolt-lightning',
  'CIRCUITS': 'fa-plug',
  'STRUCTURAL ANALYSIS': 'fa-building-columns',
  'CONCRETE': 'fa-cubes',
  'STEEL': 'fa-trowel-bricks',
  'SURVEY': 'fa-map-location-dot',
  'GEOTECHNICAL': 'fa-mountain',
  'TRANSPORT': 'fa-road',
  'ENVIRONMENT': 'fa-tree',
  'LAB': 'fa-flask',
  'MANUAL': 'fa-book-open',
  'PROJECT': 'fa-diagram-project',
  'VIVA': 'fa-comments',
  'SEMINAR': 'fa-chalkboard-user',
  'default': 'fa-book'
};

function gIcon(s){
  if(!s) return ICONS.default;
  const upper = s.toUpperCase();
  for(const [k, v] of Object.entries(ICONS)){
    if(upper.includes(k)) return v;
  }
  return ICONS.default;
}

function updateSemBadges(){
  const sems = ['s1','s2','s3','s4','s5','s6','s7','s8'];
  sems.forEach(s => {
    const cnt = allCourses.filter(c => c.sem === s).length;
    const badge = document.getElementById('sem-badge-' + s);
    if(badge){
      badge.textContent = cnt ? (cnt + ' Courses') : '0';
    }
  });
}

function filterSem(sem, btn){
  document.querySelectorAll('#mace-sem-filters .sem-btn').forEach(b => b.classList.remove('active'));
  const target = btn || document.querySelector(`#mace-sem-filters [data-sem="${sem}"]`);
  if(target) target.classList.add('active');
  activeSem = sem;
  activeBranch = null;  // Stage 1: Semester View (displays applicable branches)
  activeSubject = null;
  activeCat = 'all';
  activeSearch = '';
  const searchInput = document.getElementById('notesSearch');
  if(searchInput) searchInput.value = '';
  renderNotes();
  const anchor = document.getElementById('mace-sem-filters');
  if(anchor){
    const offset = anchor.getBoundingClientRect().top + window.scrollY - 90;
    window.scrollTo({top: Math.max(0, offset), behavior: 'smooth'});
  }
}

function selectBranch(b){
  activeBranch = b;     // Stage 2: Branch View (displays correct subjects)
  activeSubject = null;
  activeCat = 'all';
  activeSearch = '';
  renderNotes();
  const anchor = document.getElementById('branch-view-anchor') || document.getElementById('mace-content');
  if(anchor){
    const offset = anchor.getBoundingClientRect().top + window.scrollY - 90;
    window.scrollTo({top: Math.max(0, offset), behavior: 'smooth'});
  }
}

function clearBranch(){
  activeBranch = null;  // Return to Stage 1: Semester View
  activeSubject = null;
  activeCat = 'all';
  renderNotes();
  const anchor = document.getElementById('branch-grid-anchor') || document.getElementById('mace-content');
  if(anchor){
    const offset = anchor.getBoundingClientRect().top + window.scrollY - 90;
    window.scrollTo({top: Math.max(0, offset), behavior: 'smooth'});
  }
}

function selectSubject(code){
  activeSubject = code; // Stage 3: Subject View (Syllabus & Study Materials)
  activeCat = 'all';
  renderNotes();
  const anchor = document.getElementById('subject-view-anchor') || document.getElementById('mace-content');
  if(anchor){
    const offset = anchor.getBoundingClientRect().top + window.scrollY - 90;
    window.scrollTo({top: Math.max(0, offset), behavior: 'smooth'});
  }
}

function clearSubject(){
  activeSubject = null; // Return to Stage 2: Branch View
  activeCat = 'all';
  renderNotes();
  const anchor = document.getElementById('branch-view-anchor') || document.getElementById('mace-content');
  if(anchor){
    const offset = anchor.getBoundingClientRect().top + window.scrollY - 90;
    window.scrollTo({top: Math.max(0, offset), behavior: 'smooth'});
  }
}

function filterCat(cat, btn){
  document.querySelectorAll('#cat-filters .dept-btn').forEach(b => b.classList.remove('active'));
  if(btn) btn.classList.add('active');
  activeCat = cat;
  renderNotes();
}

function openContributeForSubject(sem, branch, subject) {
  switchTab('contribute');
  const semEl = document.getElementById('contribSem');
  const branchEl = document.getElementById('contribBranch');
  const subjEl = document.getElementById('contribSubject');
  if (semEl) { semEl.value = sem; onContribSemChange(); }
  if (branchEl) { branchEl.value = branch; onContribBranchChange(); }
  if (subjEl) subjEl.value = subject;
  const formSec = document.getElementById('upload-form-section');
  if (formSec) {
    formSec.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }
}

function renderNotes(){
  updateSemBadges();

  const drivePanel = document.getElementById('mace-drive-panel');
  const contentDiv = document.getElementById('mace-content');
  const resultsBar = document.getElementById('mace-results-bar');
  const semFilters = document.getElementById('mace-sem-filters');
  const catFilters = document.getElementById('cat-filters');

  if(activeCat === 'drive'){
    if(drivePanel) drivePanel.style.display = 'block';
    if(contentDiv) contentDiv.style.display = 'none';
    if(resultsBar) resultsBar.style.display = 'none';
    if(semFilters) semFilters.style.display = 'none';
    if(catFilters) catFilters.style.display = 'none';
    return;
  }

  if(drivePanel) drivePanel.style.display = 'none';
  if(contentDiv) contentDiv.style.display = 'block';
  if(semFilters) semFilters.style.display = 'flex';

  const info = SEM_INFO[activeSem] || SEM_INFO.s1;

  let html = '';

  // ─────────────────────────────────────────────────────────────
  // SEARCH ACTIVE: SHOW MATCHING SUBJECTS DIRECTLY
  // ─────────────────────────────────────────────────────────────
  if(activeSearch && activeSearch.trim() !== ''){
    const q = activeSearch.toLowerCase().trim();
    const searchMatches = allCourses.filter(c => {
      if(c.code.toLowerCase().includes(q)) return true;
      if(c.title.toLowerCase().includes(q)) return true;
      if(c.category.toLowerCase().includes(q)) return true;
      if(c.group.toLowerCase().includes(q)) return true;
      if(c.syllabus && c.syllabus.modules && c.syllabus.modules.some(m => m.title.toLowerCase().includes(q) || m.topics.toLowerCase().includes(q))) return true;
      return false;
    });

    html += `
    <div class="portal-breadcrumb-bar">
      <span class="crumb-btn" onclick="filterSem('s1')"><i class="fa-solid fa-graduation-cap"></i> Academic Portal</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-active"><i class="fa-solid fa-magnifying-glass"></i> Search Results for "${activeSearch}"</span>
    </div>
    
    <div class="section-divider-title">
      <h2><i class="fa-solid fa-magnifying-glass" style="color:var(--primary-red);"></i> Matching KTU 2024 Scheme Subjects</h2>
      <span class="count-pill">${searchMatches.length} Found</span>
    </div>`;

    if(!searchMatches.length){
      html += `
      <div class="mace-empty" style="padding:4rem 1.5rem;text-align:center;">
        <i class="fa-solid fa-search" style="font-size:3rem;display:block;margin-bottom:1.2rem;color:var(--text-muted);"></i>
        <h3 style="color:white;font-size:1.25rem;margin-bottom:8px;">No KTU subjects found matching "${activeSearch}"</h3>
        <p style="font-size:0.88rem;color:var(--text-muted);max-width:520px;margin:0 auto 1.8rem;line-height:1.6;">
          Try searching with official course codes like <strong>GAMAT101</strong>, <strong>PCDST501</strong>, or keywords like <strong>Analytics</strong>, <strong>Python</strong>, <strong>Calculus</strong>.
        </p>
        <button onclick="document.getElementById('notesSearch').value='';activeSearch='';renderNotes();" class="nbtn nbtn-p" style="padding:11px 28px;border-radius:50px;margin:0 auto;display:inline-flex;">
          <i class="fa-solid fa-rotate-left"></i> Clear Search
        </button>
      </div>`;
      contentDiv.innerHTML = html;
      return;
    }

    html += `<div class="subject-card-grid">`;
    searchMatches.forEach(c => {
      const branchesStr = (c.branches && c.branches.length) ? c.branches.join(', ') : c.branch;
      html += `
      <div class="subject-card" onclick="activeSem='${c.sem}';activeBranch='${c.branch}';selectSubject('${c.code}')">
        <div>
          <div class="subj-card-header">
            <span class="subj-code-badge">${c.code}</span>
            <span class="subj-cat-badge">${c.sem.toUpperCase()} &middot; ${branchesStr}</span>
          </div>
          <h3 class="subj-card-title">${c.title}</h3>
          <div class="subj-card-meta">
            <span><i class="fa-solid fa-award" style="color:#f59e0b;"></i> ${c.credits} Credits</span>
            <span><i class="fa-solid fa-clock" style="color:#60a5fa;"></i> L-T-P-R: ${c.l_t_p_r}</span>
            <span><i class="fa-solid fa-list-check" style="color:#10b981;"></i> ${c.syllabus.modules.length} Modules</span>
          </div>
        </div>
        <div class="subj-mat-status">
          ${c.notesAvailable && c.studyMaterials && c.studyMaterials.length ? 
            `<span class="subj-mat-pill mat-available"><i class="fa-solid fa-circle-check"></i> ${c.studyMaterials.length} Study Materials</span>` : 
            `<span class="subj-mat-pill mat-pending"><i class="fa-solid fa-clock"></i> Official Syllabus Published</span>`}
          <span class="subj-card-cta">View Syllabus &rarr;</span>
        </div>
      </div>`;
    });
    html += `</div>`;
    contentDiv.innerHTML = html;
    return;
  }

  // ─────────────────────────────────────────────────────────────
  // STAGE 1: SEMESTER LEVEL (NO BRANCH SELECTED YET)
  // Display breadcrumbs, semester overview, and available branch buttons
  // ─────────────────────────────────────────────────────────────
  if(!activeBranch && !activeSubject){
    if(catFilters) catFilters.style.display = 'none';
    if(resultsBar) resultsBar.style.display = 'none';

    html += `
    <div class="portal-breadcrumb-bar">
      <span class="crumb-btn" onclick="filterSem('s1')"><i class="fa-solid fa-graduation-cap"></i> Academic Portal</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-btn" onclick="filterSem('${activeSem}')">${info.num} Semesters</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-active"><i class="fa-solid fa-code-branch"></i> Branch Selection</span>
    </div>`;

    const semCourses = allCourses.filter(c => c.sem === activeSem);

    html += `
    <div class="sem-hero-card">
      <div class="sem-hero-badge">${info.num}</div>
      <div class="sem-hero-info">
        <div style="display:flex;align-items:center;gap:10px;margin-bottom:6px;flex-wrap:wrap;">
          <span class="sem-badge-tag">KTU 2024 SCHEME</span>
          <span style="font-size:0.78rem;color:var(--text-muted);"><i class="fa-solid fa-folder-tree" style="margin-right:4px;"></i> Total ${semCourses.length} Official KTU Courses</span>
        </div>
        <h3>${info.name}</h3>
        <p>${info.desc}</p>
        <div style="display:flex;gap:6px;flex-wrap:wrap;margin-top:10px;">
          ${info.chips.map(c => `<span style="font-size:.72rem;padding:3px 10px;border-radius:50px;background:rgba(255,255,255,0.06);color:rgba(255,255,255,0.85);border:1px solid rgba(255,255,255,0.08);">${c}</span>`).join('')}
        </div>
      </div>
      <div class="sem-hero-actions">
        <a href="https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech" target="_blank" rel="noopener" class="nbtn nbtn-p" style="display:inline-flex;align-items:center;gap:8px;padding:11px 22px;border-radius:50px;">
          <i class="fa-solid fa-arrow-up-right-from-square"></i> Official KTU Portal
        </a>
        <a href="${info.driveUrl}" target="_blank" rel="noopener" class="nbtn nbtn-g" style="display:inline-flex;align-items:center;gap:8px;padding:11px 22px;border-radius:50px;">
          <i class="fa-brands fa-google-drive"></i> ${info.num} Master Drive
        </a>
      </div>
    </div>`;

    let branchCardsHtml = '';
    for(const b of BRANCH_ORDER){
      const asset = BRANCH_ASSETS[b];
      const count = semCourses.filter(c => (c.branches && c.branches.includes(b)) || c.branch === b).length;
      const svgDataUri = 'data:image/svg+xml;charset=utf-8,' + encodeURIComponent(asset.svg);
      branchCardsHtml += `
      <div class="branch-dept-card" onclick="selectBranch('${b}')" title="${asset.full}">
        <div class="branch-dept-img" style="background-image:url('${svgDataUri}');">
          <div class="branch-code-badge">${asset.code}</div>
        </div>
        <div class="branch-dept-info">
          <h3 class="branch-title-lg">${asset.name}</h3>
          <span class="branch-tag-pill">
            <i class="fa-solid ${asset.icon}"></i> ${count} KTU SUBJECTS
          </span>
          <span class="branch-cta-text"><i class="fa-solid fa-arrow-right"></i> View ${asset.code} Subjects</span>
        </div>
      </div>`;
    }

    html += `
    <div style="margin-bottom:2.5rem;" id="branch-grid-anchor">
      <div class="branch-select-header">
        <div>
          <h2><i class="fa-solid fa-code-branch" style="color:var(--primary-red);"></i> ${info.num} Branch Selection</h2>
          <p>Click your engineering branch to view its official KTU 2024 Scheme curriculum subjects and syllabus modules.</p>
        </div>
        <span style="font-size:0.75rem;padding:5px 14px;border-radius:50px;background:rgba(255,255,255,0.06);color:var(--text-muted);border:1px solid rgba(255,255,255,0.1);">
          <i class="fa-solid fa-circle-check" style="color:#10b981;margin-right:4px;"></i> Strict Branch Separation
        </span>
      </div>
      <div class="branch-cat-grid">
        ${branchCardsHtml}
      </div>
    </div>`;

    contentDiv.innerHTML = html;
    return;
  }

  // ─────────────────────────────────────────────────────────────
  // STAGE 2: BRANCH LEVEL (BRANCH SELECTED, NO SUBJECT SELECTED YET)
  // Display strictly the curriculum subjects for this semester and branch
  // ─────────────────────────────────────────────────────────────
  if(activeBranch && !activeSubject){
    if(catFilters) catFilters.style.display = 'none';
    if(resultsBar) resultsBar.style.display = 'none';

    const asset = BRANCH_ASSETS[activeBranch] || BRANCH_ASSETS.CSE;
    const branchCourses = allCourses.filter(c => c.sem === activeSem && ((c.branches && c.branches.includes(activeBranch)) || c.branch === activeBranch));

    const quickPillsHtml = BRANCH_ORDER.map(b => {
      const a = BRANCH_ASSETS[b];
      const c = allCourses.filter(x => x.sem === activeSem && ((x.branches && x.branches.includes(b)) || x.branch === b)).length;
      const isAct = (b === activeBranch);
      return `<button onclick="selectBranch('${b}')" class="branch-quick-pill ${isAct ? 'active' : ''}">
        <i class="fa-solid ${a.icon}"></i> ${a.code} <span class="quick-count">(${c})</span>
      </button>`;
    }).join('');

    const svgDataUri = 'data:image/svg+xml;charset=utf-8,' + encodeURIComponent(asset.svg);

    html += `
    <div id="branch-view-anchor"></div>
    
    <div class="portal-breadcrumb-bar">
      <span class="crumb-btn" onclick="filterSem('${activeSem}')"><i class="fa-solid fa-graduation-cap"></i> ${info.num} Semesters</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-btn" onclick="clearBranch()">${info.num} Branches</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-active"><i class="fa-solid ${asset.icon}"></i> ${asset.full}</span>
    </div>

    <div class="branch-nav-header">
      <button onclick="clearBranch()" class="branch-back-btn">
        <i class="fa-solid fa-arrow-left"></i> Back to ${info.num} Branch Selection
      </button>
      <span class="branch-breadcrumb">
        <i class="fa-solid fa-graduation-cap"></i> ${info.num} <i class="fa-solid fa-chevron-right" style="font-size:0.65rem;opacity:0.6;"></i> <strong style="color:white;">${asset.name}</strong>
      </span>
    </div>

    <div class="branch-hero-spotlight">
      <div class="branch-hero-left">
        <div class="branch-hero-avatar" style="background-image:url('${svgDataUri}');"></div>
        <div class="branch-hero-details">
          <div class="branch-hero-tag">
            <i class="fa-solid ${asset.icon}"></i> ${info.num} &middot; ${asset.code} &middot; ${asset.group}
          </div>
          <h2 class="branch-hero-title">${asset.full}</h2>
          <p class="branch-hero-desc">
            Official KTU B.Tech 2024 Scheme curriculum subjects, course codes, credits, and syllabus modules for ${info.num} ${asset.name}.
          </p>
          <div class="branch-hero-meta">
            <span class="branch-pill-live"><i class="fa-solid fa-circle-check" style="color:#10b981;"></i> ${branchCourses.length} Official Subjects</span>
            <span class="branch-pill-live"><i class="fa-solid fa-building-columns" style="color:#60a5fa;"></i> APJ Abdul Kalam Technological University</span>
            <span class="branch-pill-live"><i class="fa-solid fa-shield-halved" style="color:#f59e0b;"></i> Strict ${info.num} &rarr; ${asset.code} Mapping</span>
          </div>
        </div>
      </div>
      <div class="branch-hero-actions">
        <a href="https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech" target="_blank" rel="noopener" class="nbtn nbtn-p" style="display:inline-flex;align-items:center;gap:8px;padding:12px 22px;border-radius:50px;">
          <i class="fa-solid fa-arrow-up-right-from-square"></i> KTU 2024 Curriculum
        </a>
        <a href="${info.driveUrl}" target="_blank" rel="noopener" class="nbtn nbtn-g" style="display:inline-flex;align-items:center;gap:8px;padding:12px 22px;border-radius:50px;">
          <i class="fa-brands fa-google-drive"></i> ${asset.code} Drive
        </a>
      </div>
    </div>

    <div class="branch-quick-strip">
      <button onclick="clearBranch()" class="branch-quick-pill" style="border-color:rgba(229,26,36,0.3);color:#ff8b90;">
        <i class="fa-solid fa-arrow-left"></i> All ${info.num} Branches
      </button>
      <span style="font-size:0.72rem;font-weight:800;color:var(--text-muted);text-transform:uppercase;letter-spacing:0.5px;margin:0 4px;">Quick Switch:</span>
      ${quickPillsHtml}
    </div>

    <div class="section-divider-title">
      <div>
        <h2><i class="fa-solid fa-book-bookmark" style="color:var(--primary-red);"></i> ${info.num} ${asset.code} Curriculum Subjects</h2>
        <p style="font-size:0.86rem;color:var(--text-muted);margin:4px 0 0 0;">Select any subject below to inspect its official syllabus module breakdown, credits, and available study materials.</p>
      </div>
      <span class="count-pill">${branchCourses.length} Subjects</span>
    </div>`;

    if(!branchCourses.length){
      html += `
      <div class="mace-empty" style="padding:4rem 1.5rem;text-align:center;">
        <i class="fa-solid fa-folder-open" style="font-size:3rem;display:block;margin-bottom:1.2rem;color:var(--primary-red);"></i>
        <h3 style="color:white;font-size:1.25rem;margin-bottom:8px;">No curriculum entries published yet for ${info.num} ${asset.name}</h3>
        <p style="font-size:0.88rem;color:var(--text-muted);max-width:520px;margin:0 auto 1.8rem;line-height:1.6;">
          Check the official KTU curriculum source or return to branch selection.
        </p>
        <button onclick="clearBranch()" class="nbtn nbtn-p" style="padding:11px 24px;border-radius:50px;margin:0 auto;display:inline-flex;">
          <i class="fa-solid fa-arrow-left"></i> Back to ${info.num} Branch Selection
        </button>
      </div>`;
      contentDiv.innerHTML = html;
      return;
    }

    html += `<div class="subject-card-grid">`;
    branchCourses.forEach(c => {
      const matCount = (c.studyMaterials && c.studyMaterials.length) ? c.studyMaterials.length : 0;
      html += `
      <div class="subject-card" onclick="selectSubject('${c.code}')">
        <div>
          <div class="subj-card-header">
            <span class="subj-code-badge">${c.code}</span>
            <span class="subj-cat-badge">${c.category} &middot; ${c.group}</span>
          </div>
          <h3 class="subj-card-title">${c.title}</h3>
          <div class="subj-card-meta">
            <span><i class="fa-solid fa-award" style="color:#f59e0b;"></i> ${c.credits} Credits</span>
            <span><i class="fa-solid fa-clock" style="color:#60a5fa;"></i> L-T-P-R: ${c.l_t_p_r}</span>
            <span><i class="fa-solid fa-list-check" style="color:#10b981;"></i> ${c.syllabus.modules.length} Modules</span>
          </div>
        </div>
        <div class="subj-mat-status">
          ${c.notesAvailable && matCount > 0 ? 
            `<span class="subj-mat-pill mat-available"><i class="fa-solid fa-circle-check"></i> ${matCount} Study Materials</span>` : 
            `<span class="subj-mat-pill mat-pending"><i class="fa-solid fa-clock"></i> Official Syllabus &middot; Notes Pending</span>`}
          <span class="subj-card-cta">View Details <i class="fa-solid fa-chevron-right"></i></span>
        </div>
      </div>`;
    });
    html += `</div>`;

    contentDiv.innerHTML = html;
    return;
  }

  // ─────────────────────────────────────────────────────────────
  // STAGE 3: SUBJECT LEVEL (SUBJECT SELECTED)
  // Display Official Syllabus Module Breakdown AND Supplementary Study Materials
  // ─────────────────────────────────────────────────────────────
  if(activeSubject){
    const c = allCourses.find(x => x.code === activeSubject && x.sem === activeSem) || allCourses.find(x => x.code === activeSubject);
    const asset = BRANCH_ASSETS[activeBranch] || BRANCH_ASSETS[c.branch] || BRANCH_ASSETS.CSE;

    html += `
    <div id="subject-view-anchor"></div>
    
    <div class="portal-breadcrumb-bar">
      <span class="crumb-btn" onclick="filterSem('${activeSem}')"><i class="fa-solid fa-graduation-cap"></i> ${info.num} Semesters</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-btn" onclick="clearSubject()">${asset.name} Subjects</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-active">${c.code}: ${c.title}</span>
    </div>

    <div class="branch-nav-header">
      <button onclick="clearSubject()" class="branch-back-btn">
        <i class="fa-solid fa-arrow-left"></i> Back to ${asset.name} Subjects
      </button>
      <span class="branch-breadcrumb">
        <i class="fa-solid fa-graduation-cap"></i> ${info.num} &middot; ${asset.code} &middot; <strong style="color:white;">${c.code}</strong>
      </span>
    </div>

    <!-- Subject Hero Spotlight Card -->
    <div class="subject-hero-spotlight">
      <div class="subject-meta-chips">
        <span class="subject-meta-chip chip-code"><i class="fa-solid fa-hashtag"></i> ${c.code}</span>
        <span class="subject-meta-chip"><i class="fa-solid fa-layer-group"></i> Category: ${c.category}</span>
        <span class="subject-meta-chip"><i class="fa-solid fa-users-rays"></i> ${c.group}</span>
        <span class="subject-meta-chip"><i class="fa-solid fa-award" style="color:#f59e0b;"></i> ${c.credits} Credits</span>
        <span class="subject-meta-chip"><i class="fa-solid fa-clock" style="color:#60a5fa;"></i> L-T-P-R: ${c.l_t_p_r}</span>
        <span class="subject-meta-chip"><i class="fa-solid fa-circle-check" style="color:#10b981;"></i> ${c.syllabus.status}</span>
      </div>
      <h1 class="subject-hero-title">${c.title}</h1>
      <div class="subject-hero-source">
        <i class="fa-solid fa-shield-halved" style="color:#10b981;"></i>
        Source: <strong style="color:white;">${c.syllabus.source}</strong> &middot;
        <a href="${c.syllabus.sourceUrl}" target="_blank" rel="noopener" style="color:#60a5fa;text-decoration:underline;">Official KTU Curriculum Document</a>
      </div>
      <div style="display:flex;gap:12px;flex-wrap:wrap;margin-top:14px;">
        <a href="${c.syllabus.sourceUrl}" target="_blank" rel="noopener" class="nbtn nbtn-p" style="border-radius:50px;padding:11px 24px;display:inline-flex;align-items:center;gap:8px;">
          <i class="fa-solid fa-arrow-up-right-from-square"></i> Official KTU Curriculum Portal
        </a>
        <button onclick="openContributeForSubject('${c.sem}', '${activeBranch||c.branch}', '${c.title}')" class="nbtn nbtn-g" style="border-radius:50px;padding:11px 24px;display:inline-flex;align-items:center;gap:8px;">
          <i class="fa-solid fa-cloud-arrow-up"></i> Contribute Notes for this Course
        </button>
      </div>
    </div>

    <!-- SECTION 1: OFFICIAL KTU 2024 SYLLABUS (MODULE BREAKDOWN) -->
    <div class="section-divider-title">
      <h2><i class="fa-solid fa-list-check" style="color:var(--primary-red);"></i> Official KTU 2024 Syllabus &mdash; Module Breakdown</h2>
      <span class="count-pill">${c.syllabus.modules.length} Modules &middot; Official Scheme</span>
    </div>
    
    <div class="modules-container">`;

    c.syllabus.modules.forEach(m => {
      html += `
      <div class="module-item">
        <div class="module-header">
          <div class="module-num-badge">M${m.num}</div>
          <h4 class="module-title">Module ${m.num}: ${m.title}</h4>
        </div>
        <p class="module-topics">${m.topics}</p>
      </div>`;
    });

    html += `
    </div>
    <div style="font-size:0.82rem;color:var(--text-muted);display:flex;align-items:center;gap:10px;margin-bottom:2.5rem;padding:12px 18px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);border-radius:14px;">
      <i class="fa-solid fa-circle-check" style="color:#10b981;font-size:1rem;"></i>
      <span>Preserved directly from official KTU B.Tech 2024 curriculum documents published at <a href="${c.syllabus.sourceUrl}" target="_blank" rel="noopener" style="color:#60a5fa;text-decoration:underline;">ktu.edu.in</a>.</span>
    </div>

    <!-- SECTION 2: SUPPLEMENTARY STUDY MATERIALS (CLEARLY SEPARATED) -->
    <div class="section-divider-title">
      <h2><i class="fa-solid fa-folder-open" style="color:#60a5fa;"></i> Supplementary Study Materials &amp; Academic Notes</h2>
      <span class="count-pill">${c.notesAvailable && c.studyMaterials ? c.studyMaterials.length + ' Items' : 'Status: Pending'}</span>
    </div>`;

    if(c.notesAvailable && c.studyMaterials && c.studyMaterials.length > 0){
      let mats = c.studyMaterials;
      if(activeCat !== 'all'){
        mats = mats.filter(m => m.type === activeCat);
      }

      const dc = BRANCH_ASSETS[activeBranch]?.color || '#e51a24';

      html += `
      <div class="dept-filters" style="margin-bottom:1.5rem;display:flex;justify-content:flex-start;">
        <button class="dept-btn ${activeCat==='all'?'active':''}" onclick="filterCat('all')"><i class="fa-solid fa-shapes"></i> All (${c.studyMaterials.length})</button>
        <button class="dept-btn ${activeCat==='notes'?'active':''}" onclick="filterCat('notes')"><i class="fa-solid fa-book"></i> Notes</button>
        <button class="dept-btn ${activeCat==='qp'?'active':''}" onclick="filterCat('qp')"><i class="fa-solid fa-file-lines"></i> Question Papers</button>
        <button class="dept-btn ${activeCat==='internal'?'active':''}" onclick="filterCat('internal')"><i class="fa-solid fa-file-pen"></i> Solved Internals</button>
        <button class="dept-btn ${activeCat==='lab'?'active':''}" onclick="filterCat('lab')"><i class="fa-solid fa-flask"></i> Lab Manuals</button>
      </div>`;

      if(!mats.length){
        html += `
        <div class="mace-empty" style="padding:2.5rem 1.5rem;text-align:center;">
          <p style="color:var(--text-muted);font-size:0.9rem;">No resources found under the selected filter "${activeCat}".</p>
          <button onclick="filterCat('all')" class="nbtn nbtn-g" style="padding:8px 18px;border-radius:50px;margin:10px auto 0;display:inline-flex;">View All Materials</button>
        </div>`;
      } else {
        html += `<div class="notes-grid">`;
        mats.forEach(m => {
          const pv = 'https://drive.google.com/file/d/' + m.driveId + '/preview';
          const po = m.driveUrl || ('https://drive.google.com/file/d/' + m.driveId + '/view');
          const safeTitle = (m.title || '').replace(/"/g, '&quot;').replace(/'/g, '&#39;');
          const tagMap = {
            notes: `<span class="note-tag t-mod">${m.module ? 'Module ' + m.module : 'Notes'}</span>`,
            qp: '<span class="note-tag t-qp"><i class="fa-solid fa-file-lines"></i> Prev Year QP</span>',
            internal: '<span class="note-tag t-mod" style="background:rgba(251,191,36,0.15);color:#fde047;border-color:rgba(251,191,36,0.3);"><i class="fa-solid fa-file-pen"></i> Internal Solved</span>',
            elective: '<span class="note-tag t-new" style="background:rgba(168,85,247,0.15);color:#d8b4fe;border-color:rgba(168,85,247,0.3);"><i class="fa-solid fa-star"></i> Elective</span>',
            lab: '<span class="note-tag t-new" style="background:rgba(16,185,129,0.15);color:#6ee7b7;border-color:rgba(16,185,129,0.3);"><i class="fa-solid fa-flask"></i> Lab Manual</span>'
          };

          html += `
          <div class="note-card" data-s="${safeTitle}">
            <div class="note-top">
              <div class="note-icon" style="background:rgba(229,26,36,0.1);border:1px solid rgba(229,26,36,0.22);color:var(--primary-red);">
                <i class="fa-solid ${gIcon(c.title)}"></i>
              </div>
              <div class="note-info">
                <div class="note-subject" title="${safeTitle}">${safeTitle}</div>
                <div class="note-code">${c.code} &middot; ${c.sem.toUpperCase()}</div>
              </div>
            </div>
            <div class="note-meta">
              ${tagMap[m.type] || tagMap.notes}
              <span class="note-tag t-pdf"><i class="fa-solid fa-file-pdf"></i> Verified PDF</span>
            </div>
            <div class="resource-source-attribution">
              <i class="fa-solid fa-circle-check" style="color:#10b981;"></i> Source: ${m.source}
            </div>
            <div class="note-footer">
              <button class="nbtn nbtn-p" onclick="openPdfModal('${pv}','${po}',this.getAttribute('data-t'))" data-t="${safeTitle}"><i class="fa-solid fa-eye"></i> View PDF</button>
              <a href="${po}" target="_blank" rel="noopener" class="nbtn nbtn-g" title="Open in Google Drive"><i class="fa-brands fa-google-drive"></i></a>
            </div>
          </div>`;
        });
        html += `</div>`;
      }
    } else {
      // Notes not yet available: Graceful handling per requirement 4
      html += `
      <div class="pending-notes-card">
        <i class="fa-solid fa-hourglass-half" style="font-size:2.5rem;color:#f59e0b;display:block;margin-bottom:12px;"></i>
        <h3>Study Notes Not Yet Available for ${c.code}</h3>
        <p>${c.notesPendingMessage || 'The official KTU 2024 syllabus for this course is published and displayed above. Supplementary study notes, solved question papers, and lab manuals are currently in compilation by Academic Support Cell coordinators and verified student contributors.'}</p>
        <div style="display:flex;gap:12px;justify-content:center;flex-wrap:wrap;">
          <button onclick="openContributeForSubject('${c.sem}', '${activeBranch||c.branch}', '${c.title}')" class="nbtn nbtn-p" style="border-radius:50px;padding:12px 28px;">
            <i class="fa-solid fa-cloud-arrow-up"></i> Contribute Notes for ${c.code}
          </button>
          <a href="https://drive.google.com/drive/folders/1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR" target="_blank" rel="noopener" class="nbtn nbtn-g" style="border-radius:50px;padding:12px 28px;">
            <i class="fa-brands fa-google-drive"></i> Search Master ASC Drive
          </a>
        </div>
      </div>`;
    }

    contentDiv.innerHTML = html;
    return;
  }
}

function openPdfModal(pv,po,title){
  document.getElementById('pdfModalTitle').textContent = title;
  document.getElementById('pdfOpenLink').href = po;
  document.getElementById('pdfModalLoading').classList.remove('hidden');
  document.getElementById('pdfModalFrame').src = pv;
  document.getElementById('pdfModal').classList.add('open');
  document.body.style.overflow = 'hidden';
}

function closePdfModal(){
  document.getElementById('pdfModal').classList.remove('open');
  document.getElementById('pdfModalFrame').src = '';
  document.body.style.overflow = '';
}
document.addEventListener('keydown', e => { if(e.key === 'Escape') closePdfModal(); });

function switchTab(t){
  document.querySelectorAll('.source-tab').forEach(x => x.classList.remove('active'));
  document.querySelectorAll('.notes-panel').forEach(x => x.classList.remove('active'));
  const tabEl = document.getElementById('tab-' + t);
  const panelEl = document.getElementById('panel-' + t);
  if(tabEl) tabEl.classList.add('active');
  if(panelEl) panelEl.classList.add('active');
  const ct = document.getElementById('tab-contribute');
  if(ct) ct.style.cssText = t === 'contribute' ? 'border-color:rgba(99,102,241,0.7);background:rgba(99,102,241,0.15);color:white;box-shadow:0 4px 20px rgba(99,102,241,0.25);' : 'border-color:rgba(99,102,241,0.4);';
  const fab = document.getElementById('fab-btn');
  if(fab) fab.style.display = t === 'contribute' ? 'none' : 'flex';
}

// Search input
const searchInput = document.getElementById('notesSearch');
if(searchInput){
  searchInput.addEventListener('input', function(){
    if(document.querySelector('.notes-panel.active').id !== 'panel-mace') return;
    activeSearch = this.value.trim();
    renderNotes();
  });
}

// Contribution Form Handler
function handleNoteContribution(e) {
  e.preventDefault();
  const sem = document.getElementById('contribSem').value;
  const branch = document.getElementById('contribBranch').value;
  const subject = document.getElementById('contribSubject').value.trim();
  const type = document.getElementById('contribType').value;
  const module = parseInt(document.getElementById('contribModule').value) || 0;
  const title = document.getElementById('contribTitle').value.trim();
  const driveUrl = document.getElementById('contribDriveUrl').value.trim();
  const author = (document.getElementById('contribAuthor').value.trim()) || 'ASC Contributor';

  if (!sem || !branch || !subject || !title || !driveUrl) {
    alert('Please fill in all required fields (Semester, Branch, Subject, Title, and Drive URL).');
    return;
  }

  const dm = driveUrl.match(/\/d\/([a-zA-Z0-9_-]+)/) || driveUrl.match(/id=([a-zA-Z0-9_-]+)/);
  const driveId = dm ? dm[1] : '1zITR4fooYBl2_gOdFOATBJBeVmm1jAKR';

  const newMaterial = {
    id: 'contrib-' + Date.now(),
    type: type,
    module: module,
    title: title,
    source: `Verified Contributor (${author})`,
    driveId: driveId,
    driveUrl: driveUrl
  };

  // Attach to matching course in allCourses
  let matchedCourse = allCourses.find(c => c.sem === sem.toLowerCase() && (c.title.toLowerCase().includes(subject.toLowerCase()) || c.code.toLowerCase() === subject.toLowerCase()));
  if (matchedCourse) {
    if (!matchedCourse.studyMaterials) matchedCourse.studyMaterials = [];
    matchedCourse.studyMaterials.unshift(newMaterial);
    matchedCourse.notesAvailable = true;
  }

  // Save to localStorage
  try {
    const saved = JSON.parse(localStorage.getItem('mace_contributed_notes') || '[]');
    saved.unshift({
      sem: sem.toLowerCase(),
      branch: branch,
      subject: subject,
      ...newMaterial
    });
    localStorage.setItem('mace_contributed_notes', JSON.stringify(saved));
  } catch(err){}

  updateSemBadges();

  const msgBox = document.getElementById('contribSuccessMsg');
  const msgTxt = document.getElementById('contribSuccessText');
  const viewBtn = document.getElementById('contribViewNowBtn');

  if(msgTxt) msgTxt.innerHTML = `Your note for <strong>${sem.toUpperCase()} &rarr; ${branch} &rarr; ${subject}</strong> has been added to the database.`;
  if(viewBtn) {
    viewBtn.onclick = function() {
      switchTab('mace');
      filterSem(sem.toLowerCase());
      selectBranch(branch);
      if (matchedCourse) {
        selectSubject(matchedCourse.code);
      }
    };
  }
  if(msgBox){
    msgBox.style.display = 'block';
    msgBox.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
  }
}

function updateContribSubjectSuggestions() {
  const sem = document.getElementById('contribSem')?.value;
  const branch = document.getElementById('contribBranch')?.value;
  const dl = document.getElementById('subjectSuggestionsList');
  if (!dl) return;
  dl.innerHTML = '';
  const subjs = new Set();
  allCourses.forEach(c => {
    if ((!sem || c.sem === sem) && (!branch || (c.branch === branch || (Array.isArray(c.branches) && c.branches.includes(branch))))) {
      if (c.title) subjs.add(`${c.code}: ${c.title}`);
    }
  });
  subjs.forEach(s => {
    const opt = document.createElement('option');
    opt.value = s;
    dl.appendChild(opt);
  });
}
function onContribSemChange(){ updateContribSubjectSuggestions(); }
function onContribBranchChange(){ updateContribSubjectSuggestions(); }

// Initial load
window.addEventListener('DOMContentLoaded', () => {
  // Load any previously contributed notes from localStorage
  try {
    const localSaved = JSON.parse(localStorage.getItem('mace_contributed_notes') || '[]');
    if (Array.isArray(localSaved) && localSaved.length) {
      localSaved.forEach(sn => {
        const match = allCourses.find(c => c.sem === sn.sem && (c.title.toLowerCase().includes((sn.subject||'').toLowerCase()) || c.code.toLowerCase() === (sn.subject||'').toLowerCase()));
        if (match) {
          if (!match.studyMaterials) match.studyMaterials = [];
          if (!match.studyMaterials.some(m => m.title === sn.title && m.driveId === sn.driveId)) {
            match.studyMaterials.unshift({
              id: sn.id || ('contrib-' + Math.random().toString(36).substr(2, 4)),
              type: sn.type || 'notes',
              module: sn.module || 0,
              title: sn.title,
              source: sn.source || 'Verified Student Contributor',
              driveId: sn.driveId,
              driveUrl: sn.driveUrl
            });
            match.notesAvailable = true;
          }
        }
      });
    }
  } catch(e){}

  // Handle URL parameters or hash
  const urlParams = new URLSearchParams(window.location.search);
  const semParam = urlParams.get('sem');
  const branchParam = urlParams.get('branch');
  const subjectParam = urlParams.get('subject');

  if (window.location.hash === '#contribute' || window.location.search.includes('contribute')) {
    switchTab('contribute');
  } else if (semParam && semParam.match(/^s[1-8]$/i)) {
    activeSem = semParam.toLowerCase();
    if (branchParam) {
      activeBranch = branchParam.toUpperCase();
      if (subjectParam) {
        activeSubject = subjectParam.toUpperCase();
      }
    }
    renderNotes();
  } else if (window.location.hash && window.location.hash.match(/^#s[1-8]/i)) {
    activeSem = window.location.hash.substring(1).toLowerCase();
    renderNotes();
  } else {
    renderNotes();
  }
});

// Render initial state
renderNotes();
