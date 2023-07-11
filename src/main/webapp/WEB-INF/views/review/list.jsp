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
</head>
<body>

<div>
	<a href="/review/insert">게시판 등록</a>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="list">
			<tr>
				<td><c:out value="${list.bno}"/></td>
				<td>
					<a class="move" href='<c:out value="${list.bno}"/>'>
				        <c:out value="${list.title}"/>
				    </a>
                </td>
				<td><c:out value="${list.content}"/></td>
				<td><c:out value="${list.writer}"/></td>
				<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updatedate}"/></td>
			</tr>
		</c:forEach>
	</table>
	
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
				alert("글 등록이 완료되었습니다!");
			}
		    if(result === "modify success"){
	            alert("수정이 완료되었습니다.");
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


</body>
</html>