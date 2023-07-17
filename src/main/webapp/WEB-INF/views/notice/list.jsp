<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/js.css/notice.css">
    <script
  src="https://code.jquery.com/jquery-3.4.1.js"></script>
 <link rel="shortcut icon" href="/resources/img/ej_img/logoimg.ico">
    <title>M:美</title>
</head>
<body>
<%@ include file="/WEB-INF/views/includes/mouse.jsp" %>
      <%@ include file="/WEB-INF/views/includes/header.jsp" %>
      
      <div class="bodyTop">
                <div class="category">NOTICE</div>
     </div>
    <div class="entire">
        <div class="N_content">
            <div class="N_post_L">
                <div class="N_post_1">
                    <div class="N_post_1L">
                        <span class="post1L_title">
                            <b>리뉴얼 공사 안내</b>
                        </span>
                        <hr>
                        <span class="post1L_content">
                            환경정비를 위해<br>리뉴얼 공사가 7.3.(월)부터<br>7.28.(금)까지 진행됩니다.
                        </span>
                    </div>
                    <div class="N_post_1R">
                        <img src="/resources/img/js_img/생타드레스의해변.jpg" class="post1R_img">
                    </div>
                </div>
                <div class="N_post_2">
                    <span class="post2_title">
                        <b>작품 관람 제한 안내</b>
                    </span>
                    <hr>
                    <span class="post2_content">
                        8월 13일(목) 10시~13시<br>교육 운영으로 인해 작품 관람이 제한됩니다.<br>
                        관람객 여러분의 깊은 양해 부탁드립니다.
                    </span>
                </div>
            </div>
            <div class="N_post_R">
                <img src="/resources/img/js_img/postBG.png" class="postBG">
                <div class="N_postR_content">
                    <span class="postR_title">
                        <b>M:美 축제 안내</b>
                    </span>
                    <hr>
                    <span class="postR_content">
                        2023년 M:美가 개관 10년을 맞이하여<br>다채로운 프로그램과 모두가 참여하는<br>축제 한마당이 펼쳐집니다.<br><br>
                        5월 31일(수) :<br> M:美와 함께하는 영화상영<br><br>
                        11월 10일(금)-11일(토) :<br> 새로운 10년, 내일을 시작하는 페스티벌<br>
                        올 한해 펼쳐지는 ‹M:美 10 축제›<br><br>
                        많은 참여 부탁드립니다.
                    </span>
                </div>
            </div>
        </div>
        
        <!-- 아래 공지사항 목록 뜰것임 -->
        
         <c:if test="${member != null && member.adminCheck == 1}"> <!-- 로긴이 되어있다면 -->
	        <a href="/notice/insert">글쓰기</a>
         </c:if>
 	
 	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>
					<c:out value="${list.bno}" />
				</td>
				<td>							
					<a class="move" href="<c:out value="${list.bno}" />">
						<c:out value="${list.title}" />
					</a>
				</td>
				<td>
					<c:out value="${list.writer}" />
				</td>
				<td>
					<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" />
				</td>
				<td>
					<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" /> 
				</td>
			</tr>
		</c:forEach>
	</table>
 
	   <form id="moveForm" method="get">    
    	</form>
        
        <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
    </div>
    
    <script>
	$(document).ready(function() {
		
		let result = '<c:out value="${result}"/>';
		
		checkAlert(result);
		
		function checkAlert(result) {
			
			if(result === ''){
				return;
			}
			if(result === "insert success"){
				alert("글 등록이 완료되었습니다.");
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
        moveForm.attr("action", "/notice/read");
        moveForm.submit();
    });
    
 
</script>
</body>
</html>
