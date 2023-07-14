<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/write.css" rel="stylesheet" type="text/css">
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
<!-- 헤더 넣을 공간 -->
<script>
	 // "취소" 버튼을 클릭했을 때 호출되는 함수
	    function btnreset() {
	      if (confirm("작성한 내용이 저장되지 않을 수 있습니다. \n정말로 취소하시겠습니까?")) {
	        window.history.back(); // 이전 페이지로 돌아감
	      }
	    }

    $(document).ready(function(){
        $("#btnSave").click(function(){
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
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
        });
    });
</script>
</head>
<body style="background: #FFFBF2">
 <%@ include file="/WEB-INF/views/includes/mouse.jsp" %>
      <%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!-- 카테고리 넣을 공간 -->

<div style="text-align: center; margin-top: 40px;">
	<img style="width: 400px; margin-bottom: 55px; " src="../resources/img/board/view_title.png" alt=""> <br /><br />
</div>

<form name="form1" method="post" action="${path}/board/insert.do">
	<div style="text-align: center; font-size: 16pt">
	       작성자 : <input class="writer_writer01" name="writer" id="writer"  placeholder="이름">
	</div>
	
	<div style="text-align: center; padding: 5px; margin-left: auto; margin-right: auto; margin: 0 auto;">
		<img class="write_content" style="width: 1150px; margin-top: 10px; position: relative;" src="../resources/img/board/view_contents.png" alt=""> <br /><br />
	</div>
	
	   <div  class="write_input01" style="position: absolute; width: 100%; text-align: center; top: 292px; font-size: 16pt">
	              제목 : <input class="write_input02" name="title" id="title" size="80" placeholder="제목"> <br /><br />
	         <span class="relay_content""><b>여러분의 멋진 아이디어로 릴레이 소설을 작성보세요!</b></span><br>
	         <textarea class="write_input03" name="content" id="content" rows="4" cols="80" placeholder=""></textarea> <br /><br />
	    </div>

	<div style="width:650px; margin: 0 auto; text-align: center;">
	    <!-- 게시물번호를 hidden으로 처리 -->
	    <button class="btn btn-outline-secondary" style="border: 1px solid #A98B67; color: #A98B67; margin: 5px; margin-top: -15px; width: 83px; height: 40px;" type="button" id="btnSave">등록</button>
	    <button class="btn btn-outline-secondary" style="border: 1px solid #A98B67; color: #A98B67; margin: 5px; margin-top: -15px; width: 83px; height: 40px;" type="button" onclick="btnreset()">취소</button>
	</div>
</form>

   <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>
