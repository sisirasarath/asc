/* ═══════════════════════════════════════════════════════════════════
   ACADEMIC CALCULATORS CONTROLLER
   Native engines for MACE 2024 Scheme & KTU 2019 Scheme
   ═══════════════════════════════════════════════════════════════════ */

// ─────────────────────────────────────────────────────────────────
// 1. MACE 2024 SCHEME SGPA CALCULATOR
// ─────────────────────────────────────────────────────────────────
const MaceCalc = {
  activeDept: 'cs',
  activeSem: 1,
  grades: {},

  init() {
    this.renderDeptSelect();
    this.renderSemSelector();
    this.loadSubjects();
  },

  renderDeptSelect() {
    const el = document.getElementById('mace24-dept-select');
    if (!el) return;
    el.innerHTML = MACE_2024_DEPTS.map(d => 
      `<option value="${d.code}" ${d.code === this.activeDept ? 'selected' : ''}>${d.name}</option>`
    ).join('');
    el.addEventListener('change', (e) => {
      this.activeDept = e.target.value;
      this.loadSubjects();
    });
  },

  renderSemSelector() {
    const wrap = document.getElementById('mace24-sem-buttons');
    if (!wrap) return;
    wrap.innerHTML = [1,2,3,4,5,6,7,8].map(s => 
      `<button type="button" class="sem-btn ${s === this.activeSem ? 'active' : ''}" onclick="MaceCalc.setSem(${s})">S${s}</button>`
    ).join('');
  },

  setSem(s) {
    this.activeSem = s;
    document.querySelectorAll('#mace24-sem-buttons .sem-btn').forEach((b, idx) => {
      b.classList.toggle('active', (idx + 1) === s);
    });
    this.loadSubjects();
  },

  loadSubjects() {
    const container = document.getElementById('mace24-subjects-list');
    const deptData = MACE_2024_SUBJECTS[this.activeDept];
    const semSubjects = deptData ? deptData[this.activeSem] : null;

    this.grades = {};
    this.resetResult();

    if (!semSubjects || Object.keys(semSubjects).length === 0) {
      container.innerHTML = `
        <div style="text-align:center;padding:3rem 1rem;color:var(--text-muted);">
          <i class="fa-solid fa-clock" style="font-size:2rem;color:var(--primary-red);margin-bottom:10px;display:block;"></i>
          <h4 style="color:white;margin-bottom:6px;">Semester ${this.activeSem} Syllabus Coming Soon</h4>
          <p style="font-size:0.85rem;">Course curriculum for this semester will be available shortly.</p>
        </div>`;
      document.getElementById('mace24-calc-btn').disabled = true;
      document.getElementById('mace24-total-cr').textContent = '0';
      return;
    }

    document.getElementById('mace24-calc-btn').disabled = false;

    let totalCr = 0;
    let gradedCr = 0;
    const entries = Object.entries(semSubjects);

    let html = '';
    entries.forEach(([name, credits], idx) => {
      totalCr += credits;
      if (credits > 0) gradedCr += credits;
      const isPF = credits === 0;

      const gradeOpts = [
        '<option value="">Select Grade</option>',
        ...MACE_2024_GRADES.map(g => 
          `<option value="${g.grade}">${g.grade} (${g.points.toFixed(1)} pts &mdash; ${g.desc})</option>`
        )
      ].join('');

      html += `
        <div class="calc-subject-card" id="mace24-card-${idx}">
          <div class="calc-subject-main">
            <div class="calc-sub-index">${idx + 1}</div>
            <div class="calc-sub-details">
              <div class="calc-sub-name">${name}</div>
              <div class="calc-sub-badges">
                ${isPF ? '<span class="badge-pf">Pass / Fail (0 Cr)</span>' : `<span class="badge-cr">${credits} Credit${credits > 1 ? 's' : ''}</span>`}
              </div>
            </div>
          </div>
          <div class="calc-grade-wrap">
            <select class="calc-grade-select" id="mace24-grade-${idx}" data-name="${encodeURIComponent(name)}" data-credits="${credits}" onchange="MaceCalc.onGradeChange(${idx}, this.value)">
              ${gradeOpts}
            </select>
          </div>
        </div>`;
    });

    container.innerHTML = html;
    document.getElementById('mace24-total-cr').textContent = gradedCr + (totalCr > gradedCr ? ` (+${totalCr - gradedCr} P/F)` : '');
  },

  onGradeChange(idx, grade) {
    const sel = document.getElementById(`mace24-grade-${idx}`);
    const name = decodeURIComponent(sel.dataset.name);
    const credits = parseFloat(sel.dataset.credits);
    if (grade) {
      this.grades[name] = { grade, credits };
    } else {
      delete this.grades[name];
    }
  },

  quickFill(targetGrade) {
    const selects = document.querySelectorAll('#mace24-subjects-list .calc-grade-select');
    selects.forEach((sel, idx) => {
      sel.value = targetGrade;
      this.onGradeChange(idx, targetGrade);
    });
  },

  resetAll() {
    const selects = document.querySelectorAll('#mace24-subjects-list .calc-grade-select');
    selects.forEach((sel, idx) => {
      sel.value = '';
      this.onGradeChange(idx, '');
    });
    this.resetResult();
  },

  calculate() {
    const deptData = MACE_2024_SUBJECTS[this.activeDept];
    const semSubjects = deptData ? deptData[this.activeSem] : {};
    const entries = Object.entries(semSubjects);

    if (entries.length === 0) return;

    let totalPoints = 0;
    let gradedCredits = 0;
    let missingCount = 0;
    let backlogCount = 0;

    const gradeMap = {};
    MACE_2024_GRADES.forEach(g => { gradeMap[g.grade] = g.points; });

    entries.forEach(([name, credits]) => {
      const item = this.grades[name];
      if (!item || !item.grade) {
        missingCount++;
        return;
      }
      const pts = gradeMap[item.grade] || 0;
      if (item.grade === 'F' || item.grade === 'FE' || item.grade === 'I') {
        backlogCount++;
      }
      if (credits > 0) {
        gradedCredits += credits;
        totalPoints += pts * credits;
      }
    });

    if (missingCount > 0) {
      alert(`Please select grades for all subjects (${missingCount} subject${missingCount > 1 ? 's' : ''} remaining).`);
      return;
    }

    const sgpa = gradedCredits > 0 ? (totalPoints / gradedCredits) : 0;
    this.showResult(sgpa, totalPoints, gradedCredits, backlogCount);
  },

  showResult(sgpa, totalPoints, gradedCredits, backlogCount) {
    const sgpaValEl = document.getElementById('mace24-result-val');
    const sgpaBadgeEl = document.getElementById('mace24-result-badge');
    const sgpaDescEl = document.getElementById('mace24-result-desc');
    const ptsEl = document.getElementById('mace24-res-pts');
    const crEl = document.getElementById('mace24-res-cr');
    const statusEl = document.getElementById('mace24-res-status');

    sgpaValEl.textContent = sgpa.toFixed(2);
    ptsEl.textContent = totalPoints.toFixed(1);
    crEl.textContent = gradedCredits;

    let badgeText = '';
    let badgeClass = '';
    let descText = '';

    if (backlogCount > 0) {
      badgeText = `${backlogCount} Course${backlogCount > 1 ? 's' : ''} with F / Incomplete`;
      badgeClass = 'badge-res-red';
      descText = 'You have backlog course(s) this semester. Once cleared in supplementary exams, your SGPA will be updated.';
    } else if (sgpa >= 9.0) {
      badgeText = 'Outstanding Performance ⭐';
      badgeClass = 'badge-res-emerald';
      descText = 'Spectacular score! You are in the top percentile of MACE academics.';
    } else if (sgpa >= 8.0) {
      badgeText = 'Excellent Performance 🌟';
      badgeClass = 'badge-res-blue';
      descText = 'Great academic record! Well above First Class with Distinction standards.';
    } else if (sgpa >= 7.0) {
      badgeText = 'Good Performance 👍';
      badgeClass = 'badge-res-cyan';
      descText = 'Solid achievement! Strong standing for placements and higher studies.';
    } else if (sgpa >= 6.0) {
      badgeText = 'Average Performance 📈';
      badgeClass = 'badge-res-amber';
      descText = 'Passed all requirements. Consistent practice will push you into First Class.';
    } else {
      badgeText = 'Below Average 🎯';
      badgeClass = 'badge-res-red';
      descText = 'Focus on core subjects in upcoming semesters to raise your cumulative average.';
    }

    sgpaBadgeEl.className = 'res-rating-pill ' + badgeClass;
    sgpaBadgeEl.textContent = badgeText;
    sgpaDescEl.textContent = descText;
    statusEl.textContent = backlogCount === 0 ? 'All Cleared' : `${backlogCount} Backlog`;

    // Ring animation
    const ringEl = document.getElementById('mace24-result-ring');
    if (ringEl) {
      const pct = Math.min(sgpa / 10, 1);
      const deg = Math.round(pct * 360);
      const color = sgpa >= 8 ? '#10b981' : sgpa >= 7 ? '#3b82f6' : sgpa >= 6 ? '#fbbf24' : '#ef4444';
      ringEl.style.background = `conic-gradient(${color} ${deg}deg, rgba(255,255,255,0.06) ${deg}deg)`;
    }

    // Scroll smoothly to result on mobile
    if (window.innerWidth < 900) {
      document.getElementById('mace24-result-box').scrollIntoView({ behavior: 'smooth' });
    }
  },

  resetResult() {
    document.getElementById('mace24-result-val').textContent = '—';
    document.getElementById('mace24-result-badge').className = 'res-rating-pill';
    document.getElementById('mace24-result-badge').textContent = 'Awaiting Calculation';
    document.getElementById('mace24-result-desc').textContent = 'Select grades for each subject and click Calculate SGPA.';
    document.getElementById('mace24-res-pts').textContent = '—';
    document.getElementById('mace24-res-cr').textContent = '—';
    document.getElementById('mace24-res-status').textContent = '—';

    const ringEl = document.getElementById('mace24-result-ring');
    if (ringEl) {
      ringEl.style.background = 'conic-gradient(var(--primary-red) 0deg, rgba(255,255,255,0.06) 0deg)';
    }
  }
};


