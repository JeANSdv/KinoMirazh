let offset = 0;
const sliderLine = document.querySelector('.slider-line');

document.querySelector('.slider-button-right').addEventListener('click', function(){
    offset += 800;
    if (offset > 1600) {
        offset = -1600;
    }
    sliderLine.style.left = -offset + 'px';
});

document.querySelector('.slider-button-left').addEventListener('click', function(){
    offset -= 800;
    if (offset < -1600) {
        offset = 1600;
    }
    sliderLine.style.left = -offset + 'px';
});