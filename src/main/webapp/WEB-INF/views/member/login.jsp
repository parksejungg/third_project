<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
</head>
<body>
   <div class="card">
	    <div class="card-body login-card-body">
	      <p class="login-box-msg">Sign in to start your session</p>
	
	      <form id="login_form" method="post">
	        <div class="input-group mb-3">
	          <input type="text" name="userId" class="form-control" placeholder="아이디">
	         </div>
	        <div class="input-group mb-3">
	          <input type="password" name="userPw" class="form-control" placeholder="비밀번호">
	        </div>
	        
	        <div class="row">
	              <input type="checkbox" id="remember">
	              <label for="remember">
	                Remember Me
	              </label>
	          </div>
	          <div class="col-4">
	            <button type="submit" class="loginbtn">로그인</button>
	          </div>
	      </form>
	
	      <p class="mb-1">
	        <a href="#">I forgot my password</a>
	      </p>
	      <p class="mb-0">
	        <a href="member/register" class="text-center">Register a new membership</a>
	      </p>
	    </div>
    <!-- /.login-card-body -->
  </div>
    <!-- /.login-box-body -->

<script>
$(".loginbtn").click(function(){
	alert("로그인 버튼 작용");
	
	//로긴 메서드 서버 요청
	$("#login_form").attr("action", "/member/login");
	$("#login_form").submit();
	
});
</script>


</body>
</html>