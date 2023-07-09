window.onload = function() {
    let main = document.querySelector('.gallery_main');
    let sub = document.querySelectorAll('.gallery_sub');
    let figcaptions = document.querySelectorAll('.grid figure figcaption');

    for (let i = 0; i < sub.length; i++) {
        sub[i].onclick = changeimg;
    }

    function changeimg() {
        let subchange = this.getAttribute('src');
        main.setAttribute('src', subchange);

        for (let j = 0; j < figcaptions.length; j++) {
            figcaptions[j].style.display = 'none';
        }

        let index = Array.from(sub).indexOf(this);
        let caption = figcaptions[index];
        caption.style.display = 'block';

        let captionText = caption.querySelector('h2').textContent;
        let mainCaption = document.querySelector('.grid figure figcaption:first-child h2');
//        mainCaption.textContent = captionText;
    }

    for (let j = 1; j < figcaptions.length; j++) {
        figcaptions[j].style.display = 'none';
    }
}