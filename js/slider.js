// Hero Image Slider Script
document.addEventListener("DOMContentLoaded", () => {
    const slides = document.querySelectorAll(".slide");
    const dotsContainer = document.querySelector(".slider-dots");
    
    if (slides.length === 0 || !dotsContainer) return;

    let currentSlide = 0;
    let slideInterval;
    const intervalTime = 6000; // 6 seconds per slide

    // Create Dots dynamically
    slides.forEach((_, index) => {
        const dot = document.createElement("div");
        dot.classList.add("dot");
        if (index === 0) dot.classList.add("active");
        dot.addEventListener("click", () => {
            goToSlide(index);
            resetTimer();
        });
        dotsContainer.appendChild(dot);
    });

    const dots = document.querySelectorAll(".dot");

    function goToSlide(n) {
        slides[currentSlide].classList.remove("active");
        dots[currentSlide].classList.remove("active");
        
        currentSlide = (n + slides.length) % slides.length;
        
        slides[currentSlide].classList.add("active");
        dots[currentSlide].classList.add("active");
    }

    function nextSlide() {
        goToSlide(currentSlide + 1);
    }

    function startTimer() {
        slideInterval = setInterval(nextSlide, intervalTime);
    }

    function resetTimer() {
        clearInterval(slideInterval);
        startTimer();
    }

    // Initialize Timer
    startTimer();
});
