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
<script>
function goBack() {
  history.back();
}
</script>
<link rel="stylesheet" href="/resources/css/review_css/write.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
   <%@ include file="../includes/header.jsp" %>
		
		<div class="reviewimg">
            <img src="/resources/img/review_img/reviewmain.png" alt="리뷰메인">
        </div>

	<div class="container">
     <div>
        <h2 class="main_title">EDIT</h2>
        
        <form id="modifyForm" action="/review/modify" method="post">
        <input name="bno" type="hidden" readonly="readonly" value='<c:out value="${modify.bno}"/>' >
        <div class="write_form">
		  <input name="title" class="title_form" value='<c:out value="${modify.title}"/>' >
          </input>
          <hr class="line_form">
          <textarea name="content" class="content_form"><c:out value="${modify.content}"/></textarea>
        </div>


        <div class="writer_form">
            <span class="writer_span2">작성자</span>
            <input class="writer_input" name="writer" readonly="readonly" value='<c:out value="${modify.writer}"/>' >
        </div>

        <div class="writer_form">
            <span class="writer_span">등록일자</span>
            <input class="writer_input" name="regdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${modify.regdate}"/>' >
        </div>

        <div class="writer_form">
            <span class="writer_span">수정일자</span>
            <input class="writer_input" name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${modify.updatedate}"/>' >
        </div>

        <div class="btn_form">
            <button class="submit_btn" id="modify_btn">수정완료</button>
            <button class="cancel_btn" id="cancel_btn" type="button" onclick="goBack()">취소</button>
        </div> 
        </form> 
        
	   	<form id="infoForm" action="/review/modify" method="get">
	        <input type="hidden" id="bno" name="bno" value='<c:out value="${modify.bno}"/>'>
	    </form>
    
      </div>
   </div>

   

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
<%@ include file="../includes/footer.jsp" %>
</body>
</html>