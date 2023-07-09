<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="/resources/css/payment/intro.css">
<script src="/resources/js/payment/aboutex.js"></script>
<script>
document.documentElement.className = "js";
  var supportsCssVars = function supportsCssVars() {
  var e,
  t = document.createElement("style");
  return t.innerHTML = "root: { --tmp-var: bold; }", document.head.appendChild(t), e = !!(window.CSS && window.CSS.supports && window.CSS.supports("font-weight", "var(--tmp-var)")), t.parentNode.removeChild(t), e;
  };
  supportsCssVars() || alert("Please view this demo in a modern browser that supports CSS Variables.");
</script>
</head>
<body>
<body class="loading">
	<main>
		<div class="frame">
			<h1 class="frame__title"><img src="/resources/img/intro_img/logo.png" alt="로고이미지"></h1>
			<div class="frame__links">
				<a href="#"><img src="/resources/img/intro_img/menu_bar.svg"></a>
			</div>
		</div>

<!-- 소개부분 시작-->
		<div class="row">
			<div class="introimg">
				<img src="/resources/img/intro_img/intro.svg" class="intro_img" alt="전시소개 이미지">
			</div>

			<p class="introtxt">
				클로드 모네의 작품은 마음을 향유로 이끄는 단편들입니다. 
				끝 없이 흘러가는 색채와 은유적인 붓터치는 우리를 우리 자신의 감성적인 세계로 안내합니다.이전에 미처 알지 못한 아름다움을 발견하고 우리 안에 잠재된 창조의 에너지를 일깨워보세요.
				전시회를 통해 창작자와 관객 사이의 간극을 헤치고, 마음이 만나는 곳에서 진정한 연결을 경험할 수 있다고 믿습니다.
				그림 속으로 빠져들어 함께하는 그 순간, 저희 M:美가 함께하겠습니다.
				클로드 모네의 세계에서 우리의 마음이 공존하는 그 순간을 기다립니다.
				
				이야기를 함께 풀어나가며 감성의 향연을 즐겨보세요. 
				
			</p>

			<div class="introsub">
				<div class="introsub_text">
				<h2>Who is HE</h2>
				<p>
					'빛은 곧 색채'라는 인상주의 원칙을 끝까지 고수했으며, 
					<수련> 연작을 통해 자연에 대한 우주적인 시선을 보여준 클로드 모네. 
					한 곳의 장소가 시간과 빛의 변화 속에서 어떤 모습을 보여주는지 명확히 보여주는 <br>그의 연작 시리즈는 빛과 색채를 중시했던 인상주의가 무엇인지 작품만 보아도 알 수 있도록 해줍니다.
					<br>자연의 빛과 색채를 자신만의 시선을 표현하며 또 하나의 우주를 창조했던 거장, 클로드 모네.
					모네가 그려나간 따뜻한 빛의 세상으로 저희 M:美 와 함께 작품 속으로 들어가볼까요?
				</p>
			   </div>
			</div>


			<div class="mini_gallery">MINI GALLERY</div>
	
			<div class="grid">
				<figure class="effect-bubba">
					<img class="gallery_main"  src="/resources/img/intro_img/인상해돋이.jpg" alt="인상해돋이"/>
					
					<figcaption>
						<h2>인상해돋이</h2>
						<p>'인상, 해돋이'는 르 아브르 항구의 해돋이 광경을 그린 그림으로<br>
							19세기 후반을 풍미한 인상파 대표적 작품이다.</p>
					</figcaption>	

					<figcaption>
						<h2>수련연못</h2>
						<p>1883년 파리에서 약 100킬로미터 떨어진 지베르니라는 시골
							마을에 있는 자택에 연못과 정원을 꾸며 놓고<br> 시시각각 달라지는 연못과 연꽃의 풍경을 화폭에 담았다.</p>
					</figcaption>

					<figcaption>
						<h2>생라자르역</h2>
						<p>생 라자르 역은 파리에서 두번째로 큰 규모를 자랑하는 기차역으로, 이는 과학 문명과 감성적 표현적 예술의 대립이라는<br> 큰 구도속에서 이루어진 사색이라는 점에서 현대의 징조로 볼 수 있다.</p>
					</figcaption>	
					
					<figcaption>
						<h2>뱃놀이</h2>
						<p>이 그림에 나오는 모델은 두번째 부인 앨리스 오슈네가 데려온 두 딸이다.
							일체의 장식적요소를 배제한 파격적인 구도가<br> 빛과 그림자를 대담하게 대비시킨 효과를 보여주는 작품이다.</p>
					</figcaption>	
				</figure>

				<div id="smallImage">
					<img class="gallery_sub" src="/resources/img/intro_img/인상해돋이.jpg"/>
					<img class="gallery_sub" src="/resources/img/intro_img/수련연못.jpg"/>
					<img class="gallery_sub" src="/resources/img/intro_img/기차역.jpg"/>
					<img class="gallery_sub" src="/resources/img/intro_img/뱃놀이.jpg"/>
				</div>

				<div class="box bg-2">
					<button  class="button button--moema button--border-thick" onclick="location.href='payment.do'";>BUY TICKET</button>
				</div>
			</div>
	

		</div>
<!-- 소개부분 끝 -->
		<footer>
			<hr class="footline">
			<div class="foottxt">
				COPYRIGHT ⓒ BY WEBDESIGN. ALL RIGHTS RESERVED
			</div>
		</footer>
	</main>

	<svg class="cursor" width="20" height="20" viewBox="0 0 20 20">
		<circle class="cursor__inner" cx="10" cy="10" r="5"></circle>
	</svg>


<script src="/resources/js/payment/modules02.js"></script>
</body>
</html>