// ─────────────────────────────────────────────────────────────────
// 2. KTU 2019 SCHEME GPA & CGPA CALCULATOR
// ─────────────────────────────────────────────────────────────────
const Ktu2019Calc = {
  activeDept: 'CS',
  activeSem: 1,
  mode: 'sgpa', // 'sgpa' or 'cgpa'
  semGrades: {}, // { 1: { 'CS11': grade }, 2: { ... } }
  semSGPA: {},   // { 1: sgpa, 2: sgpa }

  init() {
    this.renderDeptSelect();
    this.renderSemSelector();
    this.loadSubjects();
  },

  renderDeptSelect() {
    const el = document.getElementById('ktu19-dept-select');
    if (!el) return;
    el.innerHTML = KTU_2019_DEPTS.map(d => 
      `<option value="${d.code}" ${d.code === this.activeDept ? 'selected' : ''}>${d.name} (${d.code})</option>`
    ).join('');
    el.addEventListener('change', (e) => {
      this.activeDept = e.target.value;
      this.semGrades = {};
      this.semSGPA = {};
      this.loadSubjects();
    });
  },

  renderSemSelector() {
    const wrap = document.getElementById('ktu19-sem-buttons');
    if (!wrap) return;
    wrap.innerHTML = [1,2,3,4,5,6,7,8].map(s => 
      `<button type="button" class="sem-btn ${s === this.activeSem ? 'active' : ''}" onclick="Ktu2019Calc.setSem(${s})">S${s}</button>`
    ).join('');
  },

  setSem(s) {
    this.activeSem = s;
    document.querySelectorAll('#ktu19-sem-buttons .sem-btn').forEach((b, idx) => {
      b.classList.toggle('active', (idx + 1) === s);
    });
    this.loadSubjects();
  },

  setMode(mode) {
    this.mode = mode;
    document.getElementById('ktu19-mode-sgpa-btn').classList.toggle('active', mode === 'sgpa');
    document.getElementById('ktu19-mode-cgpa-btn').classList.toggle('active', mode === 'cgpa');

    const semPanel = document.getElementById('ktu19-sgpa-view');
    const cgpaPanel = document.getElementById('ktu19-cgpa-view');

    if (mode === 'sgpa') {
      semPanel.style.display = 'block';
      cgpaPanel.style.display = 'none';
      this.loadSubjects();
    } else {
      semPanel.style.display = 'none';
      cgpaPanel.style.display = 'block';
      this.renderCgpaView();
    }
  },

  getSemSubjects(sem) {
    const all = KTU_2019_SUBJECTS[this.activeDept] || [];
    return all.filter(s => s.S_SEM === sem);
  },

  loadSubjects() {
    const container = document.getElementById('ktu19-subjects-list');
    const subjects = this.getSemSubjects(this.activeSem);

    if (!this.semGrades[this.activeSem]) {
      this.semGrades[this.activeSem] = {};
    }

    if (subjects.length === 0) {
      container.innerHTML = `
        <div style="text-align:center;padding:3rem 1rem;color:var(--text-muted);">
          <i class="fa-solid fa-circle-info" style="font-size:2rem;color:var(--primary-red);margin-bottom:10px;display:block;"></i>
          <h4 style="color:white;margin-bottom:6px;">No courses recorded for S${this.activeSem}</h4>
        </div>`;
      return;
    }

    let totalCr = 0;
    let gradedCr = 0;

    const gradeOpts = [
      '<option value="">Select Grade</option>',
      ...KTU_2019_GRADES.map(g => 
        `<option value="${g.grade}">${g.grade} (${g.points.toFixed(1)} pts &mdash; ${g.desc})</option>`
      )
    ].join('');

    let html = '';
    subjects.forEach((s, idx) => {
      totalCr += s.S_CREDIT;
      if (s.S_CREDIT > 0) gradedCr += s.S_CREDIT;
      const isPF = s.S_CREDIT === 0;
      const savedGrade = this.semGrades[this.activeSem][s.S_CODE] || '';

      html += `
        <div class="calc-subject-card">
          <div class="calc-subject-main">
            <div class="calc-sub-code">${s.S_CODE}</div>
            <div class="calc-sub-details">
              <div class="calc-sub-name">${s.S_NAME}</div>
              <div class="calc-sub-badges">
                ${isPF ? '<span class="badge-pf">Audit / Pass (0 Cr)</span>' : `<span class="badge-cr">${s.S_CREDIT} Credit${s.S_CREDIT > 1 ? 's' : ''}</span>`}
              </div>
            </div>
          </div>
          <div class="calc-grade-wrap">
            <select class="calc-grade-select" id="ktu19-grade-${idx}" data-code="${s.S_CODE}" data-credits="${s.S_CREDIT}" onchange="Ktu2019Calc.onGradeChange('${s.S_CODE}', this.value)">
              ${gradeOpts}
            </select>
          </div>
        </div>`;
    });

    container.innerHTML = html;
    document.getElementById('ktu19-total-cr').textContent = gradedCr + (totalCr > gradedCr ? ` (+${totalCr - gradedCr} Audit)` : '');

    // Restore saved grades
    subjects.forEach((s, idx) => {
      const saved = this.semGrades[this.activeSem][s.S_CODE];
      if (saved) {
        const el = document.getElementById(`ktu19-grade-${idx}`);
        if (el) el.value = saved;
      }
    });

    this.resetResult();
  },

  onGradeChange(code, grade) {
    if (!this.semGrades[this.activeSem]) this.semGrades[this.activeSem] = {};
    if (grade) {
      this.semGrades[this.activeSem][code] = grade;
    } else {
      delete this.semGrades[this.activeSem][code];
    }
  },

  quickFill(targetGrade) {
    const subjects = this.getSemSubjects(this.activeSem);
    subjects.forEach((s, idx) => {
      const el = document.getElementById(`ktu19-grade-${idx}`);
      if (el) {
        el.value = targetGrade;
        this.onGradeChange(s.S_CODE, targetGrade);
      }
    });
  },

  resetAll() {
    this.semGrades[this.activeSem] = {};
    const selects = document.querySelectorAll('#ktu19-subjects-list .calc-grade-select');
    selects.forEach(sel => sel.value = '');
    this.resetResult();
  },

  calculateSGPA() {
    const subjects = this.getSemSubjects(this.activeSem);
    if (subjects.length === 0) return;

    const grades = this.semGrades[this.activeSem] || {};
    let totalPoints = 0;
    let gradedCredits = 0;
    let missingCount = 0;
    let backlogCount = 0;

    const gradeMap = {};
    KTU_2019_GRADES.forEach(g => { gradeMap[g.grade] = g.points; });

    subjects.forEach(s => {
      const g = grades[s.S_CODE];
      if (!g) {
        missingCount++;
        return;
      }
      if (g === 'F') backlogCount++;
      const pts = gradeMap[g] || 0;
      if (s.S_CREDIT > 0) {
        gradedCredits += s.S_CREDIT;
        totalPoints += pts * s.S_CREDIT;
      }
    });

    if (missingCount > 0) {
      alert(`Please select grades for all courses (${missingCount} course${missingCount > 1 ? 's' : ''} unselected).`);
      return;
    }

    const sgpa = gradedCredits > 0 ? (totalPoints / gradedCredits) : 0;
    this.semSGPA[this.activeSem] = {
      sgpa,
      totalPoints,
      gradedCredits,
      backlogCount
    };

    this.showResult(sgpa, totalPoints, gradedCredits, backlogCount);
  },

  showResult(sgpa, totalPoints, gradedCredits, backlogCount) {
    const valEl = document.getElementById('ktu19-result-val');
    const badgeEl = document.getElementById('ktu19-result-badge');
    const descEl = document.getElementById('ktu19-result-desc');
    const ptsEl = document.getElementById('ktu19-res-pts');
    const crEl = document.getElementById('ktu19-res-cr');
    const statusEl = document.getElementById('ktu19-res-status');

    valEl.textContent = sgpa.toFixed(2);
    ptsEl.textContent = totalPoints.toFixed(1);
    crEl.textContent = gradedCredits;

    let badgeText = '';
    let badgeClass = '';
    let descText = '';

    if (backlogCount > 0) {
      badgeText = `${backlogCount} Subject Backlog (F)`;
      badgeClass = 'badge-res-red';
      descText = 'KTU 2019 Scheme requires clearing all backlog subjects to award the final degree SGPA credit.';
    } else if (sgpa >= 8.5) {
      badgeText = 'First Class with Distinction ⭐';
      badgeClass = 'badge-res-emerald';
      descText = 'Outstanding score! Meets KTU Honours and Distinction thresholds.';
    } else if (sgpa >= 7.5) {
      badgeText = 'First Class (Above Average) 🌟';
      badgeClass = 'badge-res-blue';
      descText = 'Very good score! Safely eligible for campus placements and core companies.';
    } else if (sgpa >= 6.5) {
      badgeText = 'First Class 👍';
      badgeClass = 'badge-res-cyan';
      descText = 'Well within standard KTU First Class criteria.';
    } else if (sgpa >= 5.5) {
      badgeText = 'Second Class / Pass 📈';
      badgeClass = 'badge-res-amber';
      descText = 'Cleared all subjects. Aim for higher grades in upcoming semesters.';
    } else {
      badgeText = 'Low Pass 🎯';
      badgeClass = 'badge-res-red';
      descText = 'Ensure attendance and internals are maximized for upcoming semesters.';
    }

    badgeEl.className = 'res-rating-pill ' + badgeClass;
    badgeEl.textContent = badgeText;
    descEl.textContent = descText;
    statusEl.textContent = backlogCount === 0 ? 'All Cleared' : `${backlogCount} Backlog`;

    const ringEl = document.getElementById('ktu19-result-ring');
    if (ringEl) {
      const pct = Math.min(sgpa / 10, 1);
      const deg = Math.round(pct * 360);
      const color = sgpa >= 8 ? '#10b981' : sgpa >= 6.5 ? '#3b82f6' : sgpa >= 5.5 ? '#fbbf24' : '#ef4444';
      ringEl.style.background = `conic-gradient(${color} ${deg}deg, rgba(255,255,255,0.06) ${deg}deg)`;
    }

    if (window.innerWidth < 900) {
      document.getElementById('ktu19-result-box').scrollIntoView({ behavior: 'smooth' });
    }
  },

  resetResult() {
    document.getElementById('ktu19-result-val').textContent = '—';
    document.getElementById('ktu19-result-badge').className = 'res-rating-pill';
    document.getElementById('ktu19-result-badge').textContent = 'Awaiting Calculation';
    document.getElementById('ktu19-result-desc').textContent = 'Select grades for each subject and click Calculate SGPA.';
    document.getElementById('ktu19-res-pts').textContent = '—';
    document.getElementById('ktu19-res-cr').textContent = '—';
    document.getElementById('ktu19-res-status').textContent = '—';

    const ringEl = document.getElementById('ktu19-result-ring');
    if (ringEl) {
      ringEl.style.background = 'conic-gradient(var(--primary-red) 0deg, rgba(255,255,255,0.06) 0deg)';
    }
  },

  renderCgpaView() {
    const container = document.getElementById('ktu19-cgpa-rows');
    let html = '';

    for (let s = 1; s <= 8; s++) {
      const semSubs = this.getSemSubjects(s);
      const semGradedCr = semSubs.reduce((acc, sub) => acc + (sub.S_CREDIT > 0 ? sub.S_CREDIT : 0), 0);
      const saved = this.semSGPA[s];
      const sgpaVal = saved ? saved.sgpa.toFixed(2) : '';

      html += `
        <div class="cgpa-sem-row">
          <div class="cgpa-sem-label">Semester ${s}</div>
          <div class="cgpa-sem-credits">${semGradedCr} Credits</div>
          <div class="cgpa-sem-input-wrap">
            <input type="number" step="0.01" min="0" max="10" placeholder="SGPA (e.g. 8.25)" 
              class="input-field cgpa-sem-input" id="ktu19-cgpa-sem-${s}" data-credits="${semGradedCr}" value="${sgpaVal}">
          </div>
        </div>`;
    }

    container.innerHTML = html;
  },

  calculateCGPA() {
    let totalGradeVal = 0;
    let totalCredits = 0;
    let filledCount = 0;

    for (let s = 1; s <= 8; s++) {
      const input = document.getElementById(`ktu19-cgpa-sem-${s}`);
      if (!input) continue;
      const val = parseFloat(input.value);
      const cr = parseFloat(input.dataset.credits) || 0;

      if (!isNaN(val) && val > 0 && cr > 0) {
        totalGradeVal += val * cr;
        totalCredits += cr;
        filledCount++;
      }
    }

    if (filledCount === 0) {
      alert('Please enter your SGPA for at least one semester.');
      return;
    }

    const cgpa = totalCredits > 0 ? (totalGradeVal / totalCredits) : 0;
    const cgpaValEl = document.getElementById('ktu19-cgpa-val');
    const cgpaBadgeEl = document.getElementById('ktu19-cgpa-badge');
    const cgpaDescEl = document.getElementById('ktu19-cgpa-desc');
    const totalCrEl = document.getElementById('ktu19-cgpa-tot-cr');

    cgpaValEl.textContent = cgpa.toFixed(2);
    totalCrEl.textContent = totalCredits;

    let badgeText = '';
    let badgeClass = '';
    let descText = '';

    if (cgpa >= 8.5) {
      badgeText = 'First Class with Distinction ⭐';
      badgeClass = 'badge-res-emerald';
      descText = `Cumulative CGPA over ${filledCount} completed semester${filledCount > 1 ? 's' : ''}. Eligible for KTU Honours!`;
    } else if (cgpa >= 7.5) {
      badgeText = 'First Class 🌟';
      badgeClass = 'badge-res-blue';
      descText = `Solid cumulative standing across ${filledCount} semester${filledCount > 1 ? 's' : ''}.`;
    } else if (cgpa >= 6.5) {
      badgeText = 'First Class 👍';
      badgeClass = 'badge-res-cyan';
      descText = `Consistent academic standing over ${filledCount} semester${filledCount > 1 ? 's' : ''}.`;
    } else {
      badgeText = 'Second Class / Pass 🎯';
      badgeClass = 'badge-res-amber';
      descText = `Keep pushing in remaining semesters to boost your overall CGPA.`;
    }

    cgpaBadgeEl.className = 'res-rating-pill ' + badgeClass;
    cgpaBadgeEl.textContent = badgeText;
    cgpaDescEl.textContent = descText;

    const ringEl = document.getElementById('ktu19-cgpa-ring');
    if (ringEl) {
      const pct = Math.min(cgpa / 10, 1);
      const deg = Math.round(pct * 360);
      const color = cgpa >= 8 ? '#10b981' : cgpa >= 6.5 ? '#3b82f6' : '#fbbf24';
      ringEl.style.background = `conic-gradient(${color} ${deg}deg, rgba(255,255,255,0.06) ${deg}deg)`;
    }
  }
};

// Auto-initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
  if (typeof MACE_2024_DEPTS !== 'undefined') {
    MaceCalc.init();
  }
  if (typeof KTU_2019_DEPTS !== 'undefined') {
    Ktu2019Calc.init();
  }
});
