<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
 <form action="/member/register" method="post">
          <input type="text" name="userId" class="form-control" placeholder="아아디">
          <input type="password" name="userPw" class="form-control" placeholder="비밀번호">
          <input type="password" class="form-control" placeholder="비밀번호 확인">
          <input type="text" name="userName" class="form-control" placeholder="이름">
          <input type="text" name="userBirth" class="form-control" placeholder="생일">
          <input type="text" name="userAdd1" class="form-control" placeholder="주소1">
          <input type="text" name="userAdd2" class="form-control" placeholder="주소2">
          <input type="checkbox" id="agreeTerms" name="terms" value="agree">
          <button type="submit" class="btn btn-primary btn-block">Register</button>
      </form>
      
      <script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>

</body>
</html>