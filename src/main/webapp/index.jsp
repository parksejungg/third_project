<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>render</title>
<link rel="stylesheet" href="/resources/css/hs_css/render.css">
<link rel="stylesheet" href="/resources/css/hs_css/bootstrap_min.css">
<link rel="stylesheet" href="/resources/css/hs_css/rbutton.css">
</head>
<script>
    window.addEventListener('load', function () {
        var rcanvas = document.getElementById('rcanvas');
        rcanvas.classList.remove('fade-out');
    });
</script>
<body>
    <div class="wrapAll">
        <div class="test">
            <img src="/resources/img/hs_img/rlogo.svg" alt="로고">
            <div class="textpart">
                <div class="realtext">A PLACE WHERE EVERYONE<br>
                    CAN MAKE ART<br>
                </div>
                <a href="/main.jsp"><input type="button" class="button button--ujarak button--border-thin button--text-thick"
                        value="Entry Museum"></a>
            </div>
        </div>

        <canvas id="backcanvas" class="backcanvas"> </canvas>
        <canvas id="rcanvas" class="rcanvas fade-out"> </canvas>
        <script src="/resources/js/hs_js/render.js"></script>
    </div>
</body>
</html>