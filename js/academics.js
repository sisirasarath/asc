/**
 * academics.js — MACE UG/PG Scheme & Syllabus
 * Data sourced from: mace.ac.in/academics/academics-scheme-syllabus-ug/
 * Covers 2024 Autonomous Scheme & 2019 KTU Scheme for all B.Tech branches
 */

/* ─── 2024 Autonomous Scheme ─────────────────────────────────────────────── */
const scheme2024 = [
    {
        name: "Computer Science and Engineering",
        code: "CSE",
        icon: "fa-laptop-code",
        intake: 60,
        tag: "B.Tech 2024",
        url: "https://mace.ac.in/wp-content/uploads/2026/07/BTech_2024-Scheme-Syllabus_CSE.pdf",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2024"
    },
    {
        name: "Computer Science & Engineering (Data Science)",
        code: "CSE-DS",
        icon: "fa-database",
        intake: 60,
        tag: "B.Tech 2024",
        url: "https://mace.ac.in/wp-content/uploads/2026/07/BTech_2024-Scheme-Syllabus_DS.pdf",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2024"
    },
    {
        name: "Artificial Intelligence and Machine Learning",
        code: "AIML",
        icon: "fa-brain",
        intake: 60,
        tag: "B.Tech 2024",
        url: "https://mace.ac.in/wp-content/uploads/2026/07/BTech_2024-Scheme-Syllabus_AIML.pdf",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2024"
    },
    {
        name: "Electronics & Communication Engineering",
        code: "ECE",
        icon: "fa-microchip",
        intake: 60,
        tag: "B.Tech 2024",
        url: "https://mace.ac.in/wp-content/uploads/2026/07/BTech_2024-Scheme-Syllabus_EC.pdf",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2024"
    },
    {
        name: "Electrical & Electronics Engineering",
        code: "EEE",
        icon: "fa-bolt",
        intake: 60,
        tag: "B.Tech 2024",
        url: "https://mace.ac.in/wp-content/uploads/2026/07/BTech_2024-Scheme-Syllabus_EE.pdf",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2024"
    },
    {
        name: "Mechanical Engineering",
        code: "ME",
        icon: "fa-gears",
        intake: 60,
        tag: "B.Tech 2024",
        url: "https://mace.ac.in/wp-content/uploads/2026/07/BTech_2024-Scheme-Syllabus_ME.pdf",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2024"
    },
    {
        name: "Civil Engineering",
        code: "CE",
        icon: "fa-trowel-bricks",
        intake: 60,
        tag: "B.Tech 2024",
        url: "https://mace.ac.in/wp-content/uploads/2026/07/BTech_2024-Scheme-Syllabus_CE.pdf",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2024"
    }
];

/* ─── 2019 KTU Scheme ─────────────────────────────────────────────────────── */
const scheme2019 = [
    {
        name: "Computer Science and Engineering",
        code: "CSE",
        icon: "fa-laptop-code",
        intake: 60,
        tag: "B.Tech 2019 (KTU)",
        url: "https://ktu.edu.in/eu/res/aca/btech.htm",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2019"
    },
    {
        name: "Electronics & Communication Engineering",
        code: "ECE",
        icon: "fa-microchip",
        intake: 60,
        tag: "B.Tech 2019 (KTU)",
        url: "https://ktu.edu.in/eu/res/aca/btech.htm",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2019"
    },
    {
        name: "Electrical & Electronics Engineering",
        code: "EEE",
        icon: "fa-bolt",
        intake: 60,
        tag: "B.Tech 2019 (KTU)",
        url: "https://ktu.edu.in/eu/res/aca/btech.htm",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2019"
    },
    {
        name: "Mechanical Engineering",
        code: "ME",
        icon: "fa-gears",
        intake: 60,
        tag: "B.Tech 2019 (KTU)",
        url: "https://ktu.edu.in/eu/res/aca/btech.htm",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2019"
    },
    {
        name: "Civil Engineering",
        code: "CE",
        icon: "fa-trowel-bricks",
        intake: 60,
        tag: "B.Tech 2019 (KTU)",
        url: "https://ktu.edu.in/eu/res/aca/btech.htm",
        officialPage: "https://mace.ac.in/academics/academics-scheme-syllabus-ug/",
        scheme: "2019"
    }
];

