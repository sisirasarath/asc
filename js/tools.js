// MACE Academic Support Cell - Utility Tools Script (SGPA & Attendance)

const courseDatabase = {
    "CSE": [
        { name: "GAMAT101 - Mathematics For Information Science -1", credits: 4 },
        { name: "GXCYT122 - Chemistry + lab", credits: 4 },
        { name: "UCEST105 - Algorithmic Thinking With Python + LAB", credits: 4 },
        { name: "GMEST103 - Engineering Graphics", credits: 3 },
        { name: "GXEST104 - Introduction to Electrical and Electronics Engineering", credits: 4 },
        { name: "UCHUT128 - Life Skills And Professional Communication", credits: 2 },
        { name: "GXESL106 - Basic Electrical and Electronics Workshop", credits: 1 }
    ],
    "CSE-DS": [
        { name: "GAMAT101 - Mathematics For Information Science -1", credits: 4 },
        { name: "GXCYT122 - Chemistry + lab", credits: 4 },
        { name: "UCEST105 - Algorithmic Thinking With Python + LAB", credits: 4 },
        { name: "GMEST103 - Engineering Graphics", credits: 3 },
        { name: "GXEST104 - Introduction to Electrical and Electronics Engineering", credits: 4 },
        { name: "UCHUT128 - Life Skills And Professional Communication", credits: 2 },
        { name: "GXESL106 - Basic Electrical and Electronics Workshop", credits: 1 }
    ],
    "AIML": [
        { name: "GAMAT101 - Mathematics For Information Science -1", credits: 4 },
        { name: "GXCYT122 - Chemistry + lab", credits: 4 },
        { name: "UCEST105 - Algorithmic Thinking With Python + LAB", credits: 4 },
        { name: "GMEST103 - Engineering Graphics", credits: 3 },
        { name: "GXEST104 - Introduction to Electrical and Electronics Engineering", credits: 4 },
        { name: "UCHUT128 - Life Skills And Professional Communication", credits: 2 },
        { name: "GXESL106 - Basic Electrical and Electronics Workshop", credits: 1 }
    ],
    "ECE": [
        { name: "UCEST105 - Algorithmic Thinking With Python + LAB", credits: 4 },
        { name: "GMEST103 - Engineering Graphics", credits: 3 },
        { name: "GXEST104 - Introduction to Electrical and Electronics Engineering", credits: 4 },
        { name: "GYMAT101 - MATHEMATICS FOR ELECTRICAL SCIENCE AND PHYSICAL SCIENCE - 1", credits: 4 },
        { name: "GBPHT121 - PHYSICS FOR ELECTRICAL SCIENCE + Lab", credits: 4 },
        { name: "UCPWT127 - HEALTH AND WELLNESS", credits: 2 },
        { name: "GXESL106 - Basic Electrical and Electronics Workshop", credits: 1 }
    ],
    "EEE": [
        { name: "UCEST105 - Algorithmic Thinking With Python + LAB", credits: 4 },
        { name: "GXEST104 - Introduction to Electrical and Electronics Engineering", credits: 4 },
        { name: "GYMAT101 - MATHEMATICS FOR ELECTRICAL SCIENCE AND PHYSICAL SCIENCE - 1", credits: 4 },
        { name: "GBPHT121 - PHYSICS FOR ELECTRICAL SCIENCE + Lab", credits: 4 },
        { name: "UCHWT127 - Health And Wellness", credits: 2 },
        { name: "GXESL106 - Basic Electrical and Electronics Workshop", credits: 1 },
        { name: "GMEST103 - Engineering Graphics", credits: 3 }
    ],
    "ME": [
        { name: "UCEST105 - Algorithmic Thinking With Python + LAB", credits: 4 },
        { name: "GCEST103 - Engineering Mechanics", credits: 3 },
        { name: "GCEST104 - Introduction to Mechanical and Civil engineering", credits: 4 },
        { name: "GYMAT101 - MATHEMATICS FOR ELECTRICAL SCIENCE AND PHYSICAL SCIENCE - 1", credits: 4 },
        { name: "GCCYT122 - Chemistry + Lab", credits: 4 },
        { name: "UCHUT128 - Life Skills And Professional Communication", credits: 2 },
        { name: "GCESL106 - Basic Mechanical and Civil Workshop", credits: 1 }
    ],
    "CE": [
        { name: "GYMAT101 - MATHEMATICS FOR ELECTRICAL SCIENCE AND PHYSICAL SCIENCE - 1", credits: 4 },
        { name: "GCCYT122 - Chemistry + Lab", credits: 4 },
        { name: "UCEST105 - Algorithmic Thinking With Python + LAB", credits: 4 },
        { name: "GCEST104 - Introduction to Mechanical and Civil engineering", credits: 4 },
        { name: "GCEST103 - Engineering Mechanics", credits: 3 },
        { name: "UCHUT128 - Life Skills And Professional Communication", credits: 2 },
        { name: "GCESL106 - Basic Mechanical and Civil Workshop", credits: 1 }
    ]
};

