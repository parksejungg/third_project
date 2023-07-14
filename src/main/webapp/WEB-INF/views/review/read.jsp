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
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/review_css/write.css">
</head>
<body>
<%@ include file="../includes/header.jsp" %>
		
		<div class="reviewimg">
            <img src="/resources/img/review_img/reviewmain.png" alt="리뷰메인">
        </div>

	<div class="container">
     <div>
        <h2 class="main_title">EDIT</h2>


        <div class="write_form">
		  <input name="title" class="title_form" readonly="readonly" value='<c:out value="${read.title}"/>' >
          </input>
          <hr class="line_form">
          <textarea name="content" class="content_form" readonly="readonly"><c:out value="${read.content}"/></textarea>
        </div>


        <div class="writer_form">
            <span class="writer_span2">작성자</span>
            <input class="writer_input" name="writer" readonly="readonly" value='<c:out value="${read.writer}"/>'>
        </div>

        <div class="writer_form">
            <span class="writer_span">등록일자</span>
            <input class="writer_input" name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${read.regdate}"/>' >
        </div>

        <div class="writer_form">
            <span class="writer_span">수정일자</span>
            <input class="writer_input" name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${read.updatedate}"/>' >
        </div>

        <div class="btn_form">
            <button class="submit_btn" id="modify_btn" onclick="location.href='/review/modify?bno=${read.bno}'">수정</button>
            <button class="cancel_btn" id="delete_btn">삭제</button>
        </div> 
          
      </div>
   </div>
	<form id="infoForm" action="/review/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${read.bno}"/>'>
	</form>
	
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