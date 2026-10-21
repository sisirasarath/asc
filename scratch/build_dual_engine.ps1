# Build script for js/portal-dual-engine.js and asc/js/portal-dual-engine.js

$jsEngine = @'
/**
 * Academic Support Portal - Dual Engine
 * 1. KTU 2024 Scheme Curriculum & Syllabus (ktu.edu.in)
 * 2. MACE Notes Repository (Google Drive: 14gJFSIAIDW73bqH2tzm-1TsCfXmVDKSa)
 */

// ── Shared Configuration & Assets ───────────────────────────
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
  s1: { num: 'S1', name: 'Semester 1', desc: 'Foundation courses across Groups A, B, and C.' },
  s2: { num: 'S2', name: 'Semester 2', desc: 'Applied engineering foundations and introductory department papers.' },
  s3: { num: 'S3', name: 'Semester 3', desc: 'Department core foundations and mathematical techniques.' },
  s4: { num: 'S4', name: 'Semester 4', desc: 'Intermediate department core and laboratory practices.' },
  s5: { num: 'S5', name: 'Semester 5', desc: 'Advanced department core systems, analytics, and design.' },
  s6: { num: 'S6', name: 'Semester 6', desc: 'Specialized branch technologies, compilers, and core electives.' },
  s7: { num: 'S7', name: 'Semester 7', desc: 'Emerging tech, distributed systems, and technical seminars.' },
  s8: { num: 'S8', name: 'Semester 8', desc: 'Capstone design project, comprehensive viva voce, and industrial internship.' }
};

