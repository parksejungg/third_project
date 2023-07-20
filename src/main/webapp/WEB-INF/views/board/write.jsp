<%@page import="org.me.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/jm_css/write.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>

<style type="text/css">
input:focus {
	outline: none;
}

textarea:focus {
	outline: none;
}

button:hover {
	background: #FAF5EB !important;
	color: #994D22 !important;
	border: 1px solid #994D22 !important;
}
</style>

<!-- sts에서 jquery 사용 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 넣을 공간 -->
<%
	MemberVO memberVo = (MemberVO) session.getAttribute("member");
%>
<script>
	var userId = '<%= memberVo == null ? "" : memberVo.getUserId() %>';

	function saveBoard() {
		var title = $("#title").val();
		var content = $("#content").val();

		if (title == "") {
			alert("제목을 입력하세요");
			document.form1.title.focus();
			return;
		} else if (content == "") {
			alert("내용을 입력하세요");
			document.form1.content.focus();
			return;
		}
		
		$('#userId').val(userId);
		document.form1.submit();
	}

</script>
</head>
<body style="background: #FFFBF2">
	<%@ include file="/WEB-INF/views/includes/mouse.jsp"%>
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!-- 카테고리 넣을 공간 -->

	<div style="text-align: center; margin-top: 43px">
		<img style="width: 330px; margin-bottom: 55px;"
			src="/resources/img/board/view_title.png" alt=""> <br /> <br />
	</div>

	<form name="form1" method="post" action="/relay/board/insert">
		<div
			style="text-align: center; padding: 5px; margin-left: auto; margin-right: auto; margin: 0 auto;">
			<img class="write_content"
				style="width: 1150px; margin-top: 10px; position: relative;"
				src="/resources/img/board/view_contents.png" alt=""> <br />
			<br />
		</div>
		
		<input type="hidden" id="userId" name="userId" />

		<div class="write_input01"
			style="position: absolute; width: 100%; text-align: center; top: 400px; font-size: 16pt">
			제목 : <input class="write_input02" name="title" id="title" size="80"
				placeholder="제목"> <br /> <br /> <span class="relay_content"><b>여러분의 멋진 아이디어로 릴레이 소설을 작성보세요!</b></span><br>
			<textarea class="write_input03" name="content" id="content" rows="4"
				cols="80" placeholder="내용"></textarea>
			<br /> <br />
		</div>

		<div style="width: 350px; margin: 0 auto; text-align: center;">
			<button class="btn btn-outline-secondary"
				style="border: 1px solid #A98B67; color: #A98B67; margin: 5px; margin-top: -15px; width: 70px; height: 46px;"
				type="button" id="btnSave" onclick="saveBoard()">작성</button>
		</div>
	</form>

	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>
