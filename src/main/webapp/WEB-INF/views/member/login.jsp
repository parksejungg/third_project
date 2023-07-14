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
                 <form id="login_form" method="post">
	                <div class="loginform">
	                    <div><input type="text" name="userId" placeholder="아이디"></div>
	                    <div><input type="password" name="userPw" placeholder="비밀번호"></div>
	                    <c:if test= "${result==0}"><div class="notice">
	                        아이디 또는 비밀번호를 확인 해 주세요.
	                    </div></c:if>
	                </div>
	                <div class="btn_">
	                    <button type="submit" class="button button--ujarak button--border-thin button--text-thick btnLogin_ " >로그인</button>
	                </div>
                </form>

                <div class="btnRegister"><a href="/member/register">회원가입</a></div>
            </div>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

         

<script>
$(".loginbtn_").click(function(){
	alert("로그인 버튼 작용");
	
	//로긴 메서드 서버 요청
	$("#login_form").attr("action", "/member/login");
	$("#login_form").submit();
});
</script>


</body>
</html>