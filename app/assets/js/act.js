$(document).ready(function () {
    $('a#show-panel').click(function () {
        $('#lightbox, #lightbox-panel').fadeIn(300);
    });
    $('a#close-panel').click(function () {
        $('#lightbox, #lightbox-panel').fadeOut(300);
    });
});

// (function () {
//     let angle = document.querySelector('.icon-down');
//     let lorem = document.querySelector('.lorem');

//     angle.onclick = function () {
//         lorem.classList.toggle('show');
//         lorem.classList.contains('show');
//         if (lorem.classList.contains('show')) {
//             angle.style.transform = 'rotate(180deg)';
//         } else {
//             angle.style.transform = 'rotate(0deg)';
//         }
//     };
// })();

$('.icon-down').click(() => {
    console.log('aaa');
});
