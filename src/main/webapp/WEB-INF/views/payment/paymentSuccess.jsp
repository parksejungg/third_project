<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
</head>
<body>

  ※ 결제가 정상적으로 되었습니다.
    <br>
    <%
    String applyNum = request.getParameter("apply_num"); // apply_num 파라미터 추출
    String paidAmount = request.getParameter("paid_amount"); // paid_amount 파라미터 추출
    if (applyNum != null) {
        // apply_num 값이 있다면 출력
        %>
        	윤여진님 주문이 정상적으로 처리 되었습니다.
        <p> 주문번호: <%= applyNum %></p>
        <%
    }
    if (paidAmount != null) {
        // paid_amount 값이 있다면 출력
        %>
        <p>결제금액: <%= paidAmount %></p>
        <%
    }
    %>
    <a href="/">[처음으로]</a>

</body>
</html>