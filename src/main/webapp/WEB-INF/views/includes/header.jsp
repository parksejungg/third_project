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
    <title>Main_shop</title>
    <link rel="stylesheet" href="/resources/css/hs_css/bootstrap_min.css">
    <link rel="stylesheet" href="/resources/css/hs_css/style.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<body>
   <div class="container1">
        <div class="wrapAll">
            <div class="header">
                <a href="/main.jsp"><img src="/resources/img/hs_img/logo.svg" alt="로고"></a>
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
                    <li class="has-children">
                        MYINFO
                        <ul class="dropdown">
                            <li><a href="#">Info</a></li>
                      <li><a id="btnlogout">Logout</a></li>
                      <!-- <li><a href="/member/logout" id="btnlogout">logout</a></li> -->
                        </ul>
                    </li>
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
            </div>
        </div>
      </div>
</body>

<script type="text/javascript">

$(document).ready(function(){

   $("#btnlogout").click(function(){
      $.ajax({
         type:"POST",
         url:"member/logout",
         success:function(data){
            document.location.reload(); //다시 화면 로드
         }
      }); //ajax end
   });
});
</script>