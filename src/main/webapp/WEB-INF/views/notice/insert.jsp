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
<h1>공지사항 등록</h1>
<form action="/notice/insert" method="post">
	<div>
		<label>제목 </label>
		<input name="title">
	</div>

	<div>
		<label>내용</label>
		<textarea row="3" name="content"></textarea>
	</div>
	
	<div>
		<label>글쓴이</label>
		<input name="writer" disabled="disabled" value="admin">
	</div>
	<button>글 등록</button>
</form>
</body>
</html>