/* ─── PG Programmes ───────────────────────────────────────────────────────── */
const pgPrograms = [
    {
        name: "Master of Computer Applications",
        code: "MCA",
        icon: "fa-code",
        intake: 30,
        tag: "PG Programme",
        url: "https://mace.ac.in/academics/academics-scheme-syllabus-pg/",
        officialPage: "https://mace.ac.in/academics/academic-pg-programme-mca/",
        scheme: "PG"
    },
    {
        name: "M.Tech – Computer Science & Engineering",
        code: "M.Tech CSE",
        icon: "fa-server",
        intake: 18,
        tag: "PG Programme",
        url: "https://mace.ac.in/academics/academics-scheme-syllabus-pg/",
        officialPage: "https://mace.ac.in/academics/academic-pg-programme-m-tech/",
        scheme: "PG"
    },
    {
        name: "M.Tech – Electronics & Communication",
        code: "M.Tech ECE",
        icon: "fa-satellite-dish",
        intake: 18,
        tag: "PG Programme",
        url: "https://mace.ac.in/academics/academics-scheme-syllabus-pg/",
        officialPage: "https://mace.ac.in/academics/academic-pg-programme-m-tech/",
        scheme: "PG"
    },
    {
        name: "M.Tech – Electrical & Electronics",
        code: "M.Tech EEE",
        icon: "fa-plug-circle-bolt",
        intake: 18,
        tag: "PG Programme",
        url: "https://mace.ac.in/academics/academics-scheme-syllabus-pg/",
        officialPage: "https://mace.ac.in/academics/academic-pg-programme-m-tech/",
        scheme: "PG"
    },
    {
        name: "M.Tech – Mechanical Engineering",
        code: "M.Tech ME",
        icon: "fa-wrench",
        intake: 18,
        tag: "PG Programme",
        url: "https://mace.ac.in/academics/academics-scheme-syllabus-pg/",
        officialPage: "https://mace.ac.in/academics/academic-pg-programme-m-tech/",
        scheme: "PG"
    },
    {
        name: "M.Tech – Civil Engineering",
        code: "M.Tech CE",
        icon: "fa-building-columns",
        intake: 18,
        tag: "PG Programme",
        url: "https://mace.ac.in/academics/academics-scheme-syllabus-pg/",
        officialPage: "https://mace.ac.in/academics/academic-pg-programme-m-tech/",
        scheme: "PG"
    }
];

/* ─── Related Academic Documents ─────────────────────────────────────────── */
const relatedDocs = [
    {
        icon: "fa-calendar-alt",
        title: "Academic Calendar 2025–26",
        desc: "Semester schedule, exam dates, holidays and key academic events",
        url: "https://mace.ac.in/academics/academic-calendar/"
    },
    {
        icon: "fa-file-pdf",
        title: "MACE Brochure 2025",
        desc: "College achievements, departments, facilities and intake details",
        url: "https://mace.ac.in/wp-content/uploads/2025/08/MACE-2025.pdf"
    },
    {
        icon: "fa-graduation-cap",
        title: "Programme Outcomes – UG",
        desc: "B.Tech Programme Outcomes (POs) and Course Outcomes (COs) for all branches",
        url: "https://mace.ac.in/academics/academics-programme-outcomes-ug/"
    },
    {
        icon: "fa-graduation-cap",
        title: "Programme Outcomes – PG",
        desc: "M.Tech & MCA Programme Outcomes (POs) for all PG branches",
        url: "https://mace.ac.in/academics/academics-programme-outcomes-ph-d/"
    },
    {
        icon: "fa-book-open",
        title: "Board of Studies",
        desc: "Members and minutes of MACE Board of Studies committee",
        url: "https://mace.ac.in/academics/academics-board-of-studies/"
    },
    {
        icon: "fa-flask",
        title: "Research Policy",
        desc: "MACE research and publication policy document",
        url: "https://mace.ac.in/academics/academics-research-policy/"
    },
    {
        icon: "fa-handshake",
        title: "MoUs & Collaborations",
        desc: "Industry and institution MoUs signed by MACE",
        url: "https://mace.ac.in/academics/academics-mous/"
    },
    {
        icon: "fa-award",
        title: "Academic Awards",
        desc: "Toppers, gold medals and academic excellence awards",
        url: "https://mace.ac.in/academics/academics-awards/"
    }
];

