<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="/resources/css/hs_css/bootstrap_min.css">
<link rel="stylesheet" href="/resources/css/hs_css/style.css">
<link rel="stylesheet" href="/resources/css/hs_css/join.css">
<link rel="stylesheet" href="/resources/css/hs_css/buttons.css">

<title>join</title>
</head>
<body>
  <%@ include file="/WEB-INF/views/includes/header.jsp" %>
   <div class="wrapBody">
       <div class="bodyTop">
           <div class="joinText">SIGN UP</div>
           <span class="notice1 must">은 필수 입력 항목입니다.</span>
       </div>
             
		<form id="join_form" method="post">
             <div class="p1">
                 <input type="text" placeholder="아이디" id="userId" name="userId" class="must" onchange="checkId()">
                 <div class="notice2"> √ 사용가능한 아이디 입니다!</div>
                 <div class="notice2_f"> √ 사용 중인 아이디입니다!</div>
             </div>

             <div class="p2">
                 <input type="password" placeholder="비밀번호" id="userPw" name="userPw" class=" must">
                 <input class="password_check" type="password" placeholder="비밀번호 확인" id="user_pwd_check"
                     name="user_pwd">
             </div>

             <div class="p1">
                 <input type="text" id="user_name" name="userName" class="long must" placeholder="이름(실명)">
             </div>
             <div class="p1">
                 <input type="text" maxlength="8" id="user_birth" name="userBirth"
                     oninput="this.value = this.value.replace(/[^0-9.]/g, '')" placeholder="생년월일(예:20000101)">
             </div>

             <div class="p4">
                 <input type="text" class="must" placeholder="주소" id="user_add" name="userAddr1" readonly="readonly">
                 <button type="button" class="button button--ujarak button--border-thin button--text-thick btn-add" id="add_search" 
                     onclick="openAddr();">주소검색</button>
            </div>
            
            <div class="p1">
                  <input type="text" id="user_add2" name="userAddr2" placeholder="상세주소">
             </div>

            <div>
                <button class="button button--ujarak button--border-thin button--text-thick btn-joinfin"
                    id="fin_join">가입완료</button>
            </div>
        </form>
        </div>

        <hr>
        <div class="footer">
        </div>
</body>

<script>

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	
	$("#fin_join").click(function(){
		$("#join_form").attr("action", "/member/register");
		$("#join_form").submit();
		alert("회원가입이 완료되었습니다.");
	});
});
//아이디 중복검사
function checkId() {
	var userId = $('#userId').val();
	var data = {userId : userId}
	
	$.ajax({
		type:"post",
		url :"/member/idCheck",
		data : data,
		success : function(result){
			if(result!='fail'){ 	//사용 가능한 아이디일 때
				console.log("fail");
				$('.notice2_f').css("display","none");
				
				$('.notice2').css("display","inline-block");
				$('.notice2_f').css("display","none");
			}else{					//사용불가 아이디일때
				$('.notice2_f').css("display","none");

				$('.notice2').css("display","none");
				$('.notice2_f').css("display","inline-block");
				
				  $('#userId').val("");
	                document.getElementById("userId").focus();
			}			
		}
	}); 
}

//도로명주소 - 주소검색 팝업을 호출합니다.
//https://business.juso.go.kr/addrlink/openApi/popupApi.do 웹사이트에서 하단 "주소입력화면 소스보기"를 클릭해서 참고합니다.
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


</html>