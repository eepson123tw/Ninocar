$(document).ready(function () {
    //光箱
    // $('a#show-panel').click(function () {
    //     $('#lightbox, #lightbox-panel').fadeIn(300);
    // });
    // $('a#close-panel').click(function () {
    //     $('#lightbox, #lightbox-panel').fadeOut(300);
    // });

    // let angle = document.getElementsByClassName('icon-down')[0];
    // console.log(angle);
    // let lorem = document.querySelector('.lorem');
    // console.log(lorem);

    //收放選單
    let angle = document.querySelector('.icon-down');
    let lorem = document.querySelector('.lorem');

    angle.onclick = function () {
        lorem.classList.toggle('show');
        lorem.classList.contains('show');
        if (lorem.classList.contains('show')) {
            angle.style.transform = 'rotate(180deg)';
        } else {
            angle.style.transform = 'rotate(0deg)';
        }
    };

    let angle2 = document.querySelector('.icon-down2');
    let lorem2 = document.querySelector('.lorem2');

    angle2.onclick = function () {
        lorem2.classList.toggle('show');
        lorem2.classList.contains('show');
        if (lorem2.classList.contains('show')) {
            angle2.style.transform = 'rotate(180deg)';
        } else {
            angle2.style.transform = 'rotate(0deg)';
        }
    };

    // $('.icon-down').click(function () {
    //     $('.lorem').slideToggle();
    //     .css(('transform', 'rotate(180deg)'));
    // });

    // $('.icon-down2').click(function () {
    //     $('.lorem2').slideToggle();
    //     .css(('transform', 'rotate(180deg)'));
    // });
});
