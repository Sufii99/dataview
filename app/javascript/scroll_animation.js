document.addEventListener("turbo:load", function () {
    const sections = document.querySelectorAll(".section");

    const observer = new IntersectionObserver(
        (entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add("section-visible");
                } else {
                    entry.target.classList.remove("section-visible");
                }
            });
        },
        { threshold: 0.3 } // Se activa cuando el 30% de la sección es visible
    );

    sections.forEach(section => {
        observer.observe(section);
    });
});
