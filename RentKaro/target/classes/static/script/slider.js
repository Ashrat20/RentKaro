const sliders = document.querySelectorAll('.slider-container');

    sliders.forEach(slider => {
        let slideIndex = 0;
        const slides = slider.querySelectorAll('.slider-image');
        const totalSlides = slides.length;

        showSlide(slideIndex);

        function showSlide(index) {
            slides.forEach(slide => {
                slide.style.display = 'none';
            });

            if (index < 0) {
                slideIndex = totalSlides - 1;
            } else if (index >= totalSlides) {
                slideIndex = 0;
            }

            slides[slideIndex].style.display = 'block';
        }

        const prevBtn = slider.querySelector('.prevBtn');
        const nextBtn = slider.querySelector('.nextBtn');

        prevBtn.addEventListener('click', () => {
            slideIndex--;
            showSlide(slideIndex);
        });

        nextBtn.addEventListener('click', () => {
            slideIndex++;
            showSlide(slideIndex);
        });
    });