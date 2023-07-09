<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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

<div>
	<a href="/review/insert">게시판 등록</a>
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
				alert("글 등록이 완료되었습니다!");
			}
		}
		
	});
 
</script>


</body>
</html>