const ICONS = {
  'DATA ANALYTICS': 'fa-chart-pie',
  'BIG DATA': 'fa-server',
  'PYTHON': 'fa-brands fa-python',
  'C PROG': 'fa-code',
  'MACHINE LEARNING': 'fa-robot',
  'DEEP LEARNING': 'fa-brain',
  'AI': 'fa-brain',
  'AUTOMATA': 'fa-diagram-project',
  'DBMS': 'fa-database',
  'DATA STRUCTURES': 'fa-sitemap',
  'NETWORK': 'fa-network-wired',
  'OPERATING SYSTEM': 'fa-microchip',
  'MATH': 'fa-square-root-variable',
  'PHYSICS': 'fa-atom',
  'CHEMISTRY': 'fa-flask',
  'MECHANICS': 'fa-gear',
  'FLUID': 'fa-droplet',
  'THERMAL': 'fa-fire',
  'CIRCUITS': 'fa-plug',
  'POWER': 'fa-bolt',
  'VLSI': 'fa-microchip',
  'CIVIL': 'fa-building',
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

// ═════════════════════════════════════════════════════════════
// 1. OFFICIAL KTU 2024 CURRICULUM STATE & LOGIC
// ═════════════════════════════════════════════════════════════
let ktuCourses = (typeof KTU_2024_CURRICULUM_DATA !== 'undefined') ? JSON.parse(JSON.stringify(KTU_2024_CURRICULUM_DATA)) : [];
let ktuSem = 's1', ktuBranch = null, ktuSubject = null, ktuSearch = '';

function updateKtuSemBadges(){
  ['s1','s2','s3','s4','s5','s6','s7','s8'].forEach(s => {
    const cnt = ktuCourses.filter(c => c.sem === s).length;
    const badge = document.getElementById('ktu-badge-' + s);
    if(badge) badge.textContent = cnt ? (cnt + ' Subjects') : '0';
  });
}

function filterKtuSem(sem, btn){
  document.querySelectorAll('#ktu-sem-filters .sem-btn').forEach(b => b.classList.remove('active'));
  const target = btn || document.querySelector(`#ktu-sem-filters [data-sem="${sem}"]`);
  if(target) target.classList.add('active');
  ktuSem = sem;
  ktuBranch = null;   // Displays branch cards
  ktuSubject = null;
  ktuSearch = '';
  renderKtu2024();
}

function selectKtuBranch(b){
  ktuBranch = b;     // Displays subjects
  ktuSubject = null;
  renderKtu2024();
  const el = document.getElementById('ktu-branch-anchor') || document.getElementById('ktu2024-content');
  if(el){
    window.scrollTo({top: Math.max(0, el.getBoundingClientRect().top + window.scrollY - 90), behavior: 'smooth'});
  }
}

function clearKtuBranch(){
  ktuBranch = null;
  ktuSubject = null;
  renderKtu2024();
}

function selectKtuSubject(code){
  ktuSubject = code; // Displays syllabus modules & verified materials
  renderKtu2024();
  const el = document.getElementById('ktu-subj-anchor') || document.getElementById('ktu2024-content');
  if(el){
    window.scrollTo({top: Math.max(0, el.getBoundingClientRect().top + window.scrollY - 90), behavior: 'smooth'});
  }
}

function clearKtuSubject(){
  ktuSubject = null;
  renderKtu2024();
}

// Aliases for course selection
const selectKtuCourse = selectKtuSubject;
const clearKtuCourse = clearKtuSubject;

function renderKtu2024(){
  updateKtuSemBadges();
  const content = document.getElementById('ktu2024-content');
  if(!content) return;

  const info = SEM_INFO[ktuSem] || SEM_INFO.s1;
  const semCourses = ktuCourses.filter(c => c.sem === ktuSem);

  let html = '';

  // Search Results
  if(ktuSearch && ktuSearch.trim() !== ''){
    const q = ktuSearch.toLowerCase().trim();
    const matches = ktuCourses.filter(c => 
      c.code.toLowerCase().includes(q) || 
      c.title.toLowerCase().includes(q) || 
      (c.syllabus && c.syllabus.modules && c.syllabus.modules.some(m => m.title.toLowerCase().includes(q) || m.topics.toLowerCase().includes(q)))
    );

    html += `
    <div class="portal-breadcrumb-bar">
      <span class="crumb-btn" onclick="filterKtuSem('s1')"><i class="fa-solid fa-graduation-cap"></i> KTU 2024</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-active"><i class="fa-solid fa-magnifying-glass"></i> Search "${ktuSearch}"</span>
    </div>
    <div class="section-divider-title">
      <h2><i class="fa-solid fa-magnifying-glass" style="color:var(--primary-red);"></i> Matching KTU 2024 Scheme Subjects</h2>
      <span class="count-pill">${matches.length} Found</span>
    </div>`;

    if(!matches.length){
      html += `
      <div class="mace-empty" style="padding:3.5rem 1.5rem;text-align:center;">
        <i class="fa-solid fa-search" style="font-size:2.8rem;color:var(--text-muted);margin-bottom:12px;display:block;"></i>
        <h3 style="color:white;margin-bottom:8px;">No KTU subjects found matching "${ktuSearch}"</h3>
        <p style="font-size:0.88rem;color:var(--text-muted);max-width:500px;margin:0 auto 1.5rem;">Try searching course codes like GAMAT101, PCDST501, or topics like Data Analytics, Python, Calculus.</p>
        <button onclick="document.getElementById('notesSearch').value='';ktuSearch='';renderKtu2024();" class="nbtn nbtn-p" style="padding:10px 24px;border-radius:50px;display:inline-flex;">Clear Search</button>
      </div>`;
    } else {
      html += `<div class="subject-card-grid">`;
      matches.forEach(c => {
        html += `
        <div class="subject-card" onclick="filterKtuSem('${c.sem}');selectKtuBranch('${c.branch}');selectKtuSubject('${c.code}')">
          <div>
            <div class="subj-card-header">
              <span class="subj-code-badge">${c.code}</span>
              <span class="subj-cat-badge">${c.sem.toUpperCase()} &middot; ${(c.branches||[c.branch]).join(', ')}</span>
            </div>
            <h3 class="subj-card-title">${c.title}</h3>
            <div class="subj-card-meta">
              <span><i class="fa-solid fa-award" style="color:#f59e0b;"></i> ${c.credits} Credits</span>
              <span><i class="fa-solid fa-clock" style="color:#60a5fa;"></i> L-T-P-R: ${c.l_t_p_r}</span>
              <span><i class="fa-solid fa-list-check" style="color:#10b981;"></i> ${c.syllabus.modules.length} Modules</span>
            </div>
          </div>
          <div class="subj-mat-status">
            ${c.notesAvailable && c.studyMaterials && c.studyMaterials.length ? `<span class="subj-mat-pill mat-available"><i class="fa-solid fa-circle-check"></i> ${c.studyMaterials.length} Materials</span>` : `<span class="subj-mat-pill mat-pending"><i class="fa-solid fa-clock"></i> Official Syllabus</span>`}
            <span class="subj-card-cta">View Details &rarr;</span>
          </div>
        </div>`;
      });
      html += `</div>`;
    }
    content.innerHTML = html;
    return;
  }

  // KTU Stage 1: Semester View (Branch Cards)
  if(!ktuBranch && !ktuSubject){
    html += `
    <div class="portal-breadcrumb-bar">
      <span class="crumb-btn" onclick="filterKtuSem('s1')"><i class="fa-solid fa-graduation-cap"></i> KTU 2024 Scheme</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-active"><i class="fa-solid fa-code-branch"></i> ${info.num} Branch Selection</span>
    </div>

    <div class="sem-hero-card">
      <div class="sem-hero-badge">${info.num}</div>
      <div class="sem-hero-info">
        <div style="display:flex;align-items:center;gap:10px;margin-bottom:6px;flex-wrap:wrap;">
          <span class="sem-badge-tag">OFFICIAL 2024 CURRICULUM</span>
          <span style="font-size:0.78rem;color:var(--text-muted);"><i class="fa-solid fa-folder-tree" style="margin-right:4px;"></i> ${semCourses.length} Verified Subjects</span>
        </div>
        <h3>${info.num} &mdash; ${info.name}</h3>
        <p>${info.desc}</p>
      </div>
      <div class="sem-hero-actions">
        <a href="https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech" target="_blank" rel="noopener" class="nbtn nbtn-p" style="border-radius:50px;padding:11px 22px;display:inline-flex;align-items:center;gap:8px;">
          <i class="fa-solid fa-arrow-up-right-from-square"></i> ktu.edu.in Portal
        </a>
      </div>
    </div>

    <div class="section-divider-title">
      <div>
        <h2><i class="fa-solid fa-code-branch" style="color:var(--primary-red);"></i> ${info.num} Applicable Branches</h2>
        <p style="font-size:0.86rem;color:var(--text-muted);margin:4px 0 0 0;">Click your engineering branch to view its official subjects and module syllabi.</p>
      </div>
      <span class="count-pill">Strict Branch Mapping</span>
    </div>
    
    <div class="branch-cat-grid">`;

    for(const b of BRANCH_ORDER){
      const asset = BRANCH_ASSETS[b];
      const count = semCourses.filter(c => (c.branches && c.branches.includes(b)) || c.branch === b).length;
      const svgUri = 'data:image/svg+xml;charset=utf-8,' + encodeURIComponent(asset.svg);
      html += `
      <div class="branch-dept-card" onclick="selectKtuBranch('${b}')" title="${asset.full}">
        <div class="branch-dept-img" style="background-image:url('${svgUri}');">
          <div class="branch-code-badge">${asset.code}</div>
        </div>
        <div class="branch-dept-info">
          <h3 class="branch-title-lg">${asset.name}</h3>
          <span class="branch-tag-pill"><i class="fa-solid ${asset.icon}"></i> ${count} KTU SUBJECTS</span>
          <span class="branch-cta-text"><i class="fa-solid fa-arrow-right"></i> View Subjects</span>
        </div>
      </div>`;
    }
    html += `</div>`;
    content.innerHTML = html;
    return;
  }

  // KTU Stage 2: Branch View (Subject Cards)
  if(ktuBranch && !ktuSubject){
    const asset = BRANCH_ASSETS[ktuBranch] || BRANCH_ASSETS.CSE;
    const branchCourses = semCourses.filter(c => (c.branches && c.branches.includes(ktuBranch)) || c.branch === ktuBranch);

    html += `
    <div id="ktu-branch-anchor"></div>
    <div class="portal-breadcrumb-bar">
      <span class="crumb-btn" onclick="filterKtuSem('${ktuSem}')"><i class="fa-solid fa-graduation-cap"></i> ${info.num}</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-btn" onclick="clearKtuBranch()">Branches</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-active"><i class="fa-solid ${asset.icon}"></i> ${asset.full}</span>
    </div>

    <div class="branch-nav-header">
      <button onclick="clearKtuBranch()" class="branch-back-btn"><i class="fa-solid fa-arrow-left"></i> Back to ${info.num} Branches</button>
      <span class="branch-breadcrumb">${info.num} &middot; <strong style="color:white;">${asset.name}</strong></span>
    </div>

    <div class="section-divider-title">
      <div>
        <h2><i class="fa-solid fa-book-bookmark" style="color:var(--primary-red);"></i> ${info.num} ${asset.code} Curriculum Subjects</h2>
        <p style="font-size:0.86rem;color:var(--text-muted);margin:4px 0 0 0;">Select a subject below to view its official syllabus module breakdown and study resources.</p>
      </div>
      <span class="count-pill">${branchCourses.length} Subjects</span>
    </div>

    <div class="subject-card-grid">`;

    branchCourses.forEach(c => {
      const matCount = (c.studyMaterials && c.studyMaterials.length) ? c.studyMaterials.length : 0;
      html += `
      <div class="subject-card" onclick="selectKtuSubject('${c.code}')">
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
          ${c.notesAvailable && matCount > 0 ? `<span class="subj-mat-pill mat-available"><i class="fa-solid fa-circle-check"></i> ${matCount} Materials</span>` : `<span class="subj-mat-pill mat-pending"><i class="fa-solid fa-clock"></i> Official Syllabus</span>`}
          <span class="subj-card-cta">View Syllabus &rarr;</span>
        </div>
      </div>`;
    });
    html += `</div>`;
    content.innerHTML = html;
    return;
  }

  // KTU Stage 3: Subject View (Syllabus & Materials)
  if(ktuSubject){
    const c = ktuCourses.find(x => x.code === ktuSubject && x.sem === ktuSem) || ktuCourses.find(x => x.code === ktuSubject);
    const asset = BRANCH_ASSETS[ktuBranch] || BRANCH_ASSETS[c.branch] || BRANCH_ASSETS.CSE;

    html += `
    <div id="ktu-subj-anchor"></div>
    <div class="portal-breadcrumb-bar">
      <span class="crumb-btn" onclick="filterKtuSem('${ktuSem}')">${info.num}</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-btn" onclick="clearKtuSubject()">${asset.name}</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-active">${c.code}: ${c.title}</span>
    </div>

    <div class="branch-nav-header">
      <button onclick="clearKtuSubject()" class="branch-back-btn"><i class="fa-solid fa-arrow-left"></i> Back to ${asset.name} Subjects</button>
      <span class="branch-breadcrumb"><i class="fa-solid fa-graduation-cap"></i> ${c.code} &middot; ${info.num} ${asset.code}</span>
    </div>

    <div class="subject-hero-spotlight">
      <div class="subject-meta-chips">
        <span class="subject-meta-chip chip-code"><i class="fa-solid fa-hashtag"></i> ${c.code}</span>
        <span class="subject-meta-chip"><i class="fa-solid fa-layer-group"></i> ${c.category}</span>
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
      </div>
    </div>

    <div class="section-divider-title">
      <h2><i class="fa-solid fa-list-check" style="color:var(--primary-red);"></i> Official KTU 2024 Syllabus &mdash; Module Breakdown</h2>
      <span class="count-pill">${c.syllabus.modules.length} Modules &middot; 2024 Scheme</span>
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

    <!-- Supplementary Study Materials Section -->
    <div class="section-divider-title" style="margin-top:2.5rem;">
      <h2><i class="fa-solid fa-folder-open" style="color:#60a5fa;"></i> Supplementary Study Materials &amp; Notes</h2>
      <span class="count-pill">${c.notesAvailable && c.studyMaterials ? c.studyMaterials.length + ' Items' : 'Status: Pending'}</span>
    </div>`;

    if(c.notesAvailable && c.studyMaterials && c.studyMaterials.length > 0){
      html += `<div class="notes-grid">`;
      c.studyMaterials.forEach(m => {
        const pv = 'https://drive.google.com/file/d/' + m.driveId + '/preview';
        const po = m.driveUrl || ('https://drive.google.com/file/d/' + m.driveId + '/view');
        const safeTitle = (m.title || '').replace(/"/g, '&quot;').replace(/'/g, '&#39;');
        html += `
        <div class="note-card">
          <div class="note-top">
            <div class="note-icon"><i class="fa-solid ${gIcon(c.title)}"></i></div>
            <div class="note-info">
              <div class="note-subject" title="${safeTitle}">${safeTitle}</div>
              <div class="note-code">${c.code} &middot; ${c.sem.toUpperCase()}</div>
            </div>
          </div>
          <div class="resource-source-attribution">
            <i class="fa-solid fa-circle-check" style="color:#10b981;"></i> Source: ${m.source}
          </div>
          <div class="note-footer">
            <button class="nbtn nbtn-p" onclick="openPdfModal('${pv}','${po}',this.getAttribute('data-t'))" data-t="${safeTitle}"><i class="fa-solid fa-eye"></i> View PDF</button>
            <a href="${po}" target="_blank" rel="noopener" class="nbtn nbtn-g" title="Open in Drive"><i class="fa-brands fa-google-drive"></i></a>
          </div>
        </div>`;
      });
      html += `</div>`;
    } else {
      html += `
      <div class="pending-notes-card">
        <i class="fa-solid fa-hourglass-half" style="font-size:2.5rem;color:#f59e0b;display:block;margin-bottom:12px;"></i>
        <h3>Study Notes Not Yet Available for ${c.code}</h3>
        <p>${c.notesPendingMessage || 'The official KTU 2024 syllabus for this course is published and displayed above. Supplementary study notes, solved papers, and lab manuals are currently in compilation.'}</p>
        <div style="display:flex;gap:12px;justify-content:center;flex-wrap:wrap;">
          <button onclick="switchTab('contribute')" class="nbtn nbtn-p" style="border-radius:50px;padding:12px 28px;">
            <i class="fa-solid fa-cloud-arrow-up"></i> Contribute Notes
          </button>
          <a href="https://drive.google.com/drive/folders/14gJFSIAIDW73bqH2tzm-1TsCfXmVDKSa" target="_blank" rel="noopener" class="nbtn nbtn-g" style="border-radius:50px;padding:12px 28px;">
            <i class="fa-brands fa-google-drive"></i> Open MACE Drive
          </a>
        </div>
      </div>`;
    }

    content.innerHTML = html;
    return;
  }
}

// ═════════════════════════════════════════════════════════════
// 2. MACE NOTES SECTION (GOOGLE DRIVE 14gJFSIAIDW73bqH2tzm-1TsCfXmVDKSa)
// ═════════════════════════════════════════════════════════════
const MACE_DRIVE_URL = 'https://drive.google.com/drive/folders/14gJFSIAIDW73bqH2tzm-1TsCfXmVDKSa';
let maceNotes = (typeof MACE_PRELOADED_NOTES !== 'undefined') ? [...MACE_PRELOADED_NOTES] : [];
let maceSem = 's1', maceBranch = null, maceSubject = null, maceCat = 'all', maceSearch = '';

function updateMaceSemBadges(){
  ['s1','s2','s3','s4','s5','s6','s7','s8'].forEach(s => {
    const cnt = maceNotes.filter(n => n.sem === s).length;
    const badge = document.getElementById('mace-badge-' + s);
    if(badge) badge.textContent = cnt ? cnt : '0';
  });
}

function filterMaceSem(sem, btn){
  document.querySelectorAll('#mace-sem-filters .sem-btn').forEach(b => b.classList.remove('active'));
  const target = btn || document.querySelector(`#mace-sem-filters [data-sem="${sem}"]`);
  if(target) target.classList.add('active');
  maceSem = sem;
  maceBranch = null;  // Branch cards view
  maceSubject = null;
  maceCat = 'all';
  maceSearch = '';
  renderMaceNotes();
}

function selectMaceBranch(b){
  maceBranch = b;     // Subjects view
  maceSubject = null;
  maceCat = 'all';
  renderMaceNotes();
  const el = document.getElementById('mace-branch-anchor') || document.getElementById('mace-content');
  if(el){
    window.scrollTo({top: Math.max(0, el.getBoundingClientRect().top + window.scrollY - 90), behavior: 'smooth'});
  }
}

function clearMaceBranch(){
  maceBranch = null;
  maceSubject = null;
  maceCat = 'all';
  renderMaceNotes();
}

function selectMaceSubject(s){
  maceSubject = s;   // Notes list for that subject
  renderMaceNotes();
  const el = document.getElementById('mace-subj-anchor') || document.getElementById('mace-content');
  if(el){
    window.scrollTo({top: Math.max(0, el.getBoundingClientRect().top + window.scrollY - 90), behavior: 'smooth'});
  }
}

function clearMaceSubject(){
  maceSubject = null;
  renderMaceNotes();
}

function filterMaceCat(cat, btn){
  document.querySelectorAll('#mace-cat-filters .dept-btn').forEach(b => b.classList.remove('active'));
  if(btn) btn.classList.add('active');
  maceCat = cat;
  renderMaceNotes();
}

function renderMaceNotes(){
  updateMaceSemBadges();
  const content = document.getElementById('mace-content');
  const catFilters = document.getElementById('mace-cat-filters');
  const resultsBar = document.getElementById('mace-results-bar');
  if(!content) return;

  const info = SEM_INFO[maceSem] || SEM_INFO.s1;
  const semNotes = maceNotes.filter(n => n.sem === maceSem);

  let html = '';

  // Drive Panel Action
  if(maceCat === 'drive'){
    window.open(MACE_DRIVE_URL, '_blank');
    maceCat = 'all';
  }

  // Search Results
  if(maceSearch && maceSearch.trim() !== ''){
    const q = maceSearch.toLowerCase().trim();
    const matches = maceNotes.filter(n => 
      n.title.toLowerCase().includes(q) || 
      (n.subject || '').toLowerCase().includes(q) ||
      (n.noteLabel || '').toLowerCase().includes(q)
    );

    html += `
    <div class="portal-breadcrumb-bar">
      <span class="crumb-btn" onclick="filterMaceSem('s1')"><i class="fa-solid fa-folder-tree"></i> MACE Notes</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-active"><i class="fa-solid fa-magnifying-glass"></i> Search "${maceSearch}"</span>
    </div>
    <div class="section-divider-title">
      <h2><i class="fa-solid fa-magnifying-glass" style="color:var(--primary-red);"></i> Matching MACE Notes</h2>
      <span class="count-pill">${matches.length} Notes</span>
    </div>`;

    if(!matches.length){
      html += `
      <div class="mace-empty" style="padding:3.5rem 1.5rem;text-align:center;">
        <i class="fa-solid fa-folder-open" style="font-size:2.8rem;color:var(--text-muted);margin-bottom:12px;display:block;"></i>
        <h3 style="color:white;margin-bottom:8px;">No MACE notes found matching "${maceSearch}"</h3>
        <p style="font-size:0.88rem;color:var(--text-muted);max-width:500px;margin:0 auto 1.5rem;">Try another keyword or search the master Google Drive folder.</p>
        <a href="${MACE_DRIVE_URL}" target="_blank" rel="noopener" class="nbtn nbtn-p" style="padding:10px 24px;border-radius:50px;display:inline-flex;">Open MACE Drive</a>
      </div>`;
    } else {
      html += `<div class="notes-grid">`;
      matches.forEach(n => {
        const pv = 'https://drive.google.com/file/d/' + n.driveId + '/preview';
        const po = 'https://drive.google.com/file/d/' + n.driveId + '/view';
        const safeTitle = (n.noteLabel || n.title).replace(/"/g, '&quot;').replace(/'/g, '&#39;');
        html += `
        <div class="note-card">
          <div class="note-top">
            <div class="note-icon"><i class="fa-solid ${gIcon(n.subject)}"></i></div>
            <div class="note-info">
              <div class="note-subject" title="${safeTitle}">${safeTitle}</div>
              <div class="note-code">${n.subject} &middot; ${n.sem.toUpperCase()}</div>
            </div>
          </div>
          <div class="resource-source-attribution">
            <i class="fa-brands fa-google-drive" style="color:#60a5fa;"></i> MACE Drive Repository
          </div>
          <div class="note-footer">
            <button class="nbtn nbtn-p" onclick="openPdfModal('${pv}','${po}',this.getAttribute('data-t'))" data-t="${safeTitle}"><i class="fa-solid fa-eye"></i> View PDF</button>
            <a href="${po}" target="_blank" rel="noopener" class="nbtn nbtn-g" title="Open in Drive"><i class="fa-brands fa-google-drive"></i></a>
          </div>
        </div>`;
      });
      html += `</div>`;
    }
    content.innerHTML = html;
    return;
  }

  // MACE Stage 1: Semester View (Branch Cards)
  if(!maceBranch && !maceSubject){
    if(catFilters) catFilters.style.display = 'none';
    if(resultsBar) resultsBar.style.display = 'none';

    html += `
    <div class="portal-breadcrumb-bar">
      <span class="crumb-btn" onclick="filterMaceSem('s1')"><i class="fa-solid fa-folder-tree"></i> MACE Notes</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-active"><i class="fa-solid fa-code-branch"></i> ${info.num} Branch Selection</span>
    </div>

    <div class="sem-hero-card">
      <div class="sem-hero-badge">${info.num}</div>
      <div class="sem-hero-info">
        <div style="display:flex;align-items:center;gap:10px;margin-bottom:6px;flex-wrap:wrap;">
          <span class="sem-badge-tag">MACE DRIVE REPO</span>
          <span style="font-size:0.78rem;color:var(--text-muted);"><i class="fa-solid fa-file-lines" style="margin-right:4px;"></i> ${semNotes.length} Curated Notes</span>
        </div>
        <h3>${info.num} &mdash; ${info.name}</h3>
        <p>Curated module-wise lecture notes, previous university question papers, and solved internal exam series for ${info.num} engineering students.</p>
      </div>
      <div class="sem-hero-actions">
        <a href="${MACE_DRIVE_URL}" target="_blank" rel="noopener" class="nbtn nbtn-p" style="border-radius:50px;padding:11px 22px;display:inline-flex;align-items:center;gap:8px;">
          <i class="fa-brands fa-google-drive"></i> Master Drive
        </a>
      </div>
    </div>

    <div class="section-divider-title">
      <div>
        <h2><i class="fa-solid fa-code-branch" style="color:var(--primary-red);"></i> ${info.num} Departments</h2>
        <p style="font-size:0.86rem;color:var(--text-muted);margin:4px 0 0 0;">Select your engineering branch to view its subjects and files.</p>
      </div>
      <span class="count-pill">${semNotes.length} Notes in ${info.num}</span>
    </div>
    
    <div class="branch-cat-grid">`;

    for(const b of BRANCH_ORDER){
      const asset = BRANCH_ASSETS[b];
      const count = semNotes.filter(n => (n.branches && n.branches.includes(b)) || n.branch === b).length;
      const svgUri = 'data:image/svg+xml;charset=utf-8,' + encodeURIComponent(asset.svg);
      html += `
      <div class="branch-dept-card" onclick="selectMaceBranch('${b}')" title="${asset.full}">
        <div class="branch-dept-img" style="background-image:url('${svgUri}');">
          <div class="branch-code-badge">${asset.code}</div>
        </div>
        <div class="branch-dept-info">
          <h3 class="branch-title-lg">${asset.name}</h3>
          <span class="branch-tag-pill"><i class="fa-solid ${asset.icon}"></i> ${count} NOTES</span>
          <span class="branch-cta-text"><i class="fa-solid fa-arrow-right"></i> View Notes</span>
        </div>
      </div>`;
    }

    // Uncategorized Notes card
    const uncatNotes = semNotes.filter(n => !n.branch || n.branch === 'UNCATEGORIZED' || n.branch === 'COMMON');
    html += `
    <div class="branch-dept-card" onclick="selectMaceBranch('UNCATEGORIZED')" title="General and Uncategorized Study Notes" style="border-color:rgba(251,191,36,0.3);">
      <div class="branch-dept-img" style="background:linear-gradient(135deg,#78350f,#172554);display:flex;align-items:center;justify-content:center;">
        <i class="fa-solid fa-folder-open" style="font-size:3rem;color:#fde68a;"></i>
        <div class="branch-code-badge">MISC</div>
      </div>
      <div class="branch-dept-info">
        <h3 class="branch-title-lg">Uncategorized Notes</h3>
        <span class="branch-tag-pill" style="background:rgba(251,191,36,0.2);color:#fde68a;border-color:rgba(251,191,36,0.4);"><i class="fa-solid fa-folder-open"></i> ${uncatNotes.length} ITEMS</span>
        <span class="branch-cta-text"><i class="fa-solid fa-arrow-right"></i> View Files</span>
      </div>
    </div>`;

    html += `</div>`;
    content.innerHTML = html;
    return;
  }

  // MACE Stage 2: Branch View (Subject List & Notes)
  if(maceBranch){
    if(catFilters) catFilters.style.display = 'flex';
    if(resultsBar) resultsBar.style.display = 'flex';

    const isUncat = (maceBranch === 'UNCATEGORIZED');
    const asset = isUncat ? { code: 'MISC', name: 'Uncategorized Notes', full: 'Uncategorized & General Notes', icon: 'fa-folder-open', color: '#f59e0b' } : (BRANCH_ASSETS[maceBranch] || BRANCH_ASSETS.CSE);

    const f = semNotes.filter(n => {
      if(isUncat){
        if(n.branch && n.branch !== 'UNCATEGORIZED' && n.branch !== 'COMMON' && BRANCH_ORDER.includes(n.branch)) return false;
      } else {
        const canon = (maceBranch === 'CS' ? 'CSE' : (maceBranch === 'EC' ? 'ECE' : (maceBranch === 'ME' ? 'MECH' : (maceBranch === 'CE' ? 'CIVIL' : maceBranch))));
        const inBranches = Array.isArray(n.branches) && (n.branches.includes(canon) || n.branches.includes(maceBranch));
        const inBranch = n.branch && (n.branch === canon || n.branch === maceBranch);
        if(!inBranches && !inBranch) return false;
      }

      if(maceCat === 'notes' && n.type !== 'notes') return false;
      if(maceCat === 'qp' && n.type !== 'qp') return false;
      if(maceCat === 'internal' && n.type !== 'internal') return false;
      if(maceCat === 'lab' && n.type !== 'lab') return false;
      if(maceCat === 'uncategorized' && !isUncat) return false;
      return true;
    });

    const countEl = document.getElementById('mace-count');
    if(countEl) countEl.textContent = f.length;

    html += `
    <div id="mace-branch-anchor"></div>
    <div class="portal-breadcrumb-bar">
      <span class="crumb-btn" onclick="filterMaceSem('${maceSem}')"><i class="fa-solid fa-graduation-cap"></i> ${info.num}</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-btn" onclick="clearMaceBranch()">Branches</span>
      <span class="crumb-sep"><i class="fa-solid fa-chevron-right"></i></span>
      <span class="crumb-active"><i class="fa-solid ${asset.icon}"></i> ${asset.full}</span>
    </div>

    <div class="branch-nav-header">
      <button onclick="clearMaceBranch()" class="branch-back-btn"><i class="fa-solid fa-arrow-left"></i> Back to ${info.num} Branches</button>
      <span class="branch-breadcrumb">${info.num} &middot; <strong style="color:white;">${asset.name}</strong></span>
    </div>

    <div class="section-divider-title">
      <div>
        <h2><i class="fa-solid fa-folder-tree" style="color:var(--primary-red);"></i> ${info.num} ${asset.name} Notes</h2>
        <p style="font-size:0.86rem;color:var(--text-muted);margin:4px 0 0 0;">Browse verified study files from the MACE Google Drive repository.</p>
      </div>
      <a href="${MACE_DRIVE_URL}" target="_blank" rel="noopener" class="nbtn nbtn-g" style="border-radius:50px;padding:8px 18px;display:inline-flex;align-items:center;gap:6px;font-size:0.82rem;">
        <i class="fa-brands fa-google-drive"></i> Open Folder in Drive
      </a>
    </div>`;

    if(!f.length){
      html += `
      <div class="mace-empty" style="padding:3.5rem 1.5rem;text-align:center;">
        <i class="fa-solid fa-folder-open" style="font-size:2.8rem;color:var(--text-muted);margin-bottom:12px;display:block;"></i>
        <h3 style="color:white;margin-bottom:8px;">No notes found for ${info.num} ${asset.name} under filter "${maceCat}"</h3>
        <p style="font-size:0.88rem;color:var(--text-muted);max-width:500px;margin:0 auto 1.5rem;">Access the master Google Drive folder or contribute notes for this subject.</p>
        <button onclick="filterMaceCat('all')" class="nbtn nbtn-p" style="padding:10px 24px;border-radius:50px;display:inline-flex;">View All Notes</button>
      </div>`;
      content.innerHTML = html;
      return;
    }

    // Group notes by Subject
    const bySubject = {};
    f.forEach(n => {
      const s = n.subject || 'Uncategorized Notes';
      if(!bySubject[s]) bySubject[s] = [];
      bySubject[s].push(n);
    });

    for(const [subj, notesList] of Object.entries(bySubject)){
      html += `
      <div class="subj-group">
        <div class="subj-group-header">
          <div class="subj-group-icon" style="background:rgba(229,26,36,0.12);color:var(--primary-red);"><i class="fa-solid ${gIcon(subj)}"></i></div>
          <div>
            <div class="subj-group-title">${subj}</div>
            <div class="subj-group-sub">${asset.code} &middot; ${info.num} &middot; ${notesList.length} Files</div>
          </div>
          <div class="subj-badge">${notesList.length} FILES</div>
        </div>
        <div class="notes-grid">`;

      notesList.sort((a,b) => (a.module||99) - (b.module||99));
      notesList.forEach(n => {
        const pv = 'https://drive.google.com/file/d/' + n.driveId + '/preview';
        const po = 'https://drive.google.com/file/d/' + n.driveId + '/view';
        const safeTitle = (n.noteLabel || n.title).replace(/"/g, '&quot;').replace(/'/g, '&#39;');
        const tagMap = {
          notes: `<span class="note-tag t-mod">${n.module ? 'Module ' + n.module : 'Notes'}</span>`,
          qp: '<span class="note-tag t-qp"><i class="fa-solid fa-file-lines"></i> Prev Year QP</span>',
          internal: '<span class="note-tag t-mod" style="background:rgba(251,191,36,0.15);color:#fde047;border-color:rgba(251,191,36,0.3);"><i class="fa-solid fa-file-pen"></i> Internal Solved</span>',
          lab: '<span class="note-tag t-new"><i class="fa-solid fa-flask"></i> Lab Manual</span>'
        };

        html += `
        <div class="note-card">
          <div class="note-top">
            <div class="note-icon"><i class="fa-solid ${gIcon(subj)}"></i></div>
            <div class="note-info">
              <div class="note-subject" title="${safeTitle}">${safeTitle}</div>
              <div class="note-code">${subj} &middot; ${info.num}</div>
            </div>
          </div>
          <div class="note-meta">
            ${tagMap[n.type] || tagMap.notes}
            <span class="note-tag t-pdf"><i class="fa-solid fa-file-pdf"></i> Verified PDF</span>
          </div>
          <div class="resource-source-attribution">
            <i class="fa-brands fa-google-drive" style="color:#60a5fa;"></i> MACE Drive Repo
          </div>
          <div class="note-footer">
            <button class="nbtn nbtn-p" onclick="openPdfModal('${pv}','${po}',this.getAttribute('data-t'))" data-t="${safeTitle}"><i class="fa-solid fa-eye"></i> View PDF</button>
            <a href="${po}" target="_blank" rel="noopener" class="nbtn nbtn-g" title="Open in Google Drive"><i class="fa-brands fa-google-drive"></i></a>
          </div>
        </div>`;
      });
      html += `</div></div>`;
    }
    content.innerHTML = html;
    return;
  }
}

// ═════════════════════════════════════════════════════════════
// 3. COMMON CONTROLS, TABS, SEARCH, AND MODALS
// ═════════════════════════════════════════════════════════════
let currentTab = 'ktu2024';

function switchTab(t){
  currentTab = t;
  document.querySelectorAll('.source-tab').forEach(x => x.classList.remove('active'));
  document.querySelectorAll('.notes-panel').forEach(x => x.classList.remove('active'));

  const tabEl = document.getElementById('tab-' + t);
  const panelEl = document.getElementById('panel-' + t);
  if(tabEl) tabEl.classList.add('active');
  if(panelEl) panelEl.classList.add('active');

  const search = document.getElementById('notesSearch');
  if(search){
    if(t === 'ktu2024'){
      search.placeholder = 'Search KTU 2024 course codes, subjects, or syllabus topics...';
      search.value = ktuSearch;
    } else if(t === 'mace'){
      search.placeholder = 'Search MACE Drive notes, subjects, or previous question papers...';
      search.value = maceSearch;
    }
  }

  if(t === 'ktu2024') renderKtu2024();
  if(t === 'mace') renderMaceNotes();
}

// PDF Viewer Modal
function openPdfModal(pv, po, title){
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

// Search input listener
const searchInput = document.getElementById('notesSearch');
if(searchInput){
  searchInput.addEventListener('input', function(){
    const val = this.value.trim();
    if(currentTab === 'ktu2024'){
      ktuSearch = val;
      renderKtu2024();
    } else if(currentTab === 'mace'){
      maceSearch = val;
      renderMaceNotes();
    }
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
    alert('Please fill in all required fields.');
    return;
  }

  const dm = driveUrl.match(/\/d\/([a-zA-Z0-9_-]+)/) || driveUrl.match(/id=([a-zA-Z0-9_-]+)/);
  const driveId = dm ? dm[1] : '14gJFSIAIDW73bqH2tzm-1TsCfXmVDKSa';

  const newNote = {
    title: `${sem.toUpperCase()} (${branch}) ${subject} ${module ? 'Mod ' + module : ''} ${title}`,
    noteLabel: title,
    subject: subject,
    module: module,
    sem: sem.toLowerCase(),
    branch: branch,
    branches: [branch],
    type: type,
    driveId: driveId
  };

  // Persist to localStorage
  try {
    const saved = JSON.parse(localStorage.getItem('mace_contributed_notes') || '[]');
    saved.unshift(newNote);
    localStorage.setItem('mace_contributed_notes', JSON.stringify(saved));
  } catch(e){}

  maceNotes.unshift(newNote);
  updateMaceSemBadges();

  const msgBox = document.getElementById('contribSuccessMsg');
  const msgTxt = document.getElementById('contribSuccessText');
  const viewBtn = document.getElementById('contribViewNowBtn');

  if(msgTxt) msgTxt.innerHTML = `Your note for <strong>${sem.toUpperCase()} &rarr; ${branch} &rarr; ${subject}</strong> has been saved.`;
  if(viewBtn) {
    viewBtn.onclick = function() {
      switchTab('mace');
      filterMaceSem(sem.toLowerCase());
      selectMaceBranch(branch);
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
  ktuCourses.forEach(c => {
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

// Initial Render & URL Routing
window.addEventListener('DOMContentLoaded', () => {
  // Load saved notes from localStorage
  try {
    const localSaved = JSON.parse(localStorage.getItem('mace_contributed_notes') || '[]');
    if (Array.isArray(localSaved) && localSaved.length) {
      localSaved.forEach(sn => {
        if (!maceNotes.some(n => n.title === sn.title && n.driveId === sn.driveId)) {
          maceNotes.unshift(sn);
        }
      });
    }
  } catch(e){}

  renderKtu2024();
  renderMaceNotes();
  updateContribSubjectSuggestions();

  const urlParams = new URLSearchParams(window.location.search);
  const tabParam = urlParams.get('tab');
  const semParam = urlParams.get('sem');
  const branchParam = urlParams.get('branch');
  const hash = (window.location.hash || '').toLowerCase();

  if(tabParam && (tabParam === 'mace' || tabParam === 'ktu2024' || tabParam === 'ktu' || tabParam === 'contribute')){
    switchTab(tabParam);
  } else if(hash === '#contribute' || window.location.search.includes('contribute')){
    switchTab('contribute');
  } else if(hash === '#mace'){
    switchTab('mace');
  } else if(hash === '#ktu' || hash === '#ktu2024'){
    switchTab('ktu2024');
  }

  if(semParam && semParam.match(/^s[1-8]$/i)){
    const s = semParam.toLowerCase();
    if(currentTab === 'mace'){
      filterMaceSem(s);
      if(branchParam) selectMaceBranch(branchParam.toUpperCase());
    } else {
      filterKtuSem(s);
      if(branchParam) selectKtuBranch(branchParam.toUpperCase());
    }
  } else if(hash && hash.match(/^#s[1-8]/i)){
    const s = hash.substring(1).toLowerCase();
    if(currentTab === 'mace') filterMaceSem(s);
    else filterKtuSem(s);
  }
});

// Render immediate
renderKtu2024();
renderMaceNotes();
'@

Set-Content -Path "js/portal-dual-engine.js" -Value $jsEngine -Encoding UTF8
Set-Content -Path "asc/js/portal-dual-engine.js" -Value $jsEngine -Encoding UTF8
Write-Host "Created js/portal-dual-engine.js and asc/js/portal-dual-engine.js successfully!"
