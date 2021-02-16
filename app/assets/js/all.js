// $(document).ready(function(){
//     console.log('恭喜可以寫JQ囉');
// });

window.onload = function() {
    console.log(document.title);

    //popovers 
    let item = document.querySelector(`[data-js]`);
    let popoversArea = document.querySelector(`.popovers`);

    if (item) {

        item.addEventListener("mouseenter", (e) => {

            e.preventDefault();
            const { offsetLeft, offsetTop } = e.target;
            popoversArea.style.top = `${offsetTop - 50}px`;
            popoversArea.style.left = `${offsetLeft - 280}px`;
            popoversArea.style.display = "block";
            popoversArea.style.opacity = 1;
        })

        item.addEventListener("mouseleave", (e) => {
            popoversArea.style.display = "none";
            popoversArea.style.opacity = 0;

        })

    }






};