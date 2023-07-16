<%@page import="org.me.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/view.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	MemberVO memberVo = (MemberVO) session.getAttribute("member");
%>
<!-- 헤더 넣을 공간 -->
<script>
	var userId = '<%= memberVo == null ? "" : memberVo.getUserId() %>';
	var rno;

	$(document).ready(function(){
		displayButton();
		// 댓글 조회
		commentList();
	});
	
	function displayButton() {
		// 로그인한 유저와 작성자의 아이디가 동일할 경우 수정, 삭제 버튼 활성화
		if (userId == $('#writerId').val()) {
			$('#btnUpdate').show();
			$('#btnDelete').show();
		}
	}
	
	function deleteBoard() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			document.form1.action = "/relay/board/delete";
			document.form1.submit();
		}
	}
	
	function updateBoard() {
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

		document.form1.action = "/relay/board/update";
		// 폼에 입력한 데이터를 서버로 전송
		document.form1.submit();
	}

	// 댓글 전체조회
	function commentList() {
		var bno = $("#bno").val();
		
		$.ajax({
			type: "GET",
			url: "/relay/comment/list/" + bno,
			dataType: 'json',
			success : function(data) {
				makeCommentHtml(data);
			}
		});
	}
	
	// 댓글 폼 만들기
	function makeCommentHtml(data) {
		var html = '';
		
		for (var row of data) {
			html += '<div class="comment-Print">';
			html += '<b class="comment-name">' +row['username']+ '</b><span class="comment-date"> ' + row['replydate'] + '</span><br>';
			html += '<div class="comment-content">' +row['reply']+ '</div>';
			
			// 본인이 작성한 댓글은 수정, 삭제 가능
			if (userId == row.userId) {
				html += '<button class="comment-update" data-rno='+row['rno']+' onclick="clickUpdate(this)">수정</button>';
				html += '<button class="comment-delete" data-rno='+row['rno']+' onclick="deleteComment(this)">삭제</button>';
			}
			html += '</div>';
		}
		
		// btnWrite 버튼에 작성이라는 문구 넣기
		$("#btnWrite").text('작성');
		// 댓글 입력창 비우기
		$("#inputComment").val('');
		// 댓글 폼에 위에서 만든 html 넣기
		$('#commentDiv').html(html);
	}
	
	// 댓글 작성
	function writeComment() {
		// 작성된 내용 가져오기
		var content = $('#inputComment').val();
		
		if (userId == '') {
			alert("로그인 후 이용할 수 있는 기능입니다.");
			return;
		} else if (content == '') {
			alert("내용을 입력하세요");
			$("#inputComment").focus();
			return;
		}
		
		var url = $("#btnWrite").text() == '작성' ? '/relay/comment/insert' : '/relay/comment/update';
		
		$.ajax({
			type: "POST",
			data: {
				rno: rno,
				bno: $("#bno").val(),
				reply: content,
				userId: userId
			},
			url: url,
			success : function(data) {
				commentList();
			}
		});
	}
	
	// 댓글 안의 수정 버튼 클릭할 때
	function clickUpdate(pThis) {
		$("#inputComment").val($(pThis).prev().text());
		$("#inputComment").focus();
		$("#btnWrite").text('수정');
		
		rno = pThis.getAttribute('data-rno');
	}
	
	// 댓글 삭제
	function deleteComment(pThis) {
		$.ajax({
			type: "POST",
			data: {
				rno: pThis.getAttribute('data-rno')
			},
			url: "/relay/comment/delete",
			success : function(data) {
				commentList();
			}
		});
	}
</script>
</head>
<body style="background: #FFFBF2">
	<!-- 카테고리 넣을 공간 -->
	<%@ include file="/WEB-INF/views/includes/mouse.jsp"%>
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<div style="text-align: center; margin-top: 43px;">
		<img style="width: 330px; margin-bottom: 55px"
			src="/resources/img/board/view_title.png" alt=""> <br />
		<br />
	</div>

	<form name="form1" method="post">
		<div style="text-align: center; font-size: 16pt">
			작성자 : <input class="view_writer01" name="writer" id="writer"
				value="${dto.username}" placeholder="이름" readonly>
		</div>

		<div
			style="text-align: center; padding: 5px; margin-left: auto; margin-right: auto; margin: 0 auto;">
			<img class="view_content"
				style="width: 1150px; margin-top: 10px; position: relative;"
				src="/resources/img/board/view_contents.png" alt=""> <br />
			<br />
		</div>

		<div class="view_input01"
			style="position: absolute; width: 100%; text-align: center; top: 418px; font-size: 16pt">
			제목 : <input class="view_input02" name="title" id="title" size="80"
				value="${dto.title}" placeholder="제목"> <br />
			<br /> <span class="relay_content""><b>여러분의 멋진 아이디어로 릴레이
					소설을 작성보세요!</b></span><br>
			<textarea class="view_input03" name="content" id="content" rows="4"
				cols="80" placeholder="">${dto.content}</textarea>
			<br />
			<br />
			<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
			<!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
			<div class="view_regdate"
				style="margin-top: 17px; font-family: 'SUITE-Regular' !important; font-size: 13pt;">
				작성일자 : <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss" />
			</div>
		</div>

		<div
			style="width: 350px; margin: 0 auto; text-align: center; margin-top: 29px;">
			<!-- 게시물번호를 hidden으로 처리 -->
			<input type="hidden" name="bno" id="bno" value="${dto.bno}">
			<input type="hidden" name="writerId" id="writerId" value="${dto.userId}">
			
			<button class="btn btn-outline-secondary btn_view01"
				style="border: 1px solid #A98B67; color: #A98B67; margin: 5px; margin-top: -15px; width: 75px; height: 50px; display:none"
				id="btnUpdate" onclick="updateBoard()">수정</button>
			<button class="btn btn-outline-secondary btn_view01"
				style="border: 1px solid #A98B67; color: #A98B67; margin: 5px; margin-top: -15px; width: 75px; height: 50px; display:none"
				id="btnDelete" onclick="deleteBoard()">삭제</button>
		</div>
	</form>

	<!-- 댓글 작성 부분 -->
	<div id="comment-write" class="comment-write">
		<input type="text" id="inputComment" class="comment-input" placeholder="댓글 추가">
		<button id="btnWrite" class="comment-write-btn btn_view02" onclick="writeComment()"></button>
	</div>

	<!-- 댓글 출력 부분 -->
	<div id="commentDiv"></div>
	
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>