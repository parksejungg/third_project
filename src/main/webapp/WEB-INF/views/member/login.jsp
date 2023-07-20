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
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/hs_css/login.css">
<link rel="stylesheet" href="/resources/css/hs_css/buttons.css">
<title>login</title>
</head>
<body>
     <%@ include file="/WEB-INF/views/includes/mouse.jsp" %>
     <%@ include file="/WEB-INF/views/includes/header.jsp" %>
            <div class="wrapBody">
                <div class="loginText">LOGIN</div>
                 <form id="login_form" method="post" onsubmit="return frm_check();">
	                <div class="loginform">
	                    <div><input type="text" id="userId" name="userId" placeholder="아이디"></div>
	                    <div><input type="password" name="userPw" placeholder="비밀번호"></div>
	                    <c:if test= "${result==0}"><div class="notice">
	                        아이디 또는 비밀번호를 확인 해 주세요.
	                    </div></c:if>
	                    <div class="logSave">
		                    <label for="saveId">
		                        <input type="checkbox" class="saveId" name="saveId" id="saveId">아이디 저장
		                    </label>
		                </div>
	                </div>
	                <div class="btn_">
	                    <button type="submit" class="button button--ujarak button--border-thin button--text-thick btnLogin_ " >로그인</button>
	                </div>
                </form>

                <div class="btnRegister"><a href="/member/register">회원가입</a></div>
            </div>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

         

<script type="text/javascript">
$(document).ready(function () {
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#userId").val(key);

    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    if ($("#userId").val() !== "") {
        $("#saveId").prop("checked", true); // ID 저장하기를 체크 상태로 두기.
    }

    $("#saveId").change(function () { // 체크박스에 변화가 있다면,
        if ($("#saveId").is(":checked")) { // ID 저장하기 체크했을 때,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        } else { // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });

    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#userId").keyup(function () { // ID 입력 칸에 ID를 입력할 때,
        if ($("#saveId").is(":checked")) { // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        }
    });

    // 쿠키 저장하기 
    // setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }

    // 쿠키 삭제
    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }

    // 쿠키 가져오기
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if (start !== -1) { // 쿠키가 존재하면
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if (end === -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                end = cookieData.length;
            console.log("end위치  : " + end);
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
    
    //이전 페이지로 돌아가는 함수
    function redirectToPreviousPage() {
        var redirectUrl = '<%= request.getParameter("redirect") %>';
        if (redirectUrl) {
            location.href = redirectUrl; // 이전 페이지 URL로 이동
        } else {
            location.href = "/main.jsp"; // 이전 페이지 URL이 없을 경우 메인 페이지로 이동
        }
    }
});

$(".loginbtn_").click(function () {
    alert("로그인 버튼 작용");

    //로긴 메서드 서버 요청
    $("#login_form").attr("action", "/member/login");
    $("#login_form").submit();
});

</script>


</body>
</html>