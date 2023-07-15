<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/hs_css/buttons.css">
<link rel="stylesheet" href="/resources/css/hs_css/noticeWrite.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>공지사항 insert</title>
</head>
<body>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/mouse.jsp" %>


  <div class="bodyTop">
                <div class="category">NOTICE</div>
                <!-- <hr class="line"> -->
            </div> 
<form action="/notice/insert" method="post">
            <div class="wrapBody">
                <div class="bodyText">Write</div>
                <div class="frameform">
                            <input type="text" name="title" class="" placeholder="제목">
                    <div class="frameWrap">
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
                            <button class="button button--ujarak button--border-thin button--text-thick btnRegister">등록</button>
                            <button class="button button--ujarak button--border-thin button--text-thick btnRegister">취소</button>
                        </div>
                    </div>
                </div>

            </div>
</form>
<!-- 		<label>제목 </label>
		<input name="title">
	</div>

	<div>
		<label>내용</label>
		<textarea row="3" name="content"></textarea>
	</div>
	
	<div>
		<label>글쓴이</label>
		<input name="writer" value="admin" readonly="readonly">
	</div>
	<button>글 등록</button> -->
 <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>