// KTU 2024 Grade points mapping
const gradePoints = {
    "S": 10.0,
    "A+": 9.0,
    "A": 8.5,
    "B+": 8.0,
    "B": 7.5,
    "C+": 7.0,
    "C": 6.5,
    "D": 6.0,
    "P": 5.5,
    "F": 0.0
};

document.addEventListener("DOMContentLoaded", () => {
    
    // Elements
    const branchSelector = document.getElementById("branch-selector");
    const semesterSelector = document.getElementById("semester-selector");
    const rowsContainer = document.getElementById("sgpa-rows-container");
    const calcSgpaBtn = document.getElementById("calc-sgpa-btn");
    const resetSgpaBtn = document.getElementById("reset-sgpa-btn");
    const gpaDisplay = document.getElementById("gpa-display");
    const gpaSummary = document.getElementById("gpa-summary-text");

    // Initialize Empty State
    function renderEmptyState() {
        if (!rowsContainer) return;
        rowsContainer.innerHTML = `
            <div style="color: var(--text-muted); text-align: center; padding: 40px; border: 1px dashed var(--border-glass); border-radius: 12px;" id="empty-state">
                <i class="fa-solid fa-graduation-cap" style="font-size: 2.2rem; color: rgba(255,255,255,0.1); margin-bottom: 12px; display: block;"></i>
                Please select both Branch and Semester above to load official subjects.
            </div>
        `;
    }

    // Populate dynamic rows based on selection
    function populateSubjects() {
        const branch = branchSelector.value;
        const semester = semesterSelector.value;

        if (!branch || !semester) {
            renderEmptyState();
            return;
        }

        const subjects = courseDatabase[branch] || [];
        if (subjects.length === 0) {
            renderEmptyState();
            return;
        }

        // Render header (desktop labels)
        let html = `
            <div style="display: grid; grid-template-columns: 3fr 1.2fr 1.5fr; gap: 16px; font-weight: 600; color: var(--text-muted); font-size: 0.85rem; border-bottom: 1px solid var(--border-glass); padding-bottom: 8px; margin-bottom: 12px;" class="calc-labels-header">
                <span>Subject Name / Code</span>
                <span style="text-align: center;">Credits</span>
                <span>Grade Obtained</span>
            </div>
        `;

        // Render subject rows
        subjects.forEach((sub, idx) => {
            let gradeOptions = `<option value="">Select Grade</option>`;
            for (const grade in gradePoints) {
                gradeOptions += `<option value="${grade}">${grade} (GP: ${gradePoints[grade].toFixed(1)})</option>`;
            }

            html += `
                <div class="calc-row" style="display: grid; grid-template-columns: 3fr 1.2fr 1.5fr; gap: 16px; margin-bottom: 12px; align-items: center;">
                    <input type="text" class="input-field course-name" value="${sub.name}" readonly style="background: rgba(255,255,255,0.01); color: var(--text-white); font-weight: 500; cursor: default; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;" title="${sub.name}">
                    <input type="number" class="input-field course-credits" value="${sub.credits}" readonly style="background: rgba(255,255,255,0.01); color: var(--text-muted); cursor: default; text-align: center;">
                    <select class="select-field course-grade" style="height: 45px; border-radius: 8px;">
                        ${gradeOptions}
                    </select>
                </div>
            `;
        });

        rowsContainer.innerHTML = html;
    }

    // Event listeners for dropdown selection change
    if (branchSelector && semesterSelector) {
        branchSelector.addEventListener("change", populateSubjects);
        semesterSelector.addEventListener("change", populateSubjects);
    }

    // Reset Calculator
    if (resetSgpaBtn) {
        resetSgpaBtn.addEventListener("click", () => {
            if (branchSelector) branchSelector.value = "";
            if (semesterSelector) semesterSelector.value = "";
            renderEmptyState();
            if (gpaDisplay) gpaDisplay.textContent = "0.00";
            if (gpaSummary) gpaSummary.textContent = "Select course credits and grades, then press Calculate.";
        });
    }

    // Calculate SGPA
    if (calcSgpaBtn) {
        calcSgpaBtn.addEventListener("click", () => {
            const rows = rowsContainer.querySelectorAll(".calc-row");
            if (rows.length === 0) {
                alert("Please select branch and semester first to load subjects.");
                return;
            }

            let totalCredits = 0;
            let totalPoints = 0;
            let isValid = true;

            rows.forEach(row => {
                const creditsVal = row.querySelector(".course-credits").value;
                const gradeVal = row.querySelector(".course-grade").value;

                if (!gradeVal) {
                    isValid = false;
                    return;
                }

                const credits = parseFloat(creditsVal);
                const gradePoint = gradePoints[gradeVal];
                
                totalCredits += credits;
                totalPoints += (gradePoint * credits);
            });

            if (!isValid) {
                alert("Please select grades for all the subjects to calculate SGPA.");
                return;
            }

            const sgpa = totalPoints / totalCredits;
            gpaDisplay.textContent = sgpa.toFixed(2);
            
            // Output summary message
            if (sgpa >= 9.0) {
                gpaSummary.innerHTML = `<span style="color: #10b981; font-weight:600;">Outstanding Performance!</span> SGPA Category: Outstanding. Total Credits: ${totalCredits}.`;
            } else if (sgpa >= 8.0) {
                gpaSummary.innerHTML = `<span style="color: #3b82f6; font-weight:600;">Excellent Job!</span> First Class with Distinction. Total Credits: ${totalCredits}.`;
            } else if (sgpa >= 6.5) {
                gpaSummary.innerHTML = `<span style="color: #3b82f6; font-weight:600;">Good!</span> First Class category. Total Credits: ${totalCredits}.`;
            } else if (sgpa >= 5.5) {
                gpaSummary.innerHTML = `Passed. Total Credits: ${totalCredits}.`;
            } else {
                gpaSummary.innerHTML = `<span style="color: #ef4444; font-weight:600;">Failed:</span> You have a grade of F in one or more subjects. Total Credits: ${totalCredits}.`;
            }
        });
    }

    // Initialize empty state
    renderEmptyState();

    // ==========================================
    // ATTENDANCE TRACKER LOGIC
    // ==========================================
    const conductedInput = document.getElementById("conducted-hours");
    const attendedInput = document.getElementById("attended-hours");
    const attendanceBtn = document.getElementById("calc-attendance-btn");
    const attendanceResult = document.getElementById("attendance-result");
    const percentDisplay = document.getElementById("attendance-percent");
    const feedbackDisplay = document.getElementById("attendance-feedback");

    if (attendanceBtn) {
        attendanceBtn.addEventListener("click", () => {
            const conductedVal = conductedInput.value;
            const attendedVal = attendedInput.value;

            if (!conductedVal || !attendedVal) {
                alert("Please fill in both Conducted and Attended hours.");
                return;
            }

            const conducted = parseInt(conductedVal);
            const attended = parseInt(attendedVal);

            if (attended > conducted) {
                alert("Attended hours cannot exceed conducted hours.");
                return;
            }

            if (conducted === 0) {
                alert("Conducted hours must be greater than zero.");
                return;
            }

            const percentage = (attended / conducted) * 100;
            percentDisplay.textContent = `${percentage.toFixed(1)}%`;
            attendanceResult.style.display = "block";

            if (percentage >= 75) {
                percentDisplay.style.color = "#10b981"; // Safe Green
                const safeSkips = Math.floor((attended - (0.75 * conducted)) / 0.75);
                if (safeSkips > 0) {
                    feedbackDisplay.innerHTML = `You are safely above the 75% boundary! You can skip next <strong style="color: #10b981;">${safeSkips} hours</strong> of lectures consecutively without falling below 75%.`;
                } else {
                    feedbackDisplay.innerHTML = `You are precisely on the margin. <strong style="color: #ef4444;">Do not skip</strong> any classes next to keep attendance safe.`;
                }
            } else {
                percentDisplay.style.color = "#ef4444"; // Alert Red
                const catchUpHours = Math.ceil(((0.75 * conducted) - attended) / 0.25);
                feedbackDisplay.innerHTML = `Alert: Your attendance is below 75%. You must attend the next <strong style="color: #ef4444;">${catchUpHours} hours</strong> of classes consecutively to recover above 75%.`;
            }
        });
    }
});
