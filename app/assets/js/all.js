// $(document).ready(function(){
//     console.log('恭喜可以寫JQ囉');
// });

window.onload = function() {
    console.log(document.title);

    //popovers 
    let popoversItem = document.querySelector(`[data-js='js-popovers']`);
    let popoversArea = document.querySelector(`.popovers`);

    if (popoversItem) {
        popoversItem.addEventListener("mouseenter", (e) => {

            e.preventDefault();
            const { offsetLeft, offsetTop } = e.target;
            popoversArea.style.top = `${offsetTop - 50}px`;
            popoversArea.style.left = `${offsetLeft - 280}px`;
            popoversArea.style.display = "block";
            popoversArea.style.opacity = 1;
        })
        popoversItem.addEventListener("mouseleave", (e) => {
            popoversArea.style.display = "none";
            popoversArea.style.opacity = 0;
        })
    }
    //progress 進度條

    let progressBtn = document.querySelector(`[data-js='js-progress']`);
    let progressBar = document.querySelector('.progress');

    let clickNumber = 1;

    if (progressBtn) {

        progressBtn.addEventListener('click', () => {

            let liList = progressBar.querySelectorAll('.progress li');

            if (clickNumber >= liList.length) {
                console.log(`超過了`);
                return
            };

            if (liList[clickNumber].classList.contains("progress__item--active")) {
                // liList[i].classList.remove("progress__item--active");
            } else {
                liList[clickNumber].classList.add("progress__item--active");
            }

            clickNumber += 1;

        })

    }






};