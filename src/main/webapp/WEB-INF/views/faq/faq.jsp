<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/js.css/FAQ.css">
    <title>M:美</title>
</head>
<body>
<%@ include file="/WEB-INF/views/includes/mouse.jsp" %>
      <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    
		<div class="about">
		   <a class="bg_links social portfolio" href="https://www.rafaelalucas.com" target="_blank">
		      <span class="icon"></span>
		   </a>
		   <a class="bg_links social dribbble" href="https://dribbble.com/rafaelalucas" target="_blank">
		      <span class="icon"></span>
		   </a>
		   <a class="bg_links social linkedin" href="https://www.linkedin.com/in/rafaelalucas/" target="_blank">
		      <span class="icon"></span>
		   </a>
		</div>
		<!-- end about -->
		<div class="category">
            FAQ
        </div>
		<div class="acc_form">
		   <ul class="accordion">
		      <li class="item">
		         <h2 class="accordionTitle">티켓은 언제 발급되나요? <span class="accIcon"></span></h2>
		         <div class="text">결제 즉시 계정에 큐알코드가 발급됩니다. 앱을 설치하시고 입장 때 직원에게 보여주시면 됩니다.<br> </div>
		      </li>
		      <li class="item">
		         <h2 class="accordionTitle">전시 요청은 어디로 하나요? <span class="accIcon"></span></h2>
		         <div class="text">자신의 작품 전시 요청은 M:美로 메일을 보내주세요.<br>
                        <u>MeMuseum@mnart.com</u><br>
                 </div>
		      </li>
		      <li class="item">
		         <h2 class="accordionTitle">티켓 환불 기간은 언제까지인가요? <span class="accIcon"></span></h2>
		         <div class="text">8월 30일 오후 5시 이전에 사용하지 않았을 경우 환불이 가능합니다.<br></div>
		      </li>
		      <li class="item">
		         <h2 class="accordionTitle">이벤트에 당첨되었는데 어디로 연락해야되나요? <span class="accIcon"></span></h2>
		         <div class="text">이벤트 당첨 이후 한 달 이내에 당첨자 확인, 주소 확정을 위하여 연락이 갑니다.<br></div>
		      </li>
		   </ul>
		   <div class="toQnA">더 궁금하신 사항은 <a href="#">QnA게시판</a>을 이용해주세요.</div>
    	</div>
    <script src="/resources/js/js.js/accordion.js"></script>
</body>
</html>
