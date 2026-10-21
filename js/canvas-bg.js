// Signature Engineering Background Canvas (Matching asc.sficet.in)
// Includes Circuit Nodes, Binary Digits, Rotating Gears & Interactive Mouse Physics

document.addEventListener("DOMContentLoaded", () => {
    const canvas = document.getElementById("bg-canvas") || document.getElementById("hero-canvas");
    if (!canvas) return;

    const ctx = canvas.getContext("2d");
    let mouse = { x: null, y: null, radius: 180 };

    window.addEventListener("mousemove", (e) => {
        if (window.innerWidth <= 768) return;
        mouse.x = e.clientX;
        mouse.y = e.clientY;
    });

    window.addEventListener("mouseleave", () => {
        mouse.x = null;
        mouse.y = null;
    });

    function resizeCanvas() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
        initAll();
    }

    // Orb Parallax Effect matching asc.sficet.in
    window.addEventListener("mousemove", (e) => {
        if (window.innerWidth <= 768) return;
        const orbs = document.querySelectorAll(".glow-orb");
        const xMove = (e.clientX / window.innerWidth - 0.5) * 40;
        const yMove = (e.clientY / window.innerHeight - 0.5) * 40;
        orbs.forEach((orb, index) => {
            const speed = (index + 1) * 0.5;
            orb.style.transform = `translate(${xMove * speed}px, ${yMove * speed}px)`;
        });
    });

    /* -- Binary Digit Particles -- */
    let binaries = [];
    class BinaryDigit {
        constructor() { this.reset(); }
        reset() {
            this.x = Math.random() * canvas.width;
            this.y = Math.random() * canvas.height;
            this.char = Math.random() > 0.5 ? "1" : "0";
            this.size = Math.random() * 10 + 9;
            this.alpha = Math.random() * 0.35 + 0.05;
            this.vx = (Math.random() - 0.5) * 0.35;
            this.vy = (Math.random() - 0.5) * 0.35;
            this.color = Math.random() > 0.15 ? `rgba(255,255,255,${this.alpha})` : `rgba(255,75,75,${this.alpha})`;
            this.flickerTimer = Math.random() * 60;
        }
        update() {
            this.x += this.vx;
            this.y += this.vy;
            this.flickerTimer--;
            if (this.flickerTimer <= 0) {
                this.char = Math.random() > 0.5 ? "1" : "0";
                this.flickerTimer = Math.random() * 80 + 40;
            }
            // Mouse repulsion
            if (mouse.x !== null) {
                let dx = this.x - mouse.x;
                let dy = this.y - mouse.y;
                let dist = Math.sqrt(dx * dx + dy * dy);
                if (dist < mouse.radius) {
                    let force = (mouse.radius - dist) / mouse.radius;
                    this.x += dx * force * 0.05;
                    this.y += dy * force * 0.05;
                }
            }
            if (this.x < 0 || this.x > canvas.width) this.vx *= -1;
            if (this.y < 0 || this.y > canvas.height) this.vy *= -1;
        }
        draw() {
            ctx.font = `${this.size}px monospace`;
            ctx.fillStyle = this.color;
            ctx.fillText(this.char, this.x, this.y);
        }
    }

    /* -- Circuit Nodes & Connectors -- */
    let nodes = [];
    class CircuitNode {
        constructor() { this.reset(); }
        reset() {
            this.x = Math.random() * canvas.width;
            this.y = Math.random() * canvas.height;
            this.r = Math.random() * 2 + 1.2;
            this.vx = (Math.random() - 0.5) * 0.45;
            this.vy = (Math.random() - 0.5) * 0.45;
            this.color = Math.random() > 0.25 ? "rgba(255,255,255,0.6)" : "rgba(255,75,75,0.75)";
            this.pulse = Math.random() * Math.PI * 2;
        }
        update() {
            this.pulse += 0.03;
            this.x += this.vx;
            this.y += this.vy;
            if (mouse.x !== null) {
                let dx = this.x - mouse.x;
                let dy = this.y - mouse.y;
                let dist = Math.sqrt(dx * dx + dy * dy);
                if (dist < mouse.radius) {
                    let force = (mouse.radius - dist) / mouse.radius;
                    this.x += dx * force * 0.07;
                    this.y += dy * force * 0.07;
                }
            }
            if (this.x < 0 || this.x > canvas.width) this.vx *= -1;
            if (this.y < 0 || this.y > canvas.height) this.vy *= -1;
        }
        draw() {
            let glowSize = this.r + Math.sin(this.pulse) * 1.2;
            ctx.beginPath();
            ctx.arc(this.x, this.y, Math.max(0.5, glowSize), 0, Math.PI * 2);
            ctx.fillStyle = this.color;
            ctx.fill();
        }
    }

    /* -- Floating Engineering Gears -- */
    let gears = [];
    class Gear {
        constructor() { this.reset(); }
        reset() {
            this.x = Math.random() * canvas.width;
            this.y = Math.random() * canvas.height;
            this.r = Math.random() * 16 + 10;
            this.teeth = Math.floor(Math.random() * 4) + 6;
            this.angle = Math.random() * Math.PI * 2;
            this.rotSpeed = (Math.random() - 0.5) * 0.006;
            this.vx = (Math.random() - 0.5) * 0.25;
            this.vy = (Math.random() - 0.5) * 0.25;
            this.alpha = Math.random() * 0.12 + 0.04;
        }
        update() {
            this.angle += this.rotSpeed;
            this.x += this.vx;
            this.y += this.vy;
            if (mouse.x !== null) {
                let dx = this.x - mouse.x;
                let dy = this.y - mouse.y;
                let dist = Math.sqrt(dx * dx + dy * dy);
                if (dist < mouse.radius * 1.4) {
                    let force = (mouse.radius * 1.4 - dist) / (mouse.radius * 1.4);
                    this.x += dx * force * 0.03;
                    this.y += dy * force * 0.03;
                    this.rotSpeed = force * 0.04;
                }
            }
            if (this.x < -this.r) this.x = canvas.width + this.r;
            if (this.x > canvas.width + this.r) this.x = -this.r;
            if (this.y < -this.r) this.y = canvas.height + this.r;
            if (this.y > canvas.height + this.r) this.y = -this.r;
        }
        draw() {
            ctx.save();
            ctx.translate(this.x, this.y);
            ctx.rotate(this.angle);
            ctx.strokeStyle = `rgba(255,255,255,${this.alpha})`;
            ctx.lineWidth = 1.2;
            ctx.beginPath();
            let toothH = this.r * 0.32;
            for (let i = 0; i < this.teeth; i++) {
                let a1 = (i / this.teeth) * Math.PI * 2;
                let a2 = ((i + 0.4) / this.teeth) * Math.PI * 2;
                let a3 = ((i + 0.6) / this.teeth) * Math.PI * 2;
                let a4 = ((i + 1) / this.teeth) * Math.PI * 2;
                ctx.lineTo(Math.cos(a1) * this.r, Math.sin(a1) * this.r);
                ctx.lineTo(Math.cos(a2) * (this.r + toothH), Math.sin(a2) * (this.r + toothH));
                ctx.lineTo(Math.cos(a3) * (this.r + toothH), Math.sin(a3) * (this.r + toothH));
                ctx.lineTo(Math.cos(a4) * this.r, Math.sin(a4) * this.r);
            }
            ctx.closePath();
            ctx.stroke();

            // Inner axle hole
            ctx.beginPath();
            ctx.arc(0, 0, this.r * 0.35, 0, Math.PI * 2);
            ctx.stroke();
            ctx.restore();
        }
    }

    function initAll() {
        const isMobile = window.innerWidth <= 768;
        const nodeCount = isMobile ? 25 : 55;
        const binaryCount = isMobile ? 15 : 35;
        const gearCount = isMobile ? 3 : 7;

        nodes = [];
        for (let i = 0; i < nodeCount; i++) nodes.push(new CircuitNode());

        binaries = [];
        for (let i = 0; i < binaryCount; i++) binaries.push(new BinaryDigit());

        gears = [];
        for (let i = 0; i < gearCount; i++) gears.push(new Gear());
    }

    function drawConnections() {
        const connectionDistance = 110;
        for (let a = 0; a < nodes.length; a++) {
            for (let b = a + 1; b < nodes.length; b++) {
                let dx = nodes[a].x - nodes[b].x;
                let dy = nodes[a].y - nodes[b].y;
                let dist = Math.sqrt(dx * dx + dy * dy);

                if (dist < connectionDistance) {
                    let alpha = (1 - dist / connectionDistance) * 0.22;
                    ctx.strokeStyle = `rgba(255, 75, 75, ${alpha})`;
                    ctx.lineWidth = 0.8;
                    ctx.beginPath();
                    ctx.moveTo(nodes[a].x, nodes[a].y);
                    ctx.lineTo(nodes[b].x, nodes[b].y);
                    ctx.stroke();
                }
            }

            // Connection to mouse
            if (mouse.x !== null) {
                let dx = nodes[a].x - mouse.x;
                let dy = nodes[a].y - mouse.y;
                let dist = Math.sqrt(dx * dx + dy * dy);
                if (dist < mouse.radius) {
                    let alpha = (1 - dist / mouse.radius) * 0.35;
                    ctx.strokeStyle = `rgba(255, 255, 255, ${alpha})`;
                    ctx.lineWidth = 1;
                    ctx.beginPath();
                    ctx.moveTo(nodes[a].x, nodes[a].y);
                    ctx.lineTo(mouse.x, mouse.y);
                    ctx.stroke();
                }
            }
        }
    }

    function animate() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        // Draw gears in the deeper background
        gears.forEach(g => { g.update(); g.draw(); });

        // Draw binary digits
        binaries.forEach(b => { b.update(); b.draw(); });

        // Draw connections and circuit nodes
        drawConnections();
        nodes.forEach(n => { n.update(); n.draw(); });

        requestAnimationFrame(animate);
    }

    window.addEventListener("resize", resizeCanvas);
    resizeCanvas();
    animate();
});
