<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<h1>조회 페이지</h1>
<form id="modifyForm" action="/review/modify" method="post">
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bno" readonly="readonly" value='<c:out value="${modify.bno}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" value='<c:out value="${modify.title}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content"><c:out value="${modify.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" value='<c:out value="${modify.writer}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${modify.regdate}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 수정일</label>
		<input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${modify.updatedate}"/>' >
	</div>		
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a> 
        <a class="btn" id="modify_btn">수정 완료</a>
        <a class="btn" id="cancel_btn">취소</a>
       
	</div>
	</form>
	
	<form id="infoForm" action="/review/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${modify.bno}"/>'>
	</form>
<script>
		let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
		let mForm = $("#modifyForm");    // 페이지 데이터 수정 form
		
		/* 목록 페이지 이동 버튼 */
		$("#list_btn").on("click", function(e){
		    form.find("#bno").remove();
		    form.attr("action", "/review/list");
		    form.submit();
		});
		
		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e){
		    mForm.submit();
		});
		
		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e){
		    form.attr("action", "/review/read");
		    form.submit();
		});
		
		
		
</script>	

</body>
</html>