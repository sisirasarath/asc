// Main UI Interactions
document.addEventListener("DOMContentLoaded", () => {
    // 1. Page Loader
    const loader = document.getElementById("loader");
    if (loader) {
        const dismissLoader = () => {
            loader.classList.add("fade-out");
            setTimeout(() => {
                loader.style.display = "none";
            }, 600);
        };
        if (document.readyState === "complete") {
            setTimeout(dismissLoader, 350);
        } else {
            window.addEventListener("load", () => setTimeout(dismissLoader, 350));
            setTimeout(dismissLoader, 2200); // safety fallback
        }
    }

    // 2. Navbar Scroll Effect
    const navbar = document.querySelector(".navbar");
    window.addEventListener("scroll", () => {
        if (window.scrollY > 50) {
            navbar.classList.add("scrolled");
        } else {
            navbar.classList.remove("scrolled");
        }
    });

    // 3. Mobile Navigation Menu
    const menuToggle = document.querySelector(".menu-toggle");
    const mobileNav = document.querySelector(".mobile-nav");
    const mobileClose = document.querySelector(".mobile-nav-close");
    const overlay = document.querySelector(".overlay-blur");
    const mobileLinks = document.querySelectorAll(".mobile-links a");

    function openMobileMenu() {
        mobileNav.classList.add("open");
        overlay.classList.add("active");
        document.body.style.overflow = "hidden"; // Disable scroll when menu is open
    }

    function closeMobileMenu() {
        mobileNav.classList.remove("open");
        overlay.classList.remove("active");
        document.body.style.overflow = "";
    }

    if (menuToggle && mobileNav && mobileClose && overlay) {
        menuToggle.addEventListener("click", openMobileMenu);
        mobileClose.addEventListener("click", closeMobileMenu);
        overlay.addEventListener("click", closeMobileMenu);
        mobileLinks.forEach(link => {
            link.addEventListener("click", closeMobileMenu);
        });
    }

    // 4. Scroll Reveal Animations (using IntersectionObserver)
    const revealElements = document.querySelectorAll(".scroll-reveal");
    if (revealElements.length > 0) {
        const observerOptions = {
            threshold: 0.1,
            rootMargin: "0px 0px -50px 0px"
        };

        const revealObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add("visible");
                    observer.unobserve(entry.target); // Trigger once
                }
            });
        }, observerOptions);

        revealElements.forEach(element => {
            revealObserver.observe(element);
        });
    }

    // 5. Lightweight Pure JS Card Tilt Effect (Glassmorphism highlight follow-up)
    const tiltElements = document.querySelectorAll(".feature-card, .mission-card, .subject-card, .calc-panel, .result-panel, .contact-card");
    tiltElements.forEach(el => {
        el.addEventListener("mousemove", (e) => {
            const rect = el.getBoundingClientRect();
            const x = e.clientX - rect.left; // x coordinate inside element
            const y = e.clientY - rect.top;  // y coordinate inside element
            
            const centerX = rect.width / 2;
            const centerY = rect.height / 2;
            
            // Calculate tilt angle (max 8 degrees)
            const tiltX = ((centerY - y) / centerY) * 6;
            const tiltY = ((x - centerX) / centerX) * 6;

            el.style.transform = `perspective(1000px) rotateX(${tiltX}deg) rotateY(${tiltY}deg) translateY(-4px)`;
            
            // Radial glow background positioning if it exists
            const glow = el.querySelector(".card-glow");
            if (glow) {
                glow.style.background = `radial-gradient(circle 120px at ${x}px ${y}px, rgba(229, 26, 36, 0.15), transparent 80%)`;
            }
        });

        el.addEventListener("mouseleave", () => {
            el.style.transform = "";
            const glow = el.querySelector(".card-glow");
            if (glow) {
                glow.style.background = "";
            }
        });
    });

    // 6. Sticky Floating Social Bar Injection (Instagram & WhatsApp)
    const socialBar = document.createElement("div");
    socialBar.className = "social-sticky-bar";
    socialBar.innerHTML = `
        <a href="https://chat.whatsapp.com/DkC0nwnSjHbFzlPNrJ71BW" target="_blank" class="sticky-icon whatsapp-sticky">
            <i class="fa-brands fa-whatsapp"></i>
            <span class="tooltip-text">Join MACE WhatsApp Group</span>
        </a>
        <a href="https://www.instagram.com/sfi_mace?igsh=bzd2cWZvZ2thZzdh" target="_blank" class="sticky-icon instagram-sticky">
            <i class="fa-brands fa-instagram"></i>
            <span class="tooltip-text">Follow SFI MACE Instagram</span>
        </a>
    `;
    document.body.appendChild(socialBar);
});
