<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.me.mapper.MapMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" media="screen"
	href="/resources/css/bootstrap-3.3.2.min.css">
<script type="text/javascript"
	src="/resources/js/yj_js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/yyj_css/map.css">
<link rel="stylesheet" href="/resources/css/hs_css/buttons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Viaoda+Libre&display=swap"
	rel="stylesheet">
<title>M:美 찾아오는 길</title>
<script type="text/javascript">

$(document).ready(function () {
	
	$("#map_fin").click(function() {
		$("#map_form").attr("action", "/map");
		$("#map_form").submit();
		alert("완료");
	});
});
function openAddr(){
	var url = "/addressAPIPopup.jsp";
	var name = "AddressPopup";
	var option = "width=650, height=500, top=100, left=200, location=no, noopenr";
	window.open(url, name, option);
}

function callback_openAddressPopup(aParam) {
	document.getElementById("user_add").value = aParam["roadAddr"];
	 document.getElementById("user_add2").focus();
}
	

</script>
</head>

<body class="mBody">
	
	<%@ include file="/WEB-INF/views/includes/mouse.jsp"%>
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	
	<div class="ContactUs">
		<p>CONTACT</p>
	</div>

	<form id="map_form" method="post">
		<div class="input">
			<input type="text" class="Cname" placeholder="이름" id="mapName"
				name="map_Name"> <input type="text" class="email"
				placeholder="이메일" id="mapEmail" name="map_Email">
		</div>

		<div class="p4">
			<input type="text" class="must" placeholder="주소" id="user_add"
				name="basic_Address" readonly="readonly">
			<button type="button"
				class="button button--ujarak button--border-thin button--text-thick btn-add"
				id="add_search" onclick="openAddr();">주소검색</button>
		</div>



		<div class="sec_input">
			<input type="text" class="input_title" placeholder="제목" id="mapTitle"
				name="map_Title">
		</div>

		<div class="dual">

			<div class="third_input">
				<!-- <input type="text" class="content" placeholder="Content" > -->
				<textarea name="map_Content" id="mapContent" cols="30" rows="10"
					placeholder=" 내용"></textarea>
			</div>

			<input type="submit" value="전송" class="button button--ujarak button--border-thin button--text-thick btnLogin_ "  id="map_fin">
	</form>

	<!-- <div class="google-map">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.2055551693243!2d126.87640531156048!3d37.50306977193841!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9fc70bce5993%3A0xdd5b5b33e55b538e!2z7ZWY7J2066-465SU7Ja07Lu07ZOo7YSw7ZWZ7JuQIOq1rOuhnOy6oO2NvOyKpA!5e0!3m2!1sko!2skr!4v1688520153004!5m2!1sko!2skr"
                width="700" height="500" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade" ></iframe>
        </div> -->

		<div id="map" class="map"
			style="width: 660px; height: 503px; float: right; margin-top: -560px; margin-right: 292px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a435bbd63f6491ba10742adee94fc70"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.528561, 127.040054), // 지도의 중심좌표
				level : 4
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			var imageSrc = "/resources/img/yj_img/map.png", // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
			imageOption = {
				offset : new kakao.maps.Point(27, 69)
			}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imageOption), markerPosition = new kakao.maps.LatLng(
					37.528561, 127.040054); // 마커가 표시될 위치입니다

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition,
				image : markerImage
			// 마커이미지 설정 
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		</script>

	</div>





	</div>
	</div>

</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>