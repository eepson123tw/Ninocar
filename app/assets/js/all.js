// $(document).ready(function(){
//     console.log('恭喜可以寫JQ囉');
// });

window.onload = function() {
    console.log(document.title);


    //popovers 
    let item = document.querySelector(`[data-js]`);
    let popoversArea = document.querySelector(`.popovers`);



    if (item) {

        // item.classList.add('popovers');
        item.addEventListener("mouseover", (e) => {
            e.preventDefault();
            console.log(e);
            const { offsetLeft, offsetTop } = e.target;
            popoversArea.style.top = `${offsetTop}px`;
            popoversArea.style.left = `${offsetLeft}px`;
            popoversArea.style.display = "block";
            popoversArea.style.opacity = 1;
        })

        item.addEventListener("mouseout", (e) => {

            // popoversArea.style.opacity = 0;

        })

    }








};