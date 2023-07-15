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
<title></title>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<link rel="stylesheet" href="/resources/css/payment/payment.css">
<link rel="stylesheet" href="/resources/css/payment/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/payment/style2.css">
<script type="text/javascript">
function fn_buy() {
    var IMP = window.IMP;
    IMP.init('imp32628153');
    
    var quantity = parseInt($("#quantity").val()); // 티켓 수량 가져오기
    var totalAmount = 18000 * quantity; // 총 결제 금액 계산
    var userName = ""; // 사용자 이름 초기화
    
    // Check if the user is logged in
    $.ajax({
        url: '/member/checkLogin',
        type: 'GET',
        success: function(response) {
            if (response === 'true') {
                userName = '${member.userName}'; // 사용자 이름 가져오기
                
                // IMP.request_pay(param, callback) 결제창 호출
                IMP.request_pay({
                    pg: 'html5_inicis',
                    pay_method: 'card',
                    merchant_uid: 'merchant_' + new Date().getTime(),
                    name: 'M:美 티켓',
                    amount: totalAmount,
                    buyer_email: '',
                    buyer_name: userName,
                    buyer_tel: '010-1234-5678',
                    buyer_addr: '서울특별시 강남구 신사동 가로수길',
                    buyer_postcode: '123-456',
                    m_redirect_url: location.origin + '/paymentSuccess.do'
                }, function(rsp) {  // callback
                    if (rsp.success) {
                        var paymentInfo = {
                            imp_uid: rsp.imp_uid,
                            merchant_uid: rsp.merchant_uid,
                            paid_amount: rsp.paid_amount,
                            apply_num: rsp.apply_num,
                            paid_at: new Date()
                        };
                        $.ajax({
                            url: "/paymentProcess.do",
                            method: "post",
                            contentType: "application/json",
                            data: JSON.stringify(paymentInfo),
                            success:function(data, textStatus){
                                console.log(paymentInfo);
                                location.href = "/paymentSuccess.do?apply_num=" + rsp.apply_num + "&paid_amount=" + rsp.paid_amount + "&userName=" + encodeURIComponent(userName);
                            },
                            error : function(e) {
                                console.log(e);
                            }
                        });
                    } else {
                        alert("결제가 실패되었습니다! : " + rsp.error_msg);
                    }
                });
            } else {
                alert('로그인 후에 결제할 수 있습니다. 로그인해 주세요.'); // 알림 메시지 표시
                location.href = "/member/login"; // 로그인 페이지로 이동
            }
        },
        error: function(e) {
            console.log(e);
        }
    });
}

</script>

</head>
<body>

	  <div class="row">
        <div class="logo_form">
         <a href="main.jsp"><img src="/resources/img/sj_img/logo.svg" class="logo_img"></a>
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
                    <li><a href="/board/list">PLAY</a></li>
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
                <div class="quantity_form">
                    <span class="q_text">수량</span>
                    <input type="number" id="quantity" value="1"><br><br>
                </div>
               <button type="button" class="button button--moema button--border-thick" onclick="fn_buy()">결제하기</button>
            </fieldset>
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

<%@ include file="../includes/mouse.jsp" %>
<%@ include file="../includes/footer.jsp" %>

</body>
</html> 