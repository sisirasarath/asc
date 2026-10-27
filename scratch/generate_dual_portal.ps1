# PowerShell script to generate complete notes.html and asc/notes.html

$template = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/jpeg" href="images/asc_logo.jpg">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Academic Notes & KTU 2024 Curriculum | MACE Academic Support Cell</title>
    <meta name="description" content="Official KTU B.Tech 2024 Scheme curriculum and dedicated MACE Notes repository organized by semester and branch. MACE Academic Support Cell.">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        .notes-hero{padding:120px 0 60px;text-align:center}
        .notes-hero h1{font-family:var(--font-heading);font-size:clamp(2.2rem,5vw,3.8rem);font-weight:800;margin-bottom:1rem;line-height:1.15}
        .notes-hero p{color:var(--text-muted);font-size:1.1rem;max-width:650px;margin:0 auto 2rem}
        .notes-search-wrap{position:relative;max-width:580px;margin:0 auto 2.5rem}
        .notes-search-wrap i{position:absolute;left:22px;top:50%;transform:translateY(-50%);color:var(--primary-red);font-size:1.1rem;pointer-events:none}
        .notes-search{width:100%;background:rgba(255,255,255,0.04);border:1px solid var(--border-glass);border-radius:50px;padding:16px 22px 16px 56px;color:var(--text-main);font-size:1rem;font-family:var(--font-body);outline:none;transition:var(--transition-smooth);backdrop-filter:blur(15px);box-sizing:border-box}
        .notes-search:focus{border-color:var(--primary-red);box-shadow:0 0 30px var(--primary-red-glow);background:rgba(255,255,255,0.07)}
        .notes-search::placeholder{color:var(--text-muted)}
        .source-tabs{display:flex;gap:12px;justify-content:center;margin-bottom:3rem;flex-wrap:wrap}
        .source-tab{display:inline-flex;align-items:center;gap:10px;padding:12px 26px;border-radius:50px;border:1.5px solid var(--border-glass);background:rgba(255,255,255,0.04);color:var(--text-muted);font-size:.92rem;font-weight:700;cursor:pointer;transition:.3s;font-family:var(--font-body)}
        .source-tab:hover{border-color:var(--primary-red);color:white}
        .source-tab.active{background:rgba(229,26,36,0.14);border-color:var(--primary-red);color:white;box-shadow:0 4px 20px var(--primary-red-glow)}
        .tab-badge{background:rgba(229,26,36,0.25);color:#ff6b6b;font-size:.7rem;padding:2px 8px;border-radius:50px;font-weight:800}
        .source-tab.active .tab-badge{background:rgba(255,255,255,0.2);color:white}
        .notes-panel{display:none}
        .notes-panel.active{display:block}
        .sem-filters{display:flex;gap:10px;flex-wrap:wrap;justify-content:center;margin-bottom:1.4rem}
        .sem-btn{padding:10px 22px;border-radius:50px;border:1.5px solid var(--border-glass);background:rgba(255,255,255,0.04);color:var(--text-muted);font-size:.88rem;font-weight:700;cursor:pointer;transition:all .28s ease;font-family:var(--font-body);display:inline-flex;align-items:center;gap:8px}
        .sem-btn:hover{border-color:var(--primary-red);color:white;transform:translateY(-2px)}
        .sem-btn.active{background:linear-gradient(135deg,var(--primary-red),#b7151f);border-color:var(--primary-red);color:white;box-shadow:0 6px 22px var(--primary-red-glow);transform:translateY(-2px)}
        .sem-btn-badge{display:inline-block;padding:2px 8px;border-radius:50px;font-size:.72rem;font-weight:800;background:rgba(255,255,255,0.14);color:#ff8b90}
        .sem-btn.active .sem-btn-badge{background:rgba(255,255,255,0.25);color:white}
        .dept-filters{display:flex;gap:8px;flex-wrap:wrap;justify-content:center;margin-bottom:2.2rem}
        .dept-btn{padding:8px 18px;border-radius:50px;border:1px solid var(--border-glass);background:rgba(255,255,255,0.03);color:var(--text-muted);font-size:.80rem;font-weight:700;cursor:pointer;transition:.25s;font-family:var(--font-body);display:inline-flex;align-items:center;gap:6px}
        .dept-btn:hover{border-color:rgba(59,130,246,0.5);color:white;transform:translateY(-1px)}
        .dept-btn.active{background:rgba(59,130,246,0.15);border-color:rgba(59,130,246,0.5);color:#60a5fa;box-shadow:0 4px 16px rgba(59,130,246,0.2)}

        /* ── Branch Cards Grid ── */
        .branch-cat-grid{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:1.3rem;width:100%;margin-bottom:2.5rem}
        @media(max-width:1100px){.branch-cat-grid{grid-template-columns:repeat(3,minmax(0,1fr))}}
        @media(max-width:768px){.branch-cat-grid{grid-template-columns:repeat(2,minmax(0,1fr));gap:1rem}}
        @media(max-width:480px){.branch-cat-grid{grid-template-columns:1fr}}
        .branch-dept-card{display:flex;flex-direction:column;background:rgba(18,18,24,0.92);position:relative;min-height:235px;border-radius:20px;overflow:hidden;cursor:pointer;transition:all .35s cubic-bezier(.175,.885,.32,1.275);border:1px solid rgba(255,255,255,0.08);text-decoration:none;box-shadow:0 10px 30px rgba(0,0,0,0.3);user-select:none}
        .branch-dept-card:hover{transform:translateY(-8px) scale(1.02);border-color:var(--primary-red);box-shadow:0 18px 40px var(--primary-red-glow)}
        .branch-dept-card.active{border-color:var(--primary-red);background:linear-gradient(180deg,rgba(229,26,36,0.14) 0%,rgba(18,18,24,0.98) 100%);box-shadow:0 0 0 2px var(--primary-red),0 20px 45px var(--primary-red-glow);transform:translateY(-4px)}
        .branch-dept-img{height:135px;width:100%;background-size:cover;background-position:center;background-repeat:no-repeat;transition:.5s ease;position:relative}
        .branch-dept-card:hover .branch-dept-img{transform:scale(1.06)}
        .branch-dept-info{background:linear-gradient(to top,rgba(12,12,16,0.98) 40%,rgba(12,12,16,0.6) 85%,transparent);flex-grow:1;display:flex;padding:14px 14px 18px;flex-direction:column;justify-content:center;align-items:center;text-align:center;z-index:2;position:relative}
        .branch-title-lg{font-size:1.15rem;margin:0 0 8px 0;text-align:center;color:white;font-weight:800;letter-spacing:-0.2px}
        .branch-tag-pill{display:inline-flex;align-items:center;gap:6px;padding:4px 14px;border-radius:50px;font-size:.72rem;font-weight:800;text-transform:uppercase;letter-spacing:.6px;background:rgba(37,99,235,0.18);border:1px solid rgba(59,130,246,0.45);color:#93c5fd;transition:.25s}
        .branch-dept-card.active .branch-tag-pill{background:var(--primary-red);border-color:var(--primary-red);color:white;box-shadow:0 4px 15px var(--primary-red-glow)}
        .branch-cta-text{font-size:0.78rem;font-weight:700;color:#fca5a5;margin-top:8px;display:inline-flex;align-items:center;gap:6px;transition:0.25s ease}
        .branch-dept-card:hover .branch-cta-text{color:white;transform:translateX(4px)}
        .branch-code-badge{position:absolute;top:12px;right:12px;background:rgba(0,0,0,0.7);border:1px solid rgba(255,255,255,0.18);padding:3px 10px;border-radius:50px;font-size:0.72rem;font-weight:800;color:white;letter-spacing:0.5px;backdrop-filter:blur(8px)}

        /* ── Breadcrumb Bar ── */
        .portal-breadcrumb-bar{display:flex;align-items:center;gap:10px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);border-radius:50px;padding:9px 20px;margin-bottom:1.8rem;font-size:0.86rem;color:var(--text-muted);flex-wrap:wrap;backdrop-filter:blur(16px)}
        .portal-breadcrumb-bar a, .portal-breadcrumb-bar span.crumb-btn{color:var(--text-muted);text-decoration:none;display:inline-flex;align-items:center;gap:6px;cursor:pointer;transition:.2s;font-weight:600}
        .portal-breadcrumb-bar a:hover, .portal-breadcrumb-bar span.crumb-btn:hover{color:white}
        .portal-breadcrumb-bar .crumb-active{color:var(--primary-red);font-weight:700;display:inline-flex;align-items:center;gap:6px}
        .portal-breadcrumb-bar .crumb-sep{opacity:0.35;font-size:0.68rem}

        /* ── Branch Header & Navigation ── */
        .branch-nav-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:1.2rem;flex-wrap:wrap;gap:12px}
        .branch-back-btn{display:inline-flex;align-items:center;gap:8px;background:rgba(229,26,36,0.12);border:1px solid rgba(229,26,36,0.35);color:#ff8b90;font-size:0.85rem;font-weight:700;padding:9px 20px;border-radius:50px;cursor:pointer;transition:all .25s cubic-bezier(0.4,0,0.2,1);font-family:var(--font-body)}
        .branch-back-btn:hover{background:var(--primary-red);color:white;transform:translateX(-3px);box-shadow:0 4px 18px var(--primary-red-glow)}
        .branch-breadcrumb{display:inline-flex;align-items:center;gap:8px;font-size:0.84rem;color:var(--text-muted);background:rgba(255,255,255,0.04);border:1px solid rgba(255,255,255,0.08);padding:6px 16px;border-radius:50px}
        .branch-hero-spotlight{background:linear-gradient(135deg,rgba(229,26,36,0.12),rgba(18,18,24,0.96));border:1px solid rgba(229,26,36,0.3);border-radius:22px;padding:1.8rem 2.2rem;display:flex;align-items:center;justify-content:space-between;gap:1.8rem;margin-bottom:1.6rem;backdrop-filter:blur(20px);flex-wrap:wrap;position:relative;overflow:hidden;box-shadow:0 16px 40px rgba(0,0,0,0.45)}
        .branch-hero-spotlight::before{content:'';position:absolute;top:0;left:10%;right:10%;height:2px;background:linear-gradient(90deg,transparent,var(--primary-red),transparent)}
        .branch-hero-left{display:flex;align-items:center;gap:1.5rem;flex:1;min-width:280px}
        .branch-hero-avatar{width:105px;height:85px;border-radius:16px;background-size:cover;background-position:center;border:1.5px solid rgba(255,255,255,0.15);box-shadow:0 10px 25px rgba(0,0,0,0.4);flex-shrink:0}
        .branch-hero-details{flex:1;min-width:0}
        .branch-hero-tag{display:inline-flex;align-items:center;gap:6px;padding:3px 12px;border-radius:50px;font-size:0.72rem;font-weight:800;background:rgba(229,26,36,0.16);color:#ff8b90;border:1px solid rgba(229,26,36,0.35);margin-bottom:6px;text-transform:uppercase;letter-spacing:0.5px}
        .branch-hero-title{font-size:1.45rem;font-weight:800;color:white;margin:0 0 4px 0;font-family:var(--font-heading);letter-spacing:-0.3px}
        .branch-hero-desc{font-size:0.88rem;color:var(--text-muted);margin:0 0 10px 0;line-height:1.55;max-width:640px}
        .branch-hero-meta{display:flex;align-items:center;gap:8px;flex-wrap:wrap}
        .branch-pill-live{font-size:0.74rem;font-weight:700;padding:3px 10px;border-radius:50px;background:rgba(255,255,255,0.06);color:rgba(255,255,255,0.85);border:1px solid rgba(255,255,255,0.08);display:inline-flex;align-items:center;gap:5px}
        .branch-hero-actions{display:flex;gap:10px;flex-wrap:wrap;flex-shrink:0}
        .branch-quick-strip{display:flex;align-items:center;gap:8px;padding:10px 16px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);border-radius:50px;margin-bottom:2rem;overflow-x:auto;scrollbar-width:none;-webkit-overflow-scrolling:touch}
        .branch-quick-strip::-webkit-scrollbar{display:none}
        .branch-quick-pill{display:inline-flex;align-items:center;gap:6px;padding:6px 14px;border-radius:50px;font-size:0.78rem;font-weight:700;background:rgba(255,255,255,0.04);border:1px solid rgba(255,255,255,0.08);color:var(--text-muted);cursor:pointer;transition:all .22s ease;white-space:nowrap;font-family:var(--font-body)}
        .branch-quick-pill:hover{border-color:rgba(229,26,36,0.4);color:white;transform:translateY(-1px)}
        .branch-quick-pill.active{background:var(--primary-red);border-color:var(--primary-red);color:white;box-shadow:0 4px 15px var(--primary-red-glow);transform:translateY(-1px)}
        .branch-quick-pill .quick-count{font-size:0.72rem;opacity:0.82;font-weight:800}

        /* ── Subject Card Grid ── */
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
        .subject-card:hover::before { opacity: 1; }
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
        .subj-card-meta span { display: inline-flex; align-items: center; gap: 4px; }
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

        /* ── Subject View (Syllabus & Materials) ── */
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

        /* Standard Note Card Styles */
        .sem-hero-card{background:linear-gradient(135deg,rgba(229,26,36,0.1),rgba(18,18,24,0.95));border:1px solid rgba(229,26,36,0.28);border-radius:22px;padding:1.8rem 2.2rem;display:flex;align-items:center;justify-content:space-between;gap:1.8rem;margin-bottom:2.5rem;backdrop-filter:blur(20px);flex-wrap:wrap;box-shadow:0 12px 35px rgba(0,0,0,0.4);position:relative;overflow:hidden}
        .sem-hero-card::before{content:'';position:absolute;top:0;left:10%;right:10%;height:2px;background:linear-gradient(90deg,transparent,var(--primary-red),transparent)}
        .sem-hero-badge{width:65px;height:65px;border-radius:18px;background:var(--primary-red);color:white;font-size:1.5rem;font-weight:900;font-family:var(--font-heading);display:flex;align-items:center;justify-content:center;box-shadow:0 8px 25px var(--primary-red-glow);flex-shrink:0}
        .sem-hero-info{flex:1;min-width:250px}
        .sem-hero-info h3{font-size:1.35rem;font-weight:800;color:white;margin-bottom:4px}
        .sem-hero-info p{font-size:.9rem;color:var(--text-muted);margin:0;line-height:1.55}
        .sem-hero-actions{display:flex;gap:10px;flex-wrap:wrap;flex-shrink:0}
        .sem-badge-tag{background:rgba(229,26,36,0.14);color:var(--primary-red);border:1px solid rgba(229,26,36,0.28);padding:4px 14px;border-radius:50px;font-size:.78rem;font-weight:800;flex-grow:0!important;flex-shrink:0!important}
        .count-pill{background:rgba(255,255,255,0.06);color:var(--text-muted);padding:4px 12px;border-radius:50px;font-size:.78rem;margin-left:auto;flex-shrink:0}
        .notes-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(270px,1fr));gap:1.4rem;margin-bottom:2rem}
        .note-card{background:rgba(18,18,24,0.88);border:1px solid rgba(255,255,255,0.08);border-radius:18px;padding:1.35rem;display:flex;flex-direction:column;gap:1rem;transition:.35s;position:relative;backdrop-filter:blur(20px);overflow:hidden}
        .note-card::before{content:'';position:absolute;top:0;left:0;right:0;height:3px;background:linear-gradient(90deg,var(--primary-red),#ff6b6b);opacity:0;transition:opacity .3s}
        .note-card:hover{transform:translateY(-5px);border-color:rgba(229,26,36,0.4);box-shadow:0 16px 40px rgba(229,26,36,0.12)}
        .note-card:hover::before{opacity:1}
        .note-top{display:flex;align-items:flex-start;gap:12px}
        .note-icon{width:46px;height:46px;border-radius:12px;background:rgba(229,26,36,0.12);border:1px solid rgba(229,26,36,0.25);display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:1.3rem;color:var(--primary-red)}
        .note-info{flex:1;min-width:0}
        .note-subject{font-size:.98rem;font-weight:700;color:var(--text-main);line-height:1.35;margin-bottom:4px}
        .note-code{font-size:.75rem;color:var(--text-muted);font-family:'Courier New',monospace}
        .note-meta{display:flex;gap:6px;flex-wrap:wrap}
        .note-tag{font-size:.71rem;padding:3px 10px;border-radius:50px;font-weight:700}
        .t-mod{background:rgba(99,102,241,0.15);color:#a5b4fc;border:1px solid rgba(99,102,241,0.25)}
        .t-pdf{background:rgba(239,68,68,0.12);color:#fca5a5;border:1px solid rgba(239,68,68,0.22)}
        .t-new{background:rgba(16,185,129,0.12);color:#6ee7b7;border:1px solid rgba(16,185,129,0.22)}
        .t-qp{background:rgba(251,191,36,0.12);color:#fde68a;border:1px solid rgba(251,191,36,0.22)}
        .note-footer{display:flex;gap:8px;margin-top:auto}
        .nbtn{flex:1;padding:9px 12px;border-radius:10px;font-size:.82rem;font-weight:700;text-align:center;text-decoration:none;transition:.25s;display:flex;align-items:center;justify-content:center;gap:6px;font-family:var(--font-body);cursor:pointer;border:none}
        .nbtn-p{background:var(--primary-red);color:white}
        .nbtn-p:hover{background:var(--primary-red-hover);box-shadow:0 6px 20px var(--primary-red-glow);transform:translateY(-1px)}
        .nbtn-g{background:rgba(255,255,255,0.05);border:1px solid rgba(255,255,255,0.1);color:var(--text-muted)}
        .nbtn-g:hover{border-color:var(--primary-red);color:white;background:rgba(229,26,36,0.08)}
        .mace-banner{background:linear-gradient(135deg,rgba(229,26,36,0.08),rgba(229,26,36,0.03));border:1px solid rgba(229,26,36,0.2);border-radius:20px;padding:1.8rem 2rem;display:flex;align-items:center;gap:1.5rem;margin-bottom:2.5rem;flex-wrap:wrap}
        .banner-icon{width:60px;height:60px;border-radius:16px;background:rgba(229,26,36,0.15);border:1px solid rgba(229,26,36,0.3);display:flex;align-items:center;justify-content:center;font-size:1.7rem;flex-shrink:0}
        .banner-text h3{font-size:1.05rem;font-weight:700;color:var(--text-main);margin-bottom:4px}
        .banner-text p{font-size:.87rem;color:var(--text-muted)}
        .banner-btn{margin-left:auto;padding:10px 22px;background:var(--primary-red);color:white;border-radius:50px;font-size:.85rem;font-weight:700;text-decoration:none;display:flex;align-items:center;gap:8px;transition:.25s;white-space:nowrap}
        .banner-btn:hover{background:var(--primary-red-hover);box-shadow:0 6px 20px var(--primary-red-glow)}
        .results-bar{display:flex;justify-content:space-between;align-items:center;margin-bottom:1.5rem;padding:0 4px}
        .results-count{color:var(--text-muted);font-size:.9rem}
        .results-count strong{color:var(--primary-red)}
        .subj-group{margin-bottom:2.5rem}
        .subj-group-header{display:flex;align-items:center;gap:12px;margin-bottom:1.2rem;padding-bottom:.8rem;border-bottom:1px solid rgba(255,255,255,0.07)}
        .subj-group-icon{width:38px;height:38px;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:1rem;flex-shrink:0}
        .subj-group-title{font-family:var(--font-heading);font-size:1.05rem;font-weight:800;color:white}
        .subj-group-sub{font-size:.73rem;color:var(--text-muted);margin-top:2px}
        .subj-badge{background:rgba(229,26,36,0.12);color:var(--primary-red);border:1px solid rgba(229,26,36,0.25);padding:3px 10px;border-radius:50px;font-size:.68rem;font-weight:800;margin-left:auto;flex-shrink:0}
        .mace-loader{text-align:center;padding:4rem 1rem;color:var(--text-muted)}
        .loader-spin{width:48px;height:48px;border:3px solid rgba(229,26,36,0.2);border-top-color:var(--primary-red);border-radius:50%;animation:spin .9s linear infinite;margin:0 auto 1.2rem}
        @keyframes spin{to{transform:rotate(360deg)}}
        .mace-error,.mace-empty{text-align:center;padding:3rem 1rem;border-radius:18px;color:var(--text-muted)}
        .mace-error{background:rgba(229,26,36,0.05);border:1px solid rgba(229,26,36,0.2)}

        /* Modal Styles */
        .pdf-modal-bg{display:none;position:fixed;inset:0;background:rgba(0,0,0,0.88);backdrop-filter:blur(12px);z-index:5000;align-items:center;justify-content:center;padding:20px}
        .pdf-modal-bg.open{display:flex}
        .pdf-modal{position:relative;width:100%;max-width:900px;height:88vh;background:rgba(14,14,20,0.98);border:1px solid rgba(229,26,36,0.25);border-radius:20px;overflow:hidden;display:flex;flex-direction:column;box-shadow:0 40px 100px rgba(0,0,0,0.6)}
        .pdf-modal-header{display:flex;align-items:center;gap:14px;padding:14px 20px;border-bottom:1px solid rgba(255,255,255,0.07);flex-shrink:0}
        .pdf-modal-title{flex:1;font-size:.95rem;font-weight:700;color:white;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
        .pdf-modal-badge{font-size:.65rem;font-weight:800;color:var(--primary-red);background:rgba(229,26,36,0.12);border:1px solid rgba(229,26,36,0.25);padding:3px 10px;border-radius:50px;flex-shrink:0}
        .pdf-modal-actions{display:flex;gap:8px;flex-shrink:0}
        .pdf-action-btn{display:flex;align-items:center;gap:6px;padding:8px 14px;border-radius:8px;font-size:.78rem;font-weight:700;text-decoration:none;cursor:pointer;border:none;transition:.25s}
        .pdf-action-btn.open-btn{background:var(--primary-red);color:white}
        .pdf-action-btn.open-btn:hover{background:var(--primary-red-hover)}
        .pdf-action-btn.close-btn{background:rgba(255,255,255,0.06);border:1px solid rgba(255,255,255,0.1);color:var(--text-muted)}
        .pdf-action-btn.close-btn:hover{background:rgba(229,26,36,0.12);color:white}
        .pdf-modal-frame{flex:1;border:none;background:#111}
        .pdf-modal-loading{position:absolute;inset:60px 0 0;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:12px;color:var(--text-muted);font-size:.9rem;pointer-events:none}
        .pdf-modal-loading.hidden{display:none}

        /* Contribute & External Styles */
        .res-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:1rem;margin-bottom:2.5rem}
        .res-card{background:rgba(18,18,24,0.88);border:1px solid rgba(255,255,255,0.08);border-radius:16px;padding:1.2rem;text-decoration:none;display:flex;align-items:center;gap:12px;transition:.28s;backdrop-filter:blur(20px)}
        .res-card:hover{transform:translateY(-3px);border-color:rgba(229,26,36,0.35);box-shadow:0 10px 24px rgba(229,26,36,0.1)}
        .res-ico{width:42px;height:42px;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:1.2rem;flex-shrink:0}
        .res-txt h4{font-size:.88rem;font-weight:700;color:var(--text-main);margin-bottom:2px}
        .res-txt span{font-size:.72rem;color:var(--text-muted)}
        .branch-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(240px,1fr));gap:1.2rem;margin-bottom:3rem}
        .branch-card{background:rgba(18,18,24,0.88);border:1px solid rgba(255,255,255,0.08);border-radius:18px;padding:1.4rem;display:flex;align-items:center;gap:14px;text-decoration:none;transition:.3s;backdrop-filter:blur(20px)}
        .branch-card:hover{transform:translateY(-4px);border-color:rgba(229,26,36,0.4);box-shadow:0 12px 30px rgba(229,26,36,0.1)}
        .branch-ico{width:52px;height:52px;border-radius:14px;display:flex;align-items:center;justify-content:center;font-size:1.5rem;flex-shrink:0}
        .branch-info h3{font-size:.95rem;font-weight:700;color:var(--text-main);margin-bottom:3px}
        .branch-info span{font-size:.75rem;color:var(--text-muted)}
        .contribute-hero{background:linear-gradient(135deg,rgba(229,26,36,0.07) 0%,rgba(99,102,241,0.05) 100%);border:1px solid rgba(229,26,36,0.18);border-radius:24px;padding:3rem 2.5rem;text-align:center;margin-bottom:3rem;position:relative;overflow:hidden}
        .contribute-hero h2{font-family:var(--font-heading);font-size:clamp(1.6rem,3.5vw,2.4rem);font-weight:800;margin-bottom:.8rem}
        .contribute-hero p{color:var(--text-muted);font-size:1rem;max-width:560px;margin:0 auto 2rem;line-height:1.7}
        .contribute-cta-row{display:flex;gap:12px;justify-content:center;flex-wrap:wrap}
        .cta-primary{display:inline-flex;align-items:center;gap:10px;padding:14px 32px;background:var(--primary-red);color:white;border-radius:50px;font-size:.95rem;font-weight:700;text-decoration:none;transition:.25s;box-shadow:0 6px 24px rgba(229,26,36,0.35)}
        .cta-primary:hover{background:var(--primary-red-hover);box-shadow:0 8px 30px rgba(229,26,36,0.5);transform:translateY(-2px)}
        .cta-secondary{display:inline-flex;align-items:center;gap:10px;padding:14px 32px;background:rgba(255,255,255,0.05);border:1.5px solid rgba(255,255,255,0.15);color:white;border-radius:50px;font-size:.95rem;font-weight:700;text-decoration:none;transition:.25s}
        .cta-secondary:hover{border-color:var(--primary-red);background:rgba(229,26,36,0.08);transform:translateY(-2px)}
        .steps-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:1.4rem;margin-bottom:3rem}
        .step-card{background:rgba(18,18,24,0.9);border:1px solid rgba(255,255,255,0.08);border-radius:18px;padding:1.5rem 1.4rem;transition:.3s;backdrop-filter:blur(20px)}
        .step-card:hover{transform:translateY(-4px);border-color:rgba(229,26,36,0.35);box-shadow:0 12px 30px rgba(229,26,36,0.1)}
        .step-num{width:38px;height:38px;border-radius:10px;background:rgba(229,26,36,0.14);border:1px solid rgba(229,26,36,0.28);display:flex;align-items:center;justify-content:center;font-size:.85rem;font-weight:800;color:var(--primary-red);margin-bottom:1rem}
        .step-card h3{font-size:.98rem;font-weight:700;margin-bottom:.4rem;color:var(--text-main)}
        .step-card p{font-size:.82rem;color:var(--text-muted);line-height:1.6}
        .guidelines-box{background:rgba(99,102,241,0.06);border:1px solid rgba(99,102,241,0.18);border-radius:18px;padding:1.8rem 2rem;margin-bottom:3rem}
        .guidelines-box h3{font-size:1rem;font-weight:700;margin-bottom:1rem;color:var(--text-main);display:flex;align-items:center;gap:8px}
        .guidelines-list{display:grid;grid-template-columns:repeat(auto-fit,minmax(240px,1fr));gap:.6rem}
        .guideline-item{display:flex;align-items:flex-start;gap:10px;font-size:.84rem;color:var(--text-muted);line-height:1.5}
        .guideline-item i{color:#a5b4fc;font-size:.75rem;margin-top:3px;flex-shrink:0}
        .contrib-form-wrapper { max-width: 760px; margin: 0 auto 3rem; }
        .contrib-card { background: rgba(18, 18, 24, 0.92); border: 1px solid rgba(255, 255, 255, 0.08); border-radius: 24px; padding: 2.5rem; backdrop-filter: blur(24px); box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5); text-align: left; }
        .contrib-card-header { margin-bottom: 24px; border-bottom: 1px solid rgba(255, 255, 255, 0.08); padding-bottom: 16px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px; }
        .contrib-card-title { font-size: 1.45rem; font-weight: 800; color: white; font-family: var(--font-heading); margin: 0; }
        .form-group { margin-bottom: 20px; text-align: left; }
        .form-group label { display: block; color: #a1a1aa; font-size: 0.86rem; font-weight: 600; margin-bottom: 8px; }
        .form-group label span.req { color: var(--primary-red); }
        .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
        @media (max-width: 600px) { .form-row { grid-template-columns: 1fr; gap: 0; } .contrib-card { padding: 1.5rem; } }
        .contrib-submit-btn { width: 100%; padding: 15px 24px; background: linear-gradient(135deg, #e51a24 0%, #b80d16 100%); color: white; border: none; border-radius: 12px; font-size: 1rem; font-weight: 700; cursor: pointer; transition: all 0.3s ease; }
        .contrib-submit-btn:hover { transform: translateY(-2px); box-shadow: 0 12px 30px rgba(229, 26, 36, 0.6); }
        .contrib-select, .contrib-input{width:100%;background:rgba(255,255,255,0.04);border:1px solid var(--border-glass);border-radius:12px;padding:13px 16px;color:white;font-size:0.92rem;font-family:var(--font-body);outline:none;box-sizing:border-box}
        .contrib-select option{background:#121218;color:white}
        .drive-folder-card{background:rgba(18,18,24,0.9);border:1px solid rgba(255,255,255,0.08);border-radius:20px;padding:1.6rem 1.8rem;display:flex;align-items:center;gap:1.4rem;margin-bottom:2.5rem;flex-wrap:wrap;transition:.3s}
        .drive-folder-card:hover{border-color:rgba(229,26,36,0.3);box-shadow:0 10px 28px rgba(229,26,36,0.08)}
        .drive-folder-ico{width:56px;height:56px;border-radius:14px;background:linear-gradient(135deg,rgba(251,191,36,0.15),rgba(251,191,36,0.05));border:1px solid rgba(251,191,36,0.25);display:flex;align-items:center;justify-content:center;font-size:1.7rem;flex-shrink:0}
        .drive-folder-info{flex:1;min-width:0}
        .drive-folder-info h3{font-size:1rem;font-weight:700;color:var(--text-main);margin-bottom:4px}
        .drive-folder-info p{font-size:.8rem;color:var(--text-muted)}
        .drive-folder-btn{padding:10px 22px;background:var(--primary-red);color:white;border-radius:50px;font-size:.85rem;font-weight:700;text-decoration:none;display:flex;align-items:center;gap:8px;white-space:nowrap;flex-shrink:0}
    </style>
</head>
<body>
<div class="bg-glow-container">
    <div class="glow-orb orb-1"></div>
    <div class="glow-orb orb-2"></div>
    <div class="glow-orb orb-3"></div>
</div>
<canvas id="bg-canvas"></canvas>

<nav class="navbar scrolled">
    <div class="container">
        <a href="index.html" class="logo">
            <img src="images/asc_logo.jpg" alt="ASC Logo" style="width:48px;height:48px;object-fit:contain;border-radius:10px;flex-shrink:0;">
            <div class="logo-text">
                <h1>ACADEMIC <span class="gradient-text">SUPPORT CELL</span></h1>
                <span>AN INITIATIVE BY SFI MACE UNIT</span>
            </div>
        </a>
        <ul class="nav-links">
            <li><a href="index.html">Home</a></li>
            <li><a href="academics.html">Academics</a></li>
            <li><a href="notes.html" class="active">Notes</a></li>
            <li><a href="career.html">Career</a></li>
            <li><a href="scholarship.html">Scholarship</a></li>
            <li><a href="support.html">Support</a></li>
            <li><a href="tools.html">Tools</a></li>
        </ul>
        <div class="menu-toggle"><i class="fa-solid fa-bars"></i></div>
    </div>
</nav>
<div class="mobile-nav">
    <div class="mobile-nav-close"><i class="fa-solid fa-xmark"></i></div>
    <ul class="mobile-links">
        <li><a href="index.html">Home</a></li>
        <li><a href="academics.html">Academics</a></li>
        <li><a href="notes.html" class="active">Notes</a></li>
        <li><a href="career.html">Career</a></li>
        <li><a href="scholarship.html">Scholarship</a></li>
        <li><a href="support.html">Support</a></li>
        <li><a href="tools.html">Tools</a></li>
    </ul>
</div>
<div class="overlay-blur"></div>

<section class="notes-hero">
    <div class="container">
        <span class="section-badge"><i class="fa-solid fa-book-open"></i> ACADEMIC RESOURCE HUB</span>
        <h1>Academic &amp; KTU <span class="gradient-text">Study Portal</span></h1>
        <p>Access official KTU 2024 Scheme syllabi, curated module notes, question papers, and the dedicated MACE Google Drive repository.</p>
        <div class="notes-search-wrap">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" class="notes-search" id="notesSearch" placeholder="Search course code, subject name, or module topics..." autocomplete="off">
        </div>
        <div class="source-tabs">
            <button class="source-tab active" id="tab-ktu2024" onclick="switchTab('ktu2024')">
                <i class="fa-solid fa-graduation-cap"></i> KTU 2024 Syllabus <span class="tab-badge">OFFICIAL</span>
            </button>
            <button class="source-tab" id="tab-mace" onclick="switchTab('mace')">
                <i class="fa-solid fa-folder-tree"></i> MACE Notes <span class="tab-badge">DRIVE REPO</span>
            </button>
            <button class="source-tab" id="tab-ktu" onclick="switchTab('ktu')">
                <i class="fa-solid fa-globe"></i> KTU Notes <span class="tab-badge">KTUNOTES.IN</span>
            </button>
            <button class="source-tab" id="tab-contribute" onclick="switchTab('contribute')" style="border-color:rgba(99,102,241,0.4);">
                <i class="fa-solid fa-cloud-arrow-up"></i> Contribute <span class="tab-badge" style="background:rgba(99,102,241,0.2);color:#a5b4fc;">SUBMIT</span>
            </button>
        </div>
    </div>
</section>

<main style="padding-bottom:6rem;">
<div class="container">

<!-- ═════════════════════════════════════════════════════════════ -->
<!-- PANEL 1: OFFICIAL KTU 2024 SCHEME CURRICULUM & SYLLABUS -->
<!-- ═════════════════════════════════════════════════════════════ -->
<div class="notes-panel active" id="panel-ktu2024">
    <div class="mace-banner" style="margin-bottom: 2rem;">
        <div class="banner-icon"><i class="fa-solid fa-building-columns" style="color:var(--primary-red);"></i></div>
        <div class="banner-text">
            <h3>Official KTU B.Tech 2024 Scheme Curriculum &amp; Module Syllabi</h3>
            <p>Source of Truth: APJ Abdul Kalam Technological University (<a href="https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech" target="_blank" rel="noopener" style="color:#60a5fa;text-decoration:underline;">ktu.edu.in</a>). Selection Flow: Semester &rarr; Branch &rarr; Subject &rarr; Syllabus Modules &amp; Verified Materials.</p>
        </div>
        <a href="https://ktu.edu.in/academics/branchcurriculum/hardcoded-btech" target="_blank" rel="noopener" class="banner-btn"><i class="fa-solid fa-arrow-up-right-from-square"></i> Official KTU Portal</a>
    </div>

    <!-- KTU Semester Filter Bar (Independent) -->
    <div class="sem-filters" id="ktu-sem-filters" style="margin-bottom:1.5rem;">
        <button class="sem-btn active" onclick="filterKtuSem('s1',this)" data-sem="s1"><i class="fa-solid fa-graduation-cap"></i> S1 <span class="sem-btn-badge" id="ktu-badge-s1">—</span></button>
        <button class="sem-btn" onclick="filterKtuSem('s2',this)" data-sem="s2"><i class="fa-solid fa-graduation-cap"></i> S2 <span class="sem-btn-badge" id="ktu-badge-s2">—</span></button>
        <button class="sem-btn" onclick="filterKtuSem('s3',this)" data-sem="s3"><i class="fa-solid fa-graduation-cap"></i> S3 <span class="sem-btn-badge" id="ktu-badge-s3">—</span></button>
        <button class="sem-btn" onclick="filterKtuSem('s4',this)" data-sem="s4"><i class="fa-solid fa-graduation-cap"></i> S4 <span class="sem-btn-badge" id="ktu-badge-s4">—</span></button>
        <button class="sem-btn" onclick="filterKtuSem('s5',this)" data-sem="s5"><i class="fa-solid fa-graduation-cap"></i> S5 <span class="sem-btn-badge" id="ktu-badge-s5">—</span></button>
        <button class="sem-btn" onclick="filterKtuSem('s6',this)" data-sem="s6"><i class="fa-solid fa-graduation-cap"></i> S6 <span class="sem-btn-badge" id="ktu-badge-s6">—</span></button>
        <button class="sem-btn" onclick="filterKtuSem('s7',this)" data-sem="s7"><i class="fa-solid fa-graduation-cap"></i> S7 <span class="sem-btn-badge" id="ktu-badge-s7">—</span></button>
        <button class="sem-btn" onclick="filterKtuSem('s8',this)" data-sem="s8"><i class="fa-solid fa-graduation-cap"></i> S8 <span class="sem-btn-badge" id="ktu-badge-s8">—</span></button>
    </div>

    <div id="ktu2024-content">
        <div class="mace-loader">
            <div class="loader-spin"></div>
            <p>Loading KTU 2024 Scheme curriculum&hellip;</p>
        </div>
    </div>
</div>

<!-- ═════════════════════════════════════════════════════════════ -->
<!-- PANEL 2: SEPARATE MACE NOTES SECTION -->
<!-- ═════════════════════════════════════════════════════════════ -->
<div class="notes-panel" id="panel-mace">
    <!-- MACE Semester Filter Bar (Independent) -->

    <!-- MACE Semester Filter Bar (Independent) -->
    <div class="sem-filters" id="mace-sem-filters" style="margin-bottom:1.5rem;">
        <button class="sem-btn active" onclick="filterMaceSem('s1',this)" data-sem="s1"><i class="fa-solid fa-graduation-cap"></i> S1 <span class="sem-btn-badge" id="mace-badge-s1">—</span></button>
        <button class="sem-btn" onclick="filterMaceSem('s2',this)" data-sem="s2"><i class="fa-solid fa-graduation-cap"></i> S2 <span class="sem-btn-badge" id="mace-badge-s2">—</span></button>
        <button class="sem-btn" onclick="filterMaceSem('s3',this)" data-sem="s3"><i class="fa-solid fa-graduation-cap"></i> S3 <span class="sem-btn-badge" id="mace-badge-s3">—</span></button>
        <button class="sem-btn" onclick="filterMaceSem('s4',this)" data-sem="s4"><i class="fa-solid fa-graduation-cap"></i> S4 <span class="sem-btn-badge" id="mace-badge-s4">—</span></button>
        <button class="sem-btn" onclick="filterMaceSem('s5',this)" data-sem="s5"><i class="fa-solid fa-graduation-cap"></i> S5 <span class="sem-btn-badge" id="mace-badge-s5">—</span></button>
        <button class="sem-btn" onclick="filterMaceSem('s6',this)" data-sem="s6"><i class="fa-solid fa-graduation-cap"></i> S6 <span class="sem-btn-badge" id="mace-badge-s6">—</span></button>
        <button class="sem-btn" onclick="filterMaceSem('s7',this)" data-sem="s7"><i class="fa-solid fa-graduation-cap"></i> S7 <span class="sem-btn-badge" id="mace-badge-s7">—</span></button>
        <button class="sem-btn" onclick="filterMaceSem('s8',this)" data-sem="s8"><i class="fa-solid fa-graduation-cap"></i> S8 <span class="sem-btn-badge" id="mace-badge-s8">—</span></button>
    </div>

    <!-- MACE Resource Sub-Filters -->
    <div class="dept-filters" id="mace-cat-filters" style="margin-bottom:2rem;display:none;">
        <button class="dept-btn active" onclick="filterMaceCat('all',this)" data-cat="all"><i class="fa-solid fa-shapes"></i> All Notes</button>
        <button class="dept-btn" onclick="filterMaceCat('notes',this)" data-cat="notes"><i class="fa-solid fa-book"></i> Module Notes</button>
        <button class="dept-btn" onclick="filterMaceCat('qp',this)" data-cat="qp"><i class="fa-solid fa-file-lines"></i> Question Papers</button>
        <button class="dept-btn" onclick="filterMaceCat('internal',this)" data-cat="internal"><i class="fa-solid fa-file-pen"></i> Solved Internals</button>
        <button class="dept-btn" onclick="filterMaceCat('lab',this)" data-cat="lab"><i class="fa-solid fa-flask"></i> Lab Manuals</button>
        <button class="dept-btn" onclick="filterMaceCat('uncategorized',this)" data-cat="uncategorized"><i class="fa-solid fa-folder-question"></i> Uncategorized Notes</button>
        <button class="dept-btn" onclick="filterMaceCat('drive',this)" data-cat="drive"><i class="fa-brands fa-google-drive"></i> Open Drive</button>
    </div>

    <div class="results-bar" id="mace-results-bar" style="display:none;">
        <span class="results-count">Showing <strong id="mace-count">&#8212;</strong> MACE Notes</span>
        <span style="font-size:.75rem;color:var(--text-muted);"><i class="fa-solid fa-circle-check" style="color:#10b981;margin-right:4px;"></i> Verified MACE Drive Repository</span>
    </div>

    <div id="mace-content">
        <div class="mace-loader">
            <div class="loader-spin"></div>
            <p>Loading MACE Notes repository&hellip;</p>
        </div>
    </div>
</div>

<!-- ═════════════════════════════════════════════════════════════ -->
<!-- PANEL 3: KTU NOTES EXTERNAL PORTAL (ktunotes.in) -->
<!-- ═════════════════════════════════════════════════════════════ -->
<div class="notes-panel" id="panel-ktu">
    <div class="mace-banner">
        <div class="banner-icon">📚</div>
        <div class="banner-text">
            <h3>KTU Notes – ktunotes.in</h3>
            <p>Free KTU B.Tech notes, previous year question papers, syllabus and timetables for all semesters — 2024, 2019 and 2015 schemes.</p>
        </div>
        <a href="https://www.ktunotes.in/" target="_blank" rel="noopener" class="banner-btn">
            <i class="fa-solid fa-arrow-up-right-from-square"></i> Visit KTUNotes.in
        </a>
    </div>

    <div class="sem-title" style="margin-bottom:1.5rem;"><h2>Quick Access</h2><span class="count-pill">All Resources</span></div>
    <div class="res-grid">
        <a href="https://www.ktunotes.in/study-materials/" target="_blank" class="res-card"><div class="res-ico" style="background:rgba(229,26,36,0.12);border:1px solid rgba(229,26,36,0.25);">📋</div><div class="res-txt"><h4>Notes</h4><span>All Branches</span></div></a>
        <a href="https://www.ktunotes.in/question-papers/" target="_blank" class="res-card"><div class="res-ico" style="background:rgba(59,130,246,0.12);border:1px solid rgba(59,130,246,0.25);">📄</div><div class="res-txt"><h4>Question Papers</h4><span>Previous Year</span></div></a>
        <a href="https://www.ktunotes.in/syllabus/" target="_blank" class="res-card"><div class="res-ico" style="background:rgba(168,85,247,0.12);border:1px solid rgba(168,85,247,0.25);">📚</div><div class="res-txt"><h4>Syllabus</h4><span>2024 / 2019 Scheme</span></div></a>
        <a href="https://www.ktunotes.in/examtimetable/" target="_blank" class="res-card"><div class="res-ico" style="background:rgba(16,185,129,0.12);border:1px solid rgba(16,185,129,0.25);">📅</div><div class="res-txt"><h4>Timetable</h4><span>Exam Schedule</span></div></a>
        <a href="https://www.ktunotes.in/solved-questionpapers/" target="_blank" class="res-card"><div class="res-ico" style="background:rgba(251,191,36,0.12);border:1px solid rgba(251,191,36,0.25);">✅</div><div class="res-txt"><h4>Solved QPs</h4><span>With Answers</span></div></a>
        <a href="https://www.ktunotes.in/ktu-btech-lab-materials/" target="_blank" class="res-card"><div class="res-ico" style="background:rgba(239,68,68,0.12);border:1px solid rgba(239,68,68,0.25);">🔬</div><div class="res-txt"><h4>Lab Materials</h4><span>Lab Records</span></div></a>
        <a href="https://www.ktunotes.in/notifications/" target="_blank" class="res-card"><div class="res-ico" style="background:rgba(99,102,241,0.12);border:1px solid rgba(99,102,241,0.25);">🔔</div><div class="res-txt"><h4>KTU Alerts</h4><span>Live Updates</span></div></a>
        <a href="https://www.ktunotes.in/cgpa-calculator/" target="_blank" class="res-card"><div class="res-ico" style="background:rgba(6,182,212,0.12);border:1px solid rgba(6,182,212,0.25);">🎓</div><div class="res-txt"><h4>CGPA Calculator</h4><span>KTU Tool</span></div></a>
    </div>

    <div class="sem-title" style="margin-bottom:1.5rem;"><h2>Notes by Branch</h2><span class="count-pill">B.Tech</span></div>
    <div class="branch-grid">
        <a href="https://www.ktunotes.in/study-materials/" target="_blank" class="branch-card"><div class="branch-ico" style="background:rgba(99,102,241,0.15);border:1px solid rgba(99,102,241,0.25);">💻</div><div class="branch-info"><h3>Computer Science</h3><span>CSE · AI &amp; DS · CSD</span></div></a>
        <a href="https://www.ktunotes.in/study-materials/" target="_blank" class="branch-card"><div class="branch-ico" style="background:rgba(59,130,246,0.15);border:1px solid rgba(59,130,246,0.25);">⚡</div><div class="branch-info"><h3>Electronics &amp; Comm.</h3><span>ECE · Applied Electronics</span></div></a>
        <a href="https://www.ktunotes.in/study-materials/" target="_blank" class="branch-card"><div class="branch-ico" style="background:rgba(229,26,36,0.15);border:1px solid rgba(229,26,36,0.25);">⚙️</div><div class="branch-info"><h3>Mechanical Engineering</h3><span>ME · Automobile Engg.</span></div></a>
        <a href="https://www.ktunotes.in/study-materials/" target="_blank" class="branch-card"><div class="branch-ico" style="background:rgba(16,185,129,0.15);border:1px solid rgba(16,185,129,0.25);">🏗️</div><div class="branch-info"><h3>Civil Engineering</h3><span>CE · Environmental Engg.</span></div></a>
        <a href="https://www.ktunotes.in/study-materials/" target="_blank" class="branch-card"><div class="branch-ico" style="background:rgba(251,191,36,0.15);border:1px solid rgba(251,191,36,0.25);">🔌</div><div class="branch-info"><h3>Electrical Engineering</h3><span>EEE · EIE</span></div></a>
    </div>
</div>

<!-- ═════════════════════════════════════════════════════════════ -->
<!-- PANEL 4: CONTRIBUTE STUDY MATERIALS -->
<!-- ═════════════════════════════════════════════════════════════ -->
<div class="notes-panel" id="panel-contribute">
    <div class="contribute-hero">
        <span class="section-badge" style="margin-bottom:1rem;"><i class="fa-solid fa-hand-holding-heart"></i> STUDENT EMPOWERMENT</span>
        <h2>Contribute <span class="gradient-text">Study Materials</span></h2>
        <p>Help your fellow peers by uploading study notes, lab records, syllabus updates, or placement interview transcripts.</p>
        <div class="contribute-cta-row">
            <a href="https://drive.google.com/drive/folders/14gJFSIAIDW73bqH2tzm-1TsCfXmVDKSa" target="_blank" rel="noopener" class="cta-primary" style="padding: 15px 32px; font-size: 1rem;">
                <i class="fa-brands fa-google-drive"></i> Open MACE Drive Folder
            </a>
            <a href="https://chat.whatsapp.com/ISKrPHFRsVZK33hp65Fklk?s=cl&p=a&mlu=4&ilr=4&iam=2" target="_blank" class="cta-secondary" style="padding: 15px 32px; font-size: 1rem; border-color: rgba(37,211,102,0.4); color: white;">
                <i class="fa-brands fa-whatsapp" style="color:#25d366; font-size: 1.2rem;"></i> Send via WhatsApp
            </a>
        </div>
    </div>

    <!-- Upload Study Material Interactive Form -->
    <div class="contrib-form-wrapper" id="upload-form-section">
        <div class="contrib-card">
            <div class="contrib-card-header">
                <div>
                    <span class="section-badge" style="margin-bottom:6px;"><i class="fa-solid fa-cloud-arrow-up"></i> DIRECT UPLOAD</span>
                    <h3 class="contrib-card-title">Upload &amp; Categorize Study Material</h3>
                </div>
                <span style="font-size:0.75rem;padding:4px 12px;border-radius:50px;background:rgba(229,26,36,0.12);color:#ff8b90;border:1px solid rgba(229,26,36,0.3);">
                    <i class="fa-solid fa-shield-halved"></i> KTU 2024 / MACE Notes
                </span>
            </div>
            <p style="font-size:0.88rem;color:var(--text-muted);margin-bottom:20px;">
                Select the exact semester, branch, and subject so your notes appear automatically in the correct portal section for students.
            </p>
            <form id="contribNotesForm" onsubmit="handleNoteContribution(event)">
                <div class="form-row">
                    <div class="form-group">
                        <label for="contribSem">Semester <span class="req">*</span></label>
                        <select id="contribSem" class="contrib-select" required onchange="onContribSemChange()">
                            <option value="" disabled selected>Select Semester</option>
                            <option value="s1">S1 — Semester 1</option>
                            <option value="s2">S2 — Semester 2</option>
                            <option value="s3">S3 — Semester 3</option>
                            <option value="s4">S4 — Semester 4</option>
                            <option value="s5">S5 — Semester 5</option>
                            <option value="s6">S6 — Semester 6</option>
                            <option value="s7">S7 — Semester 7</option>
                            <option value="s8">S8 — Semester 8</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="contribBranch">Branch / Department <span class="req">*</span></label>
                        <select id="contribBranch" class="contrib-select" required onchange="onContribBranchChange()">
                            <option value="" disabled selected>Select Branch</option>
                            <option value="CSE">CSE — Computer Science &amp; Engg</option>
                            <option value="DS">DS — Data Science &amp; Analytics</option>
                            <option value="AI">AI — Artificial Intelligence &amp; ML</option>
                            <option value="ECE">ECE — Electronics &amp; Communication</option>
                            <option value="EEE">EEE — Electrical &amp; Electronics</option>
                            <option value="MECH">MECH — Mechanical Engineering</option>
                            <option value="CIVIL">CIVIL — Civil Engineering</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="contribSubject">Subject Name <span class="req">*</span></label>
                        <input type="text" id="contribSubject" class="contrib-input" placeholder="e.g., Data Analytics, Automata (FLA)..." required list="subjectSuggestionsList" autocomplete="off">
                        <datalist id="subjectSuggestionsList"></datalist>
                    </div>
                    <div class="form-group">
                        <label for="contribType">Material Type <span class="req">*</span></label>
                        <select id="contribType" class="contrib-select" required>
                            <option value="notes" selected>Module Study Notes</option>
                            <option value="qp">Previous Year Question Paper (QP)</option>
                            <option value="internal">Solved Internal Series Exam Paper</option>
                            <option value="lab">Lab Manual / Record</option>
                            <option value="elective">Elective Material</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="contribModule">Module Number</label>
                        <select id="contribModule" class="contrib-select">
                            <option value="0">All Modules / Full Subject / QP / Lab</option>
                            <option value="1">Module 1</option>
                            <option value="2">Module 2</option>
                            <option value="3">Module 3</option>
                            <option value="4">Module 4</option>
                            <option value="5">Module 5</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="contribAuthor">Contributor Name / Batch</label>
                        <input type="text" id="contribAuthor" class="contrib-input" placeholder="e.g., Senior Student (2022-26)">
                    </div>
                </div>

                <div class="form-group">
                    <label for="contribTitle">Document Title / Topic <span class="req">*</span></label>
                    <input type="text" id="contribTitle" class="contrib-input" placeholder="e.g., Module 1 - Regression Models, Loss Functions &amp; Notes" required>
                </div>

                <div class="form-group">
                    <label for="contribDriveUrl">Google Drive File Link or PDF URL <span class="req">*</span></label>
                    <input type="url" id="contribDriveUrl" class="contrib-input" placeholder="https://drive.google.com/file/d/14gJFSIAIDW73bqH2tzm-1TsCfXmVDKSa/view" required>
                    <span style="font-size:0.75rem;color:var(--text-muted);margin-top:4px;display:block;">
                        <i class="fa-solid fa-circle-info" style="color:#60a5fa;margin-right:4px;"></i> 
                        Make sure your Google Drive link has sharing set to <strong>"Anyone with the link can view"</strong>.
                    </span>
                </div>

                <button type="submit" class="contrib-submit-btn" id="contribSubmitBtn">
                    <i class="fa-solid fa-cloud-arrow-up"></i> Publish Note to Academic Portal
                </button>
            </form>

            <div id="contribSuccessMsg" style="display:none;margin-top:20px;padding:20px;border-radius:16px;background:rgba(16,185,129,0.12);border:1px solid rgba(16,185,129,0.3);text-align:center;">
                <div style="font-size:2rem;margin-bottom:8px;">🎉</div>
                <h4 style="color:#34d399;margin-bottom:6px;font-size:1.1rem;font-weight:800;">Note Successfully Published!</h4>
                <p id="contribSuccessText" style="color:var(--text-muted);font-size:0.88rem;margin-bottom:16px;"></p>
                <div style="display:flex;gap:10px;justify-content:center;flex-wrap:wrap;">
                    <button id="contribViewNowBtn" class="nbtn nbtn-p" style="padding:10px 24px;border-radius:50px;">
                        <i class="fa-solid fa-eye"></i> View Note in Portal
                    </button>
                    <button onclick="document.getElementById('contribSuccessMsg').style.display='none';document.getElementById('contribNotesForm').reset();" class="nbtn nbtn-g" style="padding:10px 24px;border-radius:50px;">
                        <i class="fa-solid fa-plus"></i> Submit Another Note
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

</div><!-- /container -->
</main>

<footer class="footer">
    <div class="container footer-content">
        <div class="footer-col">
            <div class="footer-logo">
                <img src="images/asc_logo.jpg" alt="ASC Logo" style="width:40px;height:40px;object-fit:contain;border-radius:8px;">
                <div class="logo-text">
                    <h2>ACADEMIC <span class="gradient-text">SUPPORT CELL</span></h2>
                    <span>AN INITIATIVE BY SFI MACE UNIT</span>
                </div>
            </div>
            <p>Empowering every student through peer-to-peer academic collaboration, curated resources, and comprehensive study materials.</p>
            <div class="social-links">
                <a href="https://www.instagram.com/sfi_mace?igsh=bzd2cWZvZ2thZzdh" target="_blank" class="social-icon"><i class="fa-brands fa-instagram"></i></a>
                <a href="https://chat.whatsapp.com/ISKrPHFRsVZK33hp65Fklk?s=cl&p=a&mlu=4&ilr=4&iam=2" target="_blank" class="social-icon"><i class="fa-brands fa-whatsapp"></i></a>
            </div>
        </div>
        <div class="footer-col">
            <h3>Quick Links</h3>
            <ul class="footer-links">
                <li><a href="academics.html">Academic Regulations</a></li>
                <li><a href="notes.html">Study Notes Hub</a></li>
                <li><a href="career.html">Career &amp; Placements</a></li>
                <li><a href="tools.html">CGPA / SGPA Calculators</a></li>
                <li><a href="support.html">Student Welfare &amp; Cells</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h3>Emergency Contacts</h3>
            <div class="contact-item"><i class="fa-solid fa-phone"></i><span>Anti-Ragging Helpline: 1800-180-5522</span></div>
            <div class="contact-item"><i class="fa-solid fa-location-dot"></i><span>Mar Athanasius College of Engineering, Kothamangalam</span></div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; SFI MACE 2026. All rights reserved.</p>
        <a href="#" class="developer-tag">&lt;/&gt; Developed with MACE Pride</a>
    </div>
</footer>

<!-- Scripts -->
<script src="js/main.js"></script>
<script src="js/canvas-bg.js"></script>
<script src="js/ktu-2024-curriculum-data.js"></script>
<script src="js/mace-notes-data.js"></script>

<!-- PDF Viewer Modal -->
<div class="pdf-modal-bg" id="pdfModal" onclick="if(event.target===this)closePdfModal()">
    <div class="pdf-modal">
        <div class="pdf-modal-header">
            <div class="pdf-modal-badge" id="pdfModalBadge">Verified Resource</div>
            <div class="pdf-modal-title" id="pdfModalTitle">Loading&hellip;</div>
            <div class="pdf-modal-actions">
                <a href="#" target="_blank" rel="noopener" class="pdf-action-btn open-btn" id="pdfOpenLink"><i class="fa-solid fa-arrow-up-right-from-square"></i> Open in Drive</a>
                <button class="pdf-action-btn close-btn" onclick="closePdfModal()">&#x2715;</button>
            </div>
        </div>
        <div class="pdf-modal-loading" id="pdfModalLoading"><div class="loader-spin"></div><span>Loading Document&hellip;</span></div>
        <iframe id="pdfModalFrame" class="pdf-modal-frame" src="" onload="document.getElementById('pdfModalLoading').classList.add('hidden')"></iframe>
    </div>
</div>

<script src="js/portal-dual-engine.js"></script>
</body>
</html>
'@

Set-Content -Path "notes.html" -Value $template -Encoding UTF8
Set-Content -Path "asc/notes.html" -Value $template -Encoding UTF8
Write-Host "Updated notes.html and asc/notes.html with clean layout!"
