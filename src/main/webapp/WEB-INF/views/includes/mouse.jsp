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
	<link rel="stylesheet" type="text/css" href="/resources/css/ej_css/main.css">    
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<!-- script 시작 -->
	<script>document.documentElement.className = "js";
        var supportsCssVars = function supportsCssVars() {
        var e,
        t = document.createElement("style");
        return t.innerHTML = "root: { --tmp-var: bold; }", document.head.appendChild(t), e = !!(window.CSS && window.CSS.supports && window.CSS.supports("font-weight", "var(--tmp-var)")), t.parentNode.removeChild(t), e;
        };
        supportsCssVars() || alert("Please view this demo in a modern browser that supports CSS Variables.");
    </script>
    <script src="/resources/js/ej_js/modules01.js"></script>
<body>
   <!-- 마우스포인터 시작 -->
<svg class="cursor" width="20" height="20" viewBox="0 0 20 20">
		<circle class="cursor__inner" cx="10" cy="10" r="5"></circle>
	</svg>
	<script src="/resources/js/ej_js/modules02.js"></script>
<!-- 마우스포인터 끝 -->
</body>
