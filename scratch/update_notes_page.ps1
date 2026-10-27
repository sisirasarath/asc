# PowerShell script to update notes.html and asc/notes.html with KTU 2024 Scheme engine
$cssToAdd = @'
        /* ── Subject Card Grid (Stage 2: Branch View) ── */
        .subject-card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 1.4rem;
            margin-bottom: 2.5rem;
        }
        .subject-card {
            background: rgba(18, 18, 24, 0.92);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 20px;
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            cursor: pointer;
            backdrop-filter: blur(20px);
        }
        .subject-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-red), #3b82f6);
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .subject-card:hover {
            transform: translateY(-5px);
            border-color: rgba(229, 26, 36, 0.4);
            box-shadow: 0 16px 40px rgba(0, 0, 0, 0.4), 0 0 20px rgba(229, 26, 36, 0.15);
        }
        .subject-card:hover::before {
            opacity: 1;
        }
        .subj-card-header {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 10px;
            margin-bottom: 12px;
        }
        .subj-code-badge {
            background: rgba(229, 26, 36, 0.14);
            border: 1px solid rgba(229, 26, 36, 0.3);
            color: #ff8b90;
            font-family: 'Courier New', monospace;
            font-size: 0.82rem;
            font-weight: 800;
            padding: 4px 10px;
            border-radius: 8px;
            letter-spacing: 0.5px;
        }
        .subj-cat-badge {
            font-size: 0.72rem;
            font-weight: 700;
            padding: 3px 10px;
            border-radius: 50px;
            background: rgba(255, 255, 255, 0.06);
            color: var(--text-muted);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .subj-card-title {
            font-family: var(--font-heading);
            font-size: 1.15rem;
            font-weight: 800;
            color: white;
            margin: 0 0 8px 0;
            line-height: 1.35;
        }
        .subj-card-meta {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 16px;
            font-size: 0.78rem;
            color: var(--text-muted);
        }
        .subj-card-meta span {
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }
        .subj-mat-status {
            margin-top: auto;
            padding-top: 14px;
            border-top: 1px solid rgba(255, 255, 255, 0.06);
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
        }
        .subj-mat-pill {
            font-size: 0.74rem;
            font-weight: 700;
            padding: 4px 12px;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .subj-mat-pill.mat-available {
            background: rgba(16, 185, 129, 0.14);
            border: 1px solid rgba(16, 185, 129, 0.3);
            color: #6ee7b7;
        }
        .subj-mat-pill.mat-pending {
            background: rgba(251, 191, 36, 0.12);
            border: 1px solid rgba(251, 191, 36, 0.25);
            color: #fde68a;
        }
        .subj-card-cta {
            font-size: 0.8rem;
            font-weight: 700;
            color: var(--primary-red);
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: 0.2s;
        }
        .subject-card:hover .subj-card-cta {
            color: #ff6b72;
            transform: translateX(4px);
        }

        /* ── Stage 3: Subject View (Syllabus & Materials) ── */
        .subject-hero-spotlight {
            background: linear-gradient(135deg, rgba(229, 26, 36, 0.12), rgba(18, 18, 24, 0.98));
            border: 1px solid rgba(229, 26, 36, 0.3);
            border-radius: 24px;
            padding: 2.2rem;
            margin-bottom: 2.5rem;
            backdrop-filter: blur(20px);
            box-shadow: 0 16px 45px rgba(0, 0, 0, 0.5);
            position: relative;
            overflow: hidden;
        }
        .subject-hero-spotlight::before {
            content: '';
            position: absolute;
            top: 0; left: 5%; right: 5%;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--primary-red), transparent);
        }
        .subject-meta-chips {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            margin-bottom: 12px;
        }
        .subject-meta-chip {
            font-size: 0.75rem;
            font-weight: 700;
            padding: 4px 12px;
            border-radius: 50px;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.85);
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .subject-meta-chip.chip-code {
            background: rgba(229, 26, 36, 0.18);
            border-color: rgba(229, 26, 36, 0.4);
            color: #ff8b90;
            font-family: 'Courier New', monospace;
            font-weight: 800;
        }
        .subject-hero-title {
            font-size: clamp(1.6rem, 3.2vw, 2.3rem);
            font-weight: 800;
            color: white;
            font-family: var(--font-heading);
            margin: 0 0 10px 0;
            line-height: 1.25;
        }
        .subject-hero-source {
            font-size: 0.86rem;
            color: var(--text-muted);
            margin-bottom: 18px;
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }
        .section-divider-title {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 14px;
            margin-bottom: 1.5rem;
            padding-bottom: 0.9rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            flex-wrap: wrap;
        }
        .section-divider-title h2 {
            font-family: var(--font-heading);
            font-size: 1.3rem;
            font-weight: 800;
            color: white;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        /* ── Modules List ── */
        .modules-container {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-bottom: 3rem;
        }
        .module-item {
            background: rgba(18, 18, 24, 0.88);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 16px;
            padding: 1.4rem 1.6rem;
            transition: 0.25s ease;
            backdrop-filter: blur(20px);
        }
        .module-item:hover {
            border-color: rgba(229, 26, 36, 0.35);
            background: rgba(22, 22, 30, 0.95);
            transform: translateX(4px);
        }
        .module-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 10px;
        }
        .module-num-badge {
            width: 32px;
            height: 32px;
            border-radius: 10px;
            background: rgba(229, 26, 36, 0.14);
            border: 1px solid rgba(229, 26, 36, 0.3);
            color: var(--primary-red);
            font-size: 0.85rem;
            font-weight: 800;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }
        .module-title {
            font-size: 1.05rem;
            font-weight: 700;
            color: white;
            margin: 0;
        }
        .module-topics {
            font-size: 0.88rem;
            color: #a1a1aa;
            line-height: 1.65;
            margin: 0;
            padding-left: 44px;
        }
        @media(max-width: 600px) {
            .module-topics { padding-left: 0; margin-top: 8px; }
        }

        /* ── Resource Card & Verified Source Attribution ── */
        .resource-source-attribution {
            font-size: 0.74rem;
            color: #94a3b8;
            background: rgba(255, 255, 255, 0.04);
            border: 1px solid rgba(255, 255, 255, 0.07);
            padding: 4px 10px;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            margin-top: 6px;
        }
        .pending-notes-card {
            background: linear-gradient(135deg, rgba(251, 191, 36, 0.08), rgba(18, 18, 24, 0.92));
            border: 1px solid rgba(251, 191, 36, 0.25);
            border-radius: 20px;
            padding: 2.2rem;
            text-align: center;
            margin-bottom: 2.5rem;
            backdrop-filter: blur(20px);
        }
        .pending-notes-card h3 {
            font-size: 1.25rem;
            font-weight: 800;
            color: white;
            margin: 12px 0 8px 0;
        }
        .pending-notes-card p {
            font-size: 0.88rem;
            color: var(--text-muted);
            max-width: 580px;
            margin: 0 auto 1.6rem;
            line-height: 1.6;
        }
'@

Write-Host "CSS template prepared!"
