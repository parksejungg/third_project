<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<link rel="stylesheet" href="/resources/css/review_css/list.css">
</head>
<body>
<%@ include file="../includes/header.jsp" %>
      <div class="reviewimg">
         <img src="/resources/img/review_img/reviewmain.png" alt="리뷰메인">
      </div>
      <div>
         <div class="rvsection">
            <div class="rvbanner">
               <div class="rvtext01">CLAUDE MONET </div><br>
               <div class="rvtext02">전시회 방문 후기를 남겨주세요!</div>
                  
               <div class="rvboder">
                  <img src="/resources/img/review_img/reviewimg.png" alt="리뷰이미지">
               </div>
            </div>
         </div>
               <button class="insertbtn" onclick="location.href='/review/insert'">등록</button><br>
            <div class="formcontainer">
               <c:forEach var="item" items="${list}">
               <div class="write_form">
                  <a class="move" href='<c:out value="${item.bno}"/>'><input name="title" class="title_form" readonly="readonly" value="${item.title}"></a>
                  <hr class="line_form">
                  <textarea name="content" class="content_form" readonly="readonly">${item.content}</textarea>
               </div>
               </c:forEach>
            </div>
       
         <form id="moveForm" method="get">    
          </form>
      
      </div>

<script>
   $(document).ready(function() {
      
      let result = '<c:out value="${result}"/>';
      
      checkAlert(result);
      
      function checkAlert(result) {
         
         if(result === ''){
            return;
         }
         if(result === "insert Success"){
            alert("등록이 완료되었습니다.");
         }
          if(result === "modify success"){
               alert("수정이 완료되었습니다.");
           }
          if(result === "delete success"){
               alert("삭제가 완료되었습니다.");
           }
      }
      
   });
   
   
    let moveForm = $("#moveForm");
    
    $(".move").on("click", function(e){
        e.preventDefault();
        
        moveForm.empty();
        moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "/review/read");
        moveForm.submit();
    });
 
</script>

<%@ include file="../includes/footer.jsp" %>
<%@ include file="../includes/mouse.jsp" %>

</body>
</html>