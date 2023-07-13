<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/footer_css/footer.css">

    
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
</head>
<body>

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
					<li>대표자 : <span>SS</span></li>
					<li>대표전화 : 02-1234-5678</li>
					<li>주소 : 서울특별시 강남구 압구정로 343 (압구정동)</li>
					<li>COPYRIGHT ⓒ BY M:美. ALL RIGHTS RESERVED</li>
				</ul>
			</div>
			
		</footer>


</body>
</html>