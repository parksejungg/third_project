<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지</title>
<meta name="description" content="A hover animation for a menu with 3D letters and image effect.">
	<meta name="keywords" content="gsap, animation, 3d, hover, menu, image, web design, javascript, template">
	<meta name="author" content="Codrops">
	<link rel="shortcut icon" href="/resources/img/ej_img/logoimg.ico">
	<link rel="stylesheet" type="text/css" href="/resources/css/ej_css/main.css">
	<link rel="stylesheet" href="/resources/css/ej_css/mainscript.css">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<!-- script 시작 -->
	<script>document.documentElement.className = "js";
        var supportsCssVars = function supportsCssVars() {
        var e,
        t = document.createElement("style");
        return t.innerHTML = "root: { --tmp-var: bold; }", document.head.appendChild(t), e = !!(window.CSS && window.CSS.supports && window.CSS.supports("font-weight", "var(--tmp-var)")), t.parentNode.removeChild(t), e;
        };
        supportsCssVars() || alert("Please view this demo in a modern browser that supports CSS Variables.");
    </script>
    <script src="/resources/js/ej_js/modules01.js"></script>
	
    <script>
      
        window.addEventListener('DOMContentLoaded', function(){

			//롤링 배너 복제본 생성
            let roller = document.querySelector('.rolltxt');
            roller.id = 'roller1';

            let clone = roller.cloneNode(true);
            clone.id = 'roller2';
            document.querySelector('.roll').appendChild(clone); //부착

			//원본, 복제본 배너 위치 지정
            document.querySelector('#roller1').style.left = '0px';
            document.querySelector('#roller2').style.left = document.querySelector('.rolltxt ul').offsetWidth+'px';

			//인터벌 메서드로 애니메이션 생성
            let rollerWidth = document.querySelector('.rolltxt ul').offsetWidth;//회전 배너 너비값
			let betweenDistance = 1;//이동 크기 - 정수여야 함

			//롤링 시작
			function startRoller(){
				originalID = window.setInterval(betweenRollCallback, parseInt(1000/100), betweenDistance, document.querySelector('#roller1'));
				cloneID = window.setInterval(betweenRollCallback, parseInt(1000/100), betweenDistance, document.querySelector('#roller2'));
			}

			//인터벌 애니메이션 함수(공용)
			function betweenRollCallback(d, roller){
				let left = parseInt(roller.style.left);
				roller.style.left = (left - d)+'px';//이동
				//조건부 위치 리셋
				if(rollerWidth + (left - d) <= 0){
					roller.style.left = rollerWidth+'px';
				}
			}

			startRoller();//롤링 초기화
        });
    </script>
	<!-- script 끝 -->
</head>
<body>
	<main>
		<div class="frame">
			<a href="#"><h1 class="frame__title"><img src="/resources/img/ej_img/logo.png" alt="로고이미지"></h1></a>
			<div class="frame__links">
				<a style="color: #994D22;">ADMIN PAGE</a>
				<c:if test="${member == null}"><a href="/member/login">LOGIN</a></c:if>
				<c:if test="${member != null}"><a id="btnlogout">LOGOUT</a></c:if>
			</div>
		</div>
	<nav class="menu">
			<a class="menu__item" href="/notice/list">
				<span class="menu__item-text" data-splitting="">NOTICE</span>
			</a>
		</nav>
		<footer>
			<div class="rollbanner">
				<div class="roll">
					<div class="rolltxt">
					
						<ul>
							<li>
								<strong class="name">* MONET 전시 운영 시간 : </strong>오전 10:00 ~ 오후 17:00 
							</li>
							<li>
								<strong class="name">* 전시 장소 : </strong>M:美 미술관
							</li>
							<li>
								<strong class="name">* 자세한 사항은 홈페이지를 참고 바랍니다.</strong>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			
			<div class="footimg">
				<a href="https://www.seoul.go.kr/main/index.jsp" target="_blank"><img src="/resources/img/ej_img/서울특별시.png" alt="서울특별시"></a>
				<a href="https://www.sac.or.kr/site/main/home" target="_blank"><img src="/resources/img/ej_img/예술의전당.png" alt="예술의전당"></a>
			</div>
			
			<div class="foottxtbox">
				<ul>
					<a href="/main.jsp"><img src="/resources/img/ej_img/logo.png" alt="로고이미지"></a>
					<li>대표자 : <span>SUNG HAN SOL</span></li>
					<li>대표전화 : 02-1234-5678</li>
					<li>주소 : 서울특별시 강남구 압구정로 343 (압구정동)</li>
					<li>COPYRIGHT ⓒ BY M:美. ALL RIGHTS RESERVED</li>
				</ul>
			</div>
			
		</footer>
	</main>

	<svg class="cursor" width="20" height="20" viewBox="0 0 20 20">
		<circle class="cursor__inner" cx="10" cy="10" r="5"></circle>
	</svg>
	
	<script src="/resources/js/ej_js/modules02.js"></script>
	
</body>
<script type="text/javascript">

$(document).ready(function(){

	$("#btnlogout").click(function(){
		$.ajax({
			type:"POST",
			url:"/member/logout",
			success:function(data){
				document.location.reload(); //다시 화면 로드
			}
		}); //ajax end
	});
});
</script>
</html>