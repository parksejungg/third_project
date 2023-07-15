<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/view.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>게시글 작성</title>

<style type="text/css">
    input:focus {outline: none;} 
    textarea:focus {outline: none;}
    
    button:hover {
    	background: #FAF5EB !important;
    	color: #994D22 !important;
    	border: 1px solid #994D22 !important;
    }
</style>

<!-- sts에서 jquery 사용 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 헤더 넣을 공간 -->
<script>
   	 	// "취소" 버튼을 클릭했을 때 호출되는 함수
	    function btnreset() {
	      if (confirm("작성한 내용이 저장되지 않을 수 있습니다. \n정말로 취소하시겠습니까?")) {
	        window.history.back(); // 이전 페이지로 돌아감
	      }
	    }
   	 	
    $(document).ready(function(){
        $("#btnDelete").click(function(){
            if(confirm("정말로 삭제하시겠습니까?")){
                document.form1.action = "${path}/board/delete.do";
                document.form1.submit();
            }
        });
        
        $("#btnUpdete").click(function(){
            //var title = document.form1.title.value; ==> name속성으로 처리할 경우
            //var content = document.form1.content.value;
            //var writer = document.form1.writer.value;
            var title = $("#title").val();
            var content = $("#content").val();
            var writer = $("#writer").val();
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                document.form1.content.focus();
                return;
            }
            if(writer == ""){
                alert("이름을 입력하세요");
                document.form1.writer.focus();
                return;
            }
            document.form1.action="${path}/board/update.do"
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
        });
    });
    
	// 댓글 기능
    function commentWrite() {
      //var writer = document.getElementById("commentWriter").value;
      var contents = document.getElementById("commentContents").value;
      
      //if(title == ""){
      //    alert("작성자를 입력하세요");
      //    document. .writer.focus();
      //    return;
      //}
      if(content == ""){
          alert("내용을 입력하세요");
          //document. .contents.focus();
          return;
      }
      
      //console.log("작성자: ", writer);
      console.log("내용: ", contents);
    }


</script>
</head>
<body style="background: #FFFBF2">
<!-- 카테고리 넣을 공간 -->
 <%@ include file="/WEB-INF/views/includes/mouse.jsp" %>
      <%@ include file="/WEB-INF/views/includes/header.jsp" %>
<div style="text-align: center; margin-top: 43px;">
	<img style="width: 330px; margin-bottom: 55px" src="../resources/img/board/view_title.png" alt=""> <br /><br />
</div>

<form name="form1" method="post">
	<div style="text-align: center; font-size: 16pt">
	       작성자 : <input class="view_writer01" name="writer" id="writer" value="${dto.writer}" placeholder="이름">
	</div>
	
	<div style="text-align: center; padding: 5px; margin-left: auto; margin-right: auto; margin: 0 auto;">
		<img class="view_content" style="width: 1150px; margin-top: 10px; position: relative;" src="../resources/img/board/view_contents.png" alt=""> <br /><br />
	</div>
	
		<div class="view_input01" style="position: absolute; width: 100%; text-align: center; top: 418px; font-size: 16pt">
	              제목 : <input class="view_input02" name="title" id="title" size="80" value="${dto.title}" placeholder="제목"> <br /><br />
	              			  		 
           <span class="relay_content""><b>여러분의 멋진 아이디어로 릴레이 소설을 작성보세요!</b></span><br>
           <textarea class="view_input03" name="content" id="content" rows="4" cols="80" placeholder="">${dto.content}</textarea> <br /><br />
		         <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
	             <!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
		   <div class="view_regdate" style="margin-top: 17px; font-family: 'SUITE-Regular' !important; font-size: 13pt;">작성일자 : <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/></div>
	    </div>
	
	<div style="width: 350px; margin: 0 auto; text-align: center; margin-top: 29px;">
	    <!-- 게시물번호를 hidden으로 처리 -->
	    <input type="hidden" name="bno" value="${dto.bno}">
	    <button class="btn btn-outline-secondary btn_view01" style="border: 1px solid #A98B67; color: #A98B67;  margin: 5px; margin-top: -15px; width: 75px; height: 50px;" type="button" id="btnDelete">삭제</button>
	    <button class="btn btn-outline-secondary btn_view01" style="border: 1px solid #A98B67; color: #A98B67;  margin: 5px; margin-top: -15px; width: 75px; height: 50px;" type="button" id="btnUpdete">수정</button>
	    <button class="btn btn-outline-secondary btn_view01" style="border: 1px solid #A98B67; color: #A98B67;  margin: 5px; margin-top: -15px; width: 75px; height: 50px;" type="button" onclick="btnreset()">취소</button>
	</div>
</form>


<!-- 댓글 작성 부분 -->
	<div id="comment-write" class="comment-write">
		<h4 class="comment-write-title">익명 댓글 남기기</h4>
		<!-- <input type="text" id="commentWriter" class="comment-input" placeholder="작성자"> -->
		<input type="text" id="commentContents" class="comment-input" placeholder="댓글 추가.."><br>
		<button id="comment-write-btn" class="comment-write-btn btn_view02" onclick="commentWrite()">댓글작성</button>
	</div>

<!-- 댓글 출력 부분 -->
   <%@ include file="/WEB-INF/views/includes/footer.jsp" %>

</body>
</html>