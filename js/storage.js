/**
 * storage.js - Centralized Data Management for Academic Support Cell
 * Loads database.json, converts columnar arrays → row objects, and exposes
 * the clean data to all pages via window.SFI_STORAGE.
 */

const STORAGE_KEY = "asc_support_cell_data_v2";
let cachedData = null;

/* ─────────────────────────────────────────────────────────────────────────────
   COLUMNAR → ROW CONVERSION
   The database stores some sections as parallel arrays (columnar format).
   This helper zips them into proper array-of-objects.
───────────────────────────────────────────────────────────────────────────── */
function columnarToRows(obj, requiredFields = []) {
    if (!obj || typeof obj !== 'object') return [];

    const fields = Object.keys(obj);
    if (!fields.length) return [];

    // Find array length from the first array field
    let count = 0;
    for (const f of fields) {
        if (Array.isArray(obj[f]) && obj[f].length > count) count = obj[f].length;
    }
    if (!count) return [];

    const rows = [];
    for (let i = 0; i < count; i++) {
        const row = {};
        for (const f of fields) {
            row[f] = Array.isArray(obj[f]) ? (obj[f][i] ?? null) : obj[f];
        }
        // Filter out empty rows (all requiredFields are empty/null)
        if (requiredFields.length) {
            const hasData = requiredFields.some(rf => row[rf] && String(row[rf]).trim() !== '');
            if (!hasData) continue;
        }
        rows.push(row);
    }
    return rows;
}

/* ─────────────────────────────────────────────────────────────────────────────
   SKILL DEVELOPMENT TRANSFORM
   Converts the nested category/course structure into a flat keyed map that
   the skill-development.html page can navigate.
───────────────────────────────────────────────────────────────────────────── */
function transformSkillDevelopment(raw) {
    if (!raw) return {};
    const out = {};

    // Root categories list
    const rootCats = (raw.root && raw.root.categories) ? raw.root.categories : [];

    rootCats.forEach(cat => {
        const id = cat.id;
        const catData = raw[id] || {};
        out[id] = {
            name: cat.name,
            image: cat.image || null,
            trending: cat.trending || false,
            courses: Array.isArray(catData.courses) ? catData.courses : [],
            parent: 'root'
        };
    });

    // Uncategorized courses from cat_data
    if (raw.cat_data && Array.isArray(raw.cat_data.courses) && raw.cat_data.courses.length) {
        out['cat_data'] = {
            name: 'Other Courses',
            image: 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=1000',
            trending: false,
            courses: raw.cat_data.courses,
            parent: 'root'
        };
    }

    return out;
}

/* ─────────────────────────────────────────────────────────────────────────────
   HIGHER EDUCATION TRANSFORM
   Converts he_cat_xxx structure into a clean array of category objects.
───────────────────────────────────────────────────────────────────────────── */
function transformHigherEducation(raw) {
    if (!raw) return [];
    const rootCats = (raw.root && raw.root.categories) ? raw.root.categories : [];
    return rootCats.map(cat => {
        const catData = raw[cat.id] || {};
        return {
            id: cat.id,
            name: cat.name,
            image: cat.image || null,
            ...catData
        };
    });
}

/* ─────────────────────────────────────────────────────────────────────────────
   MAIN DATA LOADER
───────────────────────────────────────────────────────────────────────────── */
async function fetchDatabase() {
    if (cachedData) return cachedData;

    // Try localStorage first
    try {
        const local = localStorage.getItem(STORAGE_KEY);
        if (local) {
            const parsed = JSON.parse(local);
            if (parsed && parsed._version === 2) {
                cachedData = parsed;
                return cachedData;
            }
        }
    } catch (e) { /* ignore */ }

    // Load from local database.json
    try {
        const base = window.location.pathname.includes('/career/') ? '../' : './';
        const response = await fetch(base + 'js/database.json');
        if (!response.ok) throw new Error('Could not load database.json');
        const raw = await response.json();

        // ── Convert scholarships (columnar → rows) ──────────────────────────
        const scholarships = columnarToRows(raw.scholarships, ['id', 'name']);

        // ── Convert internships (columnar → rows) ───────────────────────────
        const internships = columnarToRows(raw.internships, ['id', 'title']);

        // ── Convert entrance_exams (columnar → rows) ────────────────────────
        const entranceExams = columnarToRows(raw.entrance_exams, ['id', 'name']);

        // ── Transform skill_development ─────────────────────────────────────
        const skillDevelopment = transformSkillDevelopment(raw.skill_development);

        // ── Transform higher_education ──────────────────────────────────────
        const higherEducation = transformHigherEducation(raw.higher_education);

        cachedData = {
            _version: 2,
            academics: raw.academics || {},
            announcements: raw.announcements || [],
            scholarships,
            internships,
            entrance_exams: entranceExams,
            skill_development: skillDevelopment,
            higher_education: higherEducation,
            tools: raw.tools || {},
            software: raw.software || {}
        };

        // Save to localStorage for fast reload
        try { localStorage.setItem(STORAGE_KEY, JSON.stringify(cachedData)); } catch (e) { /* quota */ }

        return cachedData;
    } catch (err) {
        console.error('[Storage] Failed to load database.json:', err);
        cachedData = {
            _version: 2,
            academics: {}, announcements: [],
            scholarships: [], internships: [], entrance_exams: [],
            skill_development: {}, higher_education: [],
            tools: {}, software: {}
        };
        return cachedData;
    }
}

function getData() {
    if (cachedData) return cachedData;
    try {
        const local = localStorage.getItem(STORAGE_KEY);
        if (local) {
            const parsed = JSON.parse(local);
            if (parsed && parsed._version === 2) {
                cachedData = parsed;
                return cachedData;
            }
        }
    } catch (e) { /* ignore */ }
    return {
        _version: 2,
        academics: {}, announcements: [],
        scholarships: [], internships: [], entrance_exams: [],
        skill_development: {}, higher_education: [],
        tools: {}, software: {}
    };
}

function saveData(data) {
    cachedData = { ...data, _version: 2 };
    try { localStorage.setItem(STORAGE_KEY, JSON.stringify(cachedData)); } catch (e) {}
    window.dispatchEvent(new Event('storageUpdated'));
    return Promise.resolve(true);
}

function clearCache() {
    cachedData = null;
    localStorage.removeItem(STORAGE_KEY);
}

function getSubjectData(dept, sem, sub) {
    const data = getData();
    try { return data.academics[dept].semesters[sem].subjects[sub]; }
    catch (e) { return null; }
}

window.SFI_STORAGE = {
    fetchLiveR2Data: fetchDatabase,
    fetchDatabase,
    getData,
    saveData,
    clearCache,
    getSubjectData
};
