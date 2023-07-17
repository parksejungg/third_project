<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>modal</title>
<link rel="stylesheet" href="/resources/css/yyj_css/modal.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> <!-- jQuery UI 라이브러리 포함 -->
</head>
<body>
    <div id="popup_layer">
        <div class="popup_box">
            <!--팝업 컨텐츠 영역-->
            <div class="popup_cont">
                <h2> 관람 안내 </h2>
                <p>
                    <h4 class="c_title">전시 개요</h4> 
                    전시 장소: M:美 MUSEUM <br>
                    전시 기간: 2023년 7월 1일 ~ 2023년 8월 30일 <br>
                    관람 시간: 오전 10시 ~ 오후 7시 <br>  ( 전시 운영 기간
                    별도 휴관일 없음) 
                    
                    <h4 class="c_title2">환불 규정</h4>
                    * 이미 발권한 티켓은 취소 및 환불이 불가합니다. <br>
                    * 취소 및 환불은 2023년 8월 30일 오후 5시까지 <br> 가능합니다. (8월 30일 오후 5시 이후부터는 취소 <br> 및 환불이 불가합니다.)
                </p>
            </div>
            <!--팝업 버튼 영역-->
            <div class="popup_btn">
                <!--하루동안 보지않기-->
                <a id="chk_today" href="javascript:closeToday2();" class="close_day">하루 동안 보지 않기</a> 
                <!--7일간 보지않기-->
                <!-- <a id="chk_today" href="javascript:closeToday();" class="close_day">Do not open for 7 days</a>-->
                <a href="javascript:closePop();">닫기</a>
            </div>
        </div>
      </div>


      <script>

        // 쿠키 생성
function setCookie( name, value, expiredays ) {  // 쿠키저장
	var todayDate = new Date();  //date객체 생성 후 변수에 저장
	todayDate.setDate( todayDate.getDate() + expiredays ); 
   	 // 시간지정(현재시간 + 지정시간)
	document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toUTCString() + ";"
	//위 정보를 쿠키에 굽는다
} 

$(function(){
	$(".popup_box").draggable({containment:'parent', scroll:false}); // 레이어 팝업 창 드래그 가능
	//{containment:'parent', scroll:false} 화면 영역 밖으로 드래그 안됌.
                
	if(document.cookie.indexOf("popToday=close") < 0 ){      // 쿠키 저장여부 체크
		document.getElementById("popup_layer").style.display = "block";
		}else {
		document.getElementById("popup_layer").style.display = "none"; 
		}
	});
             
//오늘하루만보기 닫기버튼 스크립트
function closeToday2() { 
	setCookie( "popToday", "close" , 1  ); 
	$("#popup_layer").css("display", "none");
	document.getElementById("popup_layer").style.display = "none";
}
//그냥 닫기버튼 스크립트
function closePop() { 
	document.getElementById("popup_layer").style.display = "none";
}

$(function(){
	$(".popup_box").draggable({containment:'parent', scroll:false}); // 레이어 팝업 창 드래그 가능
	//{containment:'parent', scroll:false} 화면 영역 밖으로 드래그 안됌.
                
	if(document.cookie.indexOf("popToday=close") < 0 ){      // 쿠키 저장여부 체크
		document.getElementById("popup_layer").style.display = "block";
		}else {
		document.getElementById("popup_layer").style.display = "none"; 
		}
	});
             


    </script>



</body>
</html>