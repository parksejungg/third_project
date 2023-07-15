<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script>
function goBack() {
	window.location.href = "/review/list";
}
</script>
<link rel="stylesheet" href="/resources/css/review_css/write.css">
</head>
<body>
<%@ include file="../includes/mouse.jsp" %>
<%@ include file="../includes/header.jsp" %>
 <div class="reviewimg">
      <a href="main.jsp"><img src="/resources/img/review_img/reviewmain.png" alt="리뷰메인"></a>
 </div>
 
<form action="/review/insert" method="post">
	 <div class="container">
        <div>
            <h2 class="main_title">WRITE</h2>
            <div class="write_form">
               <input name="title" class="title_form" placeholder="제목을 입력하세요">
               </input>
               <hr class="line_form">
               <textarea name="content" class="content_form" placeholder="내용을 입력하세요" ></textarea>
             
            </div>
              
            <div class="insert_form">
                <span class="writer_span">작성자</span>
                <input class="writer_input" name="writer">
            
            </div>

            <div class="btn_form">
                <button class="submit_btn">등록</button>
                <button class="cancel_btn" type="button" onclick="goBack()">취소</button>
            </div>    
        </div>
    </div> 
</form>

<%@ include file="../includes/footer.jsp" %>
</body>
</html>