/* ─── Render Functions ────────────────────────────────────────────────────── */
let currentScheme = "2024";

function renderSyllabusGrid(scheme) {
    const gridContainer = document.getElementById("syllabus-grid");
    if (!gridContainer) return;

    let data;
    if (scheme === "2024") data = scheme2024;
    else if (scheme === "2019") data = scheme2019;
    else data = pgPrograms;

    gridContainer.style.display = "grid";
    gridContainer.innerHTML = data.map(item => `
        <div class="resource-box glass-panel scroll-reveal visible">
            <i class="fa-solid ${item.icon}" style="font-size:2.2rem;color:var(--primary-red);margin-bottom:16px;"></i>
            <h4 style="font-size:1.1rem;color:var(--text-white);margin-bottom:6px;">${item.name}</h4>
            <p style="color:var(--text-muted);font-size:0.8rem;margin-bottom:6px;">
                <strong style="color:white;">${item.code}</strong> &nbsp;|&nbsp; ${item.tag} &nbsp;|&nbsp; Intake: ${item.intake}
            </p>
            <p style="color:var(--text-muted);font-size:0.77rem;margin-bottom:18px;">
                <i class="fa-solid fa-circle-info" style="color:var(--primary-red);margin-right:4px;"></i>
                ${scheme === "2019" ? "KTU Affiliated — Syllabus on KTU Portal" : scheme === "PG" ? "View/download from official MACE page" : "MACE Autonomous Curriculum"}
            </p>
            <div style="display:flex;gap:10px;justify-content:center;width:100%;">
                <button onclick="window.previewFile('${item.name.replace(/'/g,"&#39;")} — ${item.tag}', '${item.url}')"
                    class="btn btn-secondary"
                    style="flex:1;font-size:0.8rem;padding:8px 12px;border-radius:8px;">
                    <i class="fa-solid fa-eye" style="margin-right:4px;"></i>View Online
                </button>
                <a href="${item.url}" target="_blank" rel="noopener"
                    class="btn btn-primary"
                    style="flex:1;font-size:0.8rem;padding:8px 12px;border-radius:8px;text-decoration:none;text-align:center;display:inline-flex;align-items:center;justify-content:center;gap:4px;">
                    <i class="fa-solid fa-download"></i>Download
                </a>
            </div>
        </div>
    `).join("");
}

function renderRelatedDocs() {
    const container = document.getElementById("related-docs-grid");
    if (!container) return;
    container.innerHTML = relatedDocs.map(d => `
        <a href="${d.url}" target="_blank" rel="noopener"
            style="display:flex;align-items:flex-start;gap:14px;background:rgba(255,255,255,0.03);border:1px solid var(--border-glass);border-radius:16px;padding:18px;text-decoration:none;transition:0.3s;"
            onmouseover="this.style.borderColor='var(--primary-red)';this.style.background='rgba(229,26,36,0.04)'"
            onmouseout="this.style.borderColor='var(--border-glass)';this.style.background='rgba(255,255,255,0.03)'">
            <i class="fa-solid ${d.icon}" style="color:var(--primary-red);font-size:1.4rem;flex-shrink:0;margin-top:2px;"></i>
            <div>
                <div style="color:white;font-weight:700;font-size:0.92rem;margin-bottom:4px;">${d.title}</div>
                <div style="color:var(--text-muted);font-size:0.78rem;line-height:1.5;">${d.desc}</div>
            </div>
        </a>
    `).join("");
}

