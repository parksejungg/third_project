<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/css/ej_css/main.css">  
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script>
    
        $(document).ready(function() {
            // 마우스 포인터 시작
            var cursor = $(".cursor"),
                follower = $(".cursor__inner");

            var posX = 0,
                posY = 0,
                mouseX = 0,
                mouseY = 0;

            TweenMax.to({}, 0.016, {
                repeat: -1,
                onRepeat: function() {
                    posX += (mouseX - posX) / 9;
                    posY += (mouseY - posY) / 9;

                    TweenMax.set(follower, {
                        css: {
                            left: posX - 7.5,
                            top: posY - 7.5
                        }
                    });

                    TweenMax.set(cursor, {
                        css: {
                            left: mouseX,
                            top: mouseY
                        }
                    });
                }
            });

            $(document).on("mousemove", function(e) {
                mouseX = e.clientX;
                mouseY = e.clientY;
            });

            $(".hover-reveal").on("mouseenter", function() {
                cursor.addClass("active");
                follower.addClass("active");
            });

            $(".hover-reveal").on("mouseleave", function() {
                cursor.removeClass("active");
                follower.removeClass("active");
            });
            // 마우스 포인터 끝

            // CSS 변수 지원 여부 확인
            var supportsCssVars = function() {
                var style = document.createElement("style");
                style.innerHTML = "root: { --tmp-var: bold; }";
                document.head.appendChild(style);
                var value = window.getComputedStyle(document.documentElement).getPropertyValue("--tmp-var");
                var isSupported = value === "bold";
                document.head.removeChild(style);
                return isSupported;
            };

            // CSS 변수 지원 여부 확인 후 경고 표시
            if (!supportsCssVars()) {
                alert("Please view this page in a modern browser that supports CSS Variables.");
            }
        });
    </script>
</head>
<body>
    <!-- 마우스포인터 시작 -->
    <svg class="cursor" width="20" height="20" viewBox="0 0 20 20">
        <circle class="cursor__inner" cx="10" cy="10" r="5"></circle>
    </svg>
    <!-- 마우스포인터 끝 -->
</body>
</html>
