<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
             
		<form action="/member/register" method="post">
             <div class="p1">
                 <input type="text" placeholder="아이디" id="userId" name="userId" class="must">
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
                 <input type="text" class="must" placeholder="주소입력" id="user_add" name="userAdd1">
                 <button class="button button--ujarak button--border-thin button--text-thick btn-add" id="add_search"
                     onclick="searchAddr();">주소검색</button>
            </div>

            <div>
                <button class="button button--ujarak button--border-thin button--text-thick btn-joinfin"
                    id="fin_join" type="submit">가입완료</button>
            </div>
        </form>
        </div>

        <hr>
        <div class="footer">
            <p>COPYRIGHT ⓒ BY WEBDESIGN. ALL RIGHTS RESERVED</p>
        </div>

</body>
</html>