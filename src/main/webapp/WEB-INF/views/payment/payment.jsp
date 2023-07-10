<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" href="/resources/css/payment/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/payment/sj_payment.css">
<link rel="stylesheet" href="/resources/css/hs_css/style.css">
<script type="text/javascript">

function fn_buy() {
	var IMP = window.IMP;
	IMP.init('imp32628153'); 
	
	var quantity = parseInt($("#quantity").val()); // 티켓 수량 가져오기
	var totalAmount = 18000 * quantity; // 총 결제 금액 계산
	
	// IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({
		pg: 'html5_inicis',
		pay_method: 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : 'M:美 티켓',
		amount : totalAmount,
		buyer_email : 'XXXX@naver.com',
		buyer_name : 'XXX님',
		buyer_tel : '010-1234-5678',
		buyer_addr : '서울특별시 강남구 신사동 가로수길',
		buyer_postcode : '123-456',
		m_redirect_url : '/paymentSuccess.do'
	}, function(rsp) {  // callback
		
		if ( rsp.success ) {
			var paymentInfo = {
				imp_uid : rsp.imp_uid,
				merchant_uid : rsp.merchant_uid,
				paid_amount : rsp.paid_amount,
				apply_num : rsp.apply_num,
				paid_at : new Date()
			};
			
			$.ajax({
				url : "/paymentProcess.do",
				method : "post",
				contentType : "application/json",
				data : JSON.stringify(paymentInfo),
				success:function(data, textStatus){
					console.log(paymentInfo);
					location.href = "/paymentSuccess.do?apply_num=" + rsp.apply_num + "&paid_amount=" + rsp.paid_amount;
				},
				error : function(e) {
					console.log(e);
				}			
			});		
		
		} else {
			alert("결제가 실패되었습니다! : " + rsp.error_msg)
		}
	});	
}


</script>

</head>
<body>
	  <div class="row">
        <div class="logo_form">
            <img src="/resources/img/sj_img/logo.png" class="logo_img">
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
                        <a href="/">COMMUNITY</a>
                        <ul class="dropdown">
                            <li><a href="/">Notice</a></li>
                            <li><a href="">FAQ</a></li>
                            <li><a href="">Q&A</a></li>
                        </ul>
                    </li>
                    <li><a href="">PLAY</a></li>
                    <li><a href="">LOGIN</a></li>
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
        <div class="col-7">
        	<img src="/resources/img/sj_img/payment.svg" class="pay_img">
        </div>
        <div class="col-5">
            <h1 class="title_pay">PAYMENT</h1>
            <fieldset class="ticket_form">
                <legend class="tk_legend">TICKET</legend>
                <div class="quantity_form">
                    <span class="q_text">수량</span>
                    <input type="number" id="quantity" value="1"><br><br>
                </div>
               <button type="button" class="button button--moema button--border-thick" onclick="fn_buy()">결제하기</button>
            </fieldset>
	    </div>
	   </div>

</body>
</html> 