var rcanvas = document.getElementById("rcanvas");
var rcontext = rcanvas.getContext("2d");

var backcanvas = document.getElementById("backcanvas");
var backcontext = backcanvas.getContext("2d");


// 이미지 객체 배열
var imgSource = ['resources/img/render/1-1.png', 'resources/img/render/2.png', 'resources/img/render/3.png'];
var currntImgIndex = 0; // 현재 이미지 인덱스
var backIndex = currntImgIndex + 1; //뒤에 이미지 인덱스

var frontimg = new Image();
var backimg = new Image();

frontimg.src = imgSource[currntImgIndex];
backimg.src = imgSource[backIndex];


// 이미지 로드 후 그리기 함수 호출
frontimg.onload = function () {
    resizeAndDraw();
};

function resizeAndDraw() {
    rcanvas.width = window.innerWidth;
    rcanvas.height = window.innerHeight;

    backcanvas.width = window.innerWidth;
    backcanvas.height = window.innerHeight;


    var rcanvasRatio = rcanvas.width / rcanvas.height;
    var backcanvasRatio = backcanvas.width / backcanvas.height;

    if (rcanvasRatio > backcanvasRatio) {

        var scaleRatio = rcanvas.height / frontimg.height;

        var bscaledWidth = backimg.width * scaleRatio;
        var bscaledHeight = backimg.height * scaleRatio;

        var bx = (backcanvas.width - bscaledWidth) / 2; // 이미지 중앙 정렬
        var by = (backcanvas.height - bscaledHeight) / 2;

        backcontext.clearRect(0, 0, backcanvas.width, backcanvas.height);
        backcontext.drawImage(backimg, bx, by, bscaledWidth, bscaledHeight);
    } else {

        var scaleRatio = rcanvas.width / frontimg.width;
        var bscaledWidth = backimg.width * scaleRatio;
        var bscaledHeight = backimg.height * scaleRatio;

        var bx = (backcanvas.width - bscaledWidth) / 2; // 이미지 중앙 정렬
        var by = (backcanvas.height - bscaledHeight) / 2;

        backcontext.clearRect(0, 0, backcanvas.width, backcanvas.height);
        backcontext.drawImage(backimg, bx, by, bscaledWidth, bscaledHeight);
    }

    rcontext.clearRect(0, 0, rcanvas.width, rcanvas.height);
    rcontext.drawImage(frontimg, 0, 0, rcanvas.width, rcanvas.height);
}

// 초기화 및 리사이즈 이벤트 처리
window.addEventListener('DOMContentLoaded', resizeAndDraw);
window.addEventListener('resize', resizeAndDraw);


//지우개설정
var isDrawing = false;

rcanvas.addEventListener('mousedown', startDrawing);
rcanvas.addEventListener('mousemove', draw);
rcanvas.addEventListener('mouseup', stopDrawing);
rcanvas.addEventListener('mouseout', stopDrawing);

function startDrawing(e) {
    isDrawing = true;
    erase(e.clientX, e.clientY);
}

function draw(e) {
    if (!isDrawing) return;
    erase(e.clientX, e.clientY);
}

function stopDrawing() {
    isDrawing = false;
}

function erase(x, y) {
    var radius = 85; // 지우개 반지름 설정

    rcontext.globalCompositeOperation = 'destination-out'; // 지우개 모드 설정

    rcontext.beginPath();
    rcontext.arc(x, y, radius, 0, 2 * Math.PI); // 원 그리기
    rcontext.closePath();
    rcontext.fill();
    rcontext.globalCompositeOperation = 'source-over'; // 기본 모드로 복원

    backcontext.clearRect(0, 0, backcanvas.width, backcanvas.height);
    backcontext.drawImage(backimg, 0, 0, backcanvas.width, backcanvas.height);

    var erasedPixels = 0;
    var totalPixels = rcanvas.width * rcanvas.height;

    var imageData = rcontext.getImageData(0, 0, rcanvas.width, rcanvas.height);
    var pixelData = imageData.data;

    for (var i = 0; i < pixelData.length; i += 4) {
        if (pixelData[i + 3] === 0) {
            erasedPixels++;
        }
    }

    var erasedAreaRatio = erasedPixels / totalPixels;
    console.log(erasedAreaRatio); // 캔버스가 얼마나 지워졌는지 백분율로 출력

    if (erasedAreaRatio >= 0.5) {

        //애니메이션을 위한 클래스 추가
        rcanvas.classList.add('fade-out');
        isDrawing = false;

        //시간초 설정
        setTimeout(function () {
            currntImgIndex = (currntImgIndex + 1) % imgSource.length; // 다음 이미지 인덱스 계산
            backIndex = (backIndex + 1) % imgSource.length; // 다음 이미지 인덱스 계산
            if (backIndex > 2) {
                backIndex = 0;
            }
            frontimg.src = imgSource[currntImgIndex]; // 다음 이미지로 변경
            backimg.src = imgSource[backIndex];

            backimg.onload = function () {
                rcanvas.classList.remove('fade-out');
            };
            resizeAndDraw();
            rcontext.clearRect(0, 0, rcanvas.width, rcanvas.height);
            rcontext.drawImage(frontimg, 0, 0, rcanvas.width, rcanvas.height); // 이미지를 캔버스에 다시 그림

        }, 3000);
    }
}