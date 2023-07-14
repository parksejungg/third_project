var container = document.querySelector('.artists_list');

container.addEventListener('wheel', function (e) { //wheel은 마우스 휠 스크롤 동작 감지 이벤트 리스너
    e.preventDefault(); //이벤트 기본동작 취소시키기
    container.scrollLeft += e.deltaY; // 변수 (.wrap-vertical)의scrollLeft 속성값을 변경함
});
// e.daltaY는 마우스 휠의 이동방향이랑 크기를 나타낸다고 함.