function switchScheme(scheme) {
    currentScheme = scheme;
    // Update tab styles
    ["tab-2024", "tab-2019", "tab-pg"].forEach(id => {
        const el = document.getElementById(id);
        if (el) {
            el.style.background = "rgba(255,255,255,0.04)";
            el.style.borderColor = "var(--border-glass)";
            el.style.color = "var(--text-muted)";
        }
    });
    const activeId = scheme === "2024" ? "tab-2024" : scheme === "2019" ? "tab-2019" : "tab-pg";
    const active = document.getElementById(activeId);
    if (active) {
        active.style.background = "rgba(229,26,36,0.12)";
        active.style.borderColor = "var(--primary-red)";
        active.style.color = "white";
    }
    renderSyllabusGrid(scheme);
}

/* ─── Inline PDF Viewer ───────────────────────────────────────────────────── */
window.previewFile = (name, url) => {
    const gridContainer = document.getElementById("syllabus-grid");
    const breadcrumb = document.getElementById("explorer-breadcrumb");
    if (!gridContainer || !breadcrumb) return;

    gridContainer.style.display = "none";

    breadcrumb.innerHTML = `
        <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:12px;width:100%;margin-bottom:20px;border-bottom:1px solid var(--border-glass);padding-bottom:15px;">
            <div style="display:flex;align-items:center;gap:10px;">
                <button onclick="window.closeInlinePreview()" class="btn btn-secondary" style="padding:6px 12px;font-size:0.85rem;border-radius:6px;">
                    <i class="fa-solid fa-arrow-left"></i> Back to Syllabus Grid
                </button>
                <span style="color:white;font-weight:700;font-size:1.05rem;">${name}</span>
            </div>
            <div style="display:flex;gap:10px;">
                <button onclick="window.toggleInlineFullscreen()" class="btn btn-secondary" style="padding:6px 12px;font-size:0.85rem;border-radius:6px;">
                    <i class="fa-solid fa-expand"></i> Full Screen
                </button>
                <a href="${url}" target="_blank" rel="noopener" class="btn btn-primary" style="padding:6px 12px;font-size:0.85rem;border-radius:6px;text-decoration:none;display:inline-flex;align-items:center;gap:6px;">
                    <i class="fa-solid fa-download"></i> Download PDF
                </a>
            </div>
        </div>
    `;

    let viewer = document.getElementById("inline-viewer");
    if (!viewer) {
        viewer = document.createElement("div");
        viewer.id = "inline-viewer";
        viewer.style.cssText = "width:100%;margin-top:10px;";
        gridContainer.parentNode.appendChild(viewer);
    }
    viewer.style.display = "block";

    const isMobile = /Mobi|Android|iPhone|iPad/i.test(navigator.userAgent);
    if (isMobile) {
        viewer.innerHTML = `<iframe id="inline-viewer-frame" src="https://docs.google.com/viewer?url=${encodeURIComponent(url)}&embedded=true" width="100%" height="550px" style="border:none;border-radius:12px;background:rgba(0,0,0,0.2);" allowfullscreen></iframe>`;
    } else {
        viewer.innerHTML = `<iframe id="inline-viewer-frame" src="${url}#toolbar=0" width="100%" height="650px" style="border:none;border-radius:12px;background:rgba(0,0,0,0.2);" allowfullscreen></iframe>`;
    }
    window.scrollTo({ top: 250, behavior: "smooth" });
};

window.closeInlinePreview = () => {
    const viewer = document.getElementById("inline-viewer");
    const gridContainer = document.getElementById("syllabus-grid");
    const breadcrumb = document.getElementById("explorer-breadcrumb");
    if (viewer) viewer.style.display = "none";
    if (gridContainer) gridContainer.style.display = "grid";
    if (breadcrumb) breadcrumb.innerHTML = "";
    window.scrollTo({ top: 150, behavior: "smooth" });
};

window.toggleInlineFullscreen = () => {
    const frame = document.getElementById("inline-viewer-frame");
    if (!frame) return;
    if (frame.requestFullscreen) frame.requestFullscreen();
    else if (frame.webkitRequestFullscreen) frame.webkitRequestFullscreen();
    else if (frame.msRequestFullscreen) frame.msRequestFullscreen();
};

/* ─── Init ────────────────────────────────────────────────────────────────── */
document.addEventListener("DOMContentLoaded", () => {
    renderSyllabusGrid("2024");
    renderRelatedDocs();
});
