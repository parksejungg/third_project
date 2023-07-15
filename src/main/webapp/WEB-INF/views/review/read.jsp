<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/hs_css/buttons.css">
<link rel="stylesheet" href="/resources/css/hs_css/noticeRead.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/mouse.jsp" %>

                <div class="frameWrap">
                    <div class="bodyText must">Read</div>
                    <div class="n1">
	                    <input type="text" name="title" readonly="readonly" value='<c:out value="${read.title}"/>' >
                    </div>
                    <div class="n2">
                   	<input type="text" name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${read.updatedate}"/>' >
                    <input type="text"name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${read.regdate}"/>' >
                    <input type="text" name="writer" readonly="readonly" value='<c:out value="${read.writer}"/>' >
                    </div>
                    <div class="n3">
                        <textarea row="50" name="content" readonly="readonly"><c:out value="${read.content}"/></textarea>
                    </div>
                    <div class="n4">
                        <a id="list_btn" href="/notice/list" class="button button--ujarak button--border-thin button--text-thick btnRegister">이전</a>
                        <a id="modify_btn" href="/noitce/modify?bno=${read.bno}" class="button button--ujarak button--border-thin button--text-thick btnRegister">수정</a>
                        <a id="delete_btn" class="button button--ujarak button--border-thin button--text-thick btnRegister">삭제</a>
                        <a
                            class="button button--ujarak button--border-thin button--text-thick btnRegister">수정</a>
                        <a
                            class="button button--ujarak button--border-thin button--text-thick btnRegister">삭제</a>
                    </div>
                </div>
                
<%-- <h1>조회 페이지</h1>
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bno" readonly="readonly" value='<c:out value="${read.bno}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" readonly="readonly" value='<c:out value="${read.title}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content" readonly="readonly"><c:out value="${read.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" value='<c:out value="${read.writer}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${read.regdate}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 수정일</label>
		<input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${read.updatedate}"/>' >
	</div>		
	<div class="btn_wrap">
		 <a class="btn" id="list_btn" href="/notice/list">뒤로가기</a> 
         <a class="btn" id="modify_btn" href="/noitce/modify?bno=${read.bno}">수정</a>
         <a class="btn" id="delete_btn">삭제</a>
	</div>
	<form id="infoForm" action="/notice/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${read.bno}"/>'>
	</form>
	 --%>
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/review/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/review/modify");
		form.submit();
	});	
	
	
	$("#delete_btn").on("click", function(e){
	    form.attr("action", "/review/delete");
	    form.attr("method", "post");
	    form.submit();
	});
</script>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>