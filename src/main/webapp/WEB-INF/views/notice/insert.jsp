<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/resources/img/ej_img/logoimg.ico">

<link rel="stylesheet" href="/resources/css/hs_css/buttons.css">
<link rel="stylesheet" href="/resources/css/hs_css/noticeWrite.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>공지사항</title>
</head>
<body>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/mouse.jsp" %>

	<div class="bodyTop">
                <div class="category">NOTICE</div>
     </div>
            <form id="noticeForm" action="/notice/insert" method="post">
                <div class="frameWrap">
                    <div class="bodyText must">Write</div>
                    <div class="n1">
                        <input type="text" name="title" class="" placeholder="제목">
                    </div>
                    <div class="n2">
                        <input type="text" name="writer" value="관리자" readonly="readonly">
                    </div>
                    <div class="n3">
                        <textarea row="50" placeholder="내용" name="content"></textarea>
                    </div>
                    <div class="n4">
                        <button
                            class="button button--ujarak button--border-thin button--text-thick btnRegister">등록</button>
                        <button
                            class="button button--ujarak button--border-thin button--text-thick btnRegister" id="cancle">취소</button>
                    </div>
                </div>
            </form>

 <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
 
 <script type="text/javascript">
 
 $("#cancle").click(function(){
	 
	 var title = $("input[name='title']").val();
     var content = $("textarea[name='content']").val();
     
     if (title !== '' || content !== '') {
         event.preventDefault();
         var result = confirm("작성을 취소하십니까?");
         if (result) {
             window.location.href = "/notice/list";
	 	}
     } else {
         event.preventDefault();
         var result = confirm("작성을 취소하십니까?");
         if (result) {
             window.location.href = "/notice/list";
	 	}
     }
     
 });

 </script>
 
</body>
</html>