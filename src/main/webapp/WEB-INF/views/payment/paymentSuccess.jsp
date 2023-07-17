<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<link rel="stylesheet" href="/resources/css/payment/payment.css">
<link rel="stylesheet" href="/resources/css/payment/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/payment/style2.css">
<title></title>
</head>
<body>

  <div class="row">
        <div class="logo_form">
        <a href="main.jsp"><img src="/resources/img/sj_img/logo.svg" class="logo_img" style="width: 125px;"></a>
          <!-- 햄버거 토글 시작 -->
                <span class="site-mobile-menu site-navbar-target">
                    <div class="site-mobile-menu-header">
                        <div class="site-mobile-menu-close">
                            <span class="js-menu-toggle"></span>
                        </div>
                    </div>
                    <div class="site-mobile-menu-body"></div>
                </span>

              <ul class="js-clone-nav d-none d-lg-inline-noone text-left ">
                    <li><span class="sad">홈</span></li>
                    <li class="has-children">
                        <a href="#">ABOUT</a>
                        <ul class="dropdown">
                            <li><a href="/" class="chlid-menu">Mmuseum</a></li>
                            <li><a href="/">Map</a></li>
                        </ul>
                    </li>
                    <li><a href="/">EXHIBITION</a></li>
                    <li class="has-children">
                        <a href="/notice/list">COMMUNITY</a>
                        <ul class="dropdown">
                            <li><a href="/notice/list">Notice</a></li>
                            <li><a href="">FAQ</a></li>
                            <li><a href="">Q&A</a></li>
                            <li><a href="/review/list">Review</a></li>
                        </ul>
                    </li>
                    <li><a href="/relay/board/list">PLAY</a></li>
                    <c:if test="${member == null}"><li><a href="/member/login">LOGIN</a></li></c:if>
                    <c:if test="${member != null}"> <!-- 로긴이 되어있다면 -->
                      <li><a id="btnlogout">LOGOUT</a></li>
                    </c:if>
                </ul>
                
                 <a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-block"
                    data-toggle="collapse" data-target="#main-navbar">
                    <span></span>
                </a>

    			<script src="/resources/js/hs_js/jquery-3.5.1.min.js"></script>
   				<script src="/resources/js/hs_js/bootstrap.min.js"></script>
                <script src="/resources/js/hs_js/aos.js"></script>
    			<script src="/resources/js/hs_js/custom.js"></script>
    			 <!-- 햄버거 토글 끝 -->
    	</div>
        </div>
        
        
        
        <div class="left_form">
        <img src="/resources/img/sj_img/payment.svg" class="pay_img">
        </div>
        <div class="right_form">
            <span class="title_pay">PAYMENT</span>
            <fieldset class="ticket_form">
                <legend class="tk_legend">TICKET</legend>
                <div class="success_form">
                
	               <%-- 사용자 이름 가져오기 --%>
	    			<% String userName = request.getParameter("userName"); %>
	               <%-- 사용자 이름 출력 --%>
			   	 	<% if (userName != null && !userName.isEmpty()) { %>
			        <div class="pay_name"><%= userName %> 님</div>
			   	 	<% } %>                
                <hr class="line">
                 <span class="success_text">결제가 완료되었습니다.</span>
                 
                    
    
    <%
    String applyNum = request.getParameter("apply_num"); // apply_num 파라미터 추출
    String paidAmount = request.getParameter("paid_amount"); // paid_amount 파라미터 추출
    
    if (applyNum != null) {
        // apply_num 값이 있다면 출력
        %>
   
        <div class="pay_info"> 주문번호: <%= applyNum %></div>
        <%
    }
    if (paidAmount != null) {
        // paid_amount 값이 있다면 출력
        %>
        <div class="pay_info">결제금액: <%= paidAmount %> 원</div>
        <%
    }
    %>
    	<div>
    	 	<img src="/resources/img/sj_img/bacord.svg" class="bacord_img">
    	</div>
    			</div>
           </fieldset>
           <div class="notice"> * 티켓 결제일 30일 이내에 사용바랍니다.</div>
       </div>
    


<script type="text/javascript">

$(document).ready(function(){

   $("#btnlogout").click(function(){
      $.ajax({
         type:"POST",
         url:"/member/logout",
         success:function(data){
            document.location.reload(); //다시 화면 로드
         }
      }); //ajax end
   });
});
</script>
</body>
<%@ include file="../includes/footer.jsp" %>
</html>