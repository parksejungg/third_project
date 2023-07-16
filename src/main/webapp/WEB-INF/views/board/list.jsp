<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/list.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- boot css -->
<title>릴레이 소설 게시판</title>

<style type="text/css">
button:hover {
	background: #FAF5EB !important;
	color: #994D22 !important;
	border: 1px solid #994D22 !important;
}
</style>

<!-- sts에서 jquery 사용 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script>
	function moveWrite() {
		location.href = "${path}/relay/board/write.do";
	}
</script>
</head>
<body style="background: #FFFBF2">

	<%@ include file="/WEB-INF/views/includes/mouse.jsp"%>
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<div>
		<img style="width: 100%; margin-top: 40px;"
			src="/resources/img/board/relay_banner.png" alt="">
	</div>

	<div class="list-span-text"
		style="text-align: center; font-size: 18pt; line-height: 45px; margin-top: 60px; margin-bottom: 70px">
		<span> ✎ <br /> 관람객 또한 작가가 될 수 있는 공간을 꿈꿉니다. <br /> 작가의 글에 이어
			릴레이 소설을 작성해보세요. <br /> 여러분들의 창의성이 모여 하나의 작품이 될 거예요!
		</span>
	</div>

	<div class="list_relay" style="text-align: center;">
		<img style="width: 1280px" src="/resources/img/board/relay_img.png"
			alt=""> <br /> <br />
	</div>

	<div class="list_btn list_btn03 list_btn01"
		style="width: 1280px; margin-top: 50px; margin-left: auto; margin-right: auto;">
		<button class="btn btn-outline-secondary list_btn02"
			style="border: 1px solid #A98B67; color: #A98B67; margin: 5px; width: 120px; height: 50px;"
			type="button" id="btnWrite" onclick="moveWrite()">글쓰기</button>
	</div>

	<table class="table list_table01"
		style="width: 1200px; height: auto; margin-top: 5px; margin-left: auto; margin-right: auto;">
		<c:forEach var="row" items="${list}" varStatus="loop">
			<c:if test="${loop.index % 3 == 0}">
				<tr style="border-bottom: hidden;">
			</c:if>
			<td>
				<div style="text-align: center; padding: 15px;">
					<!-- boot card -->
					<div
						style="width: 400px; height: 245px; margin: 0 auto; padding: 10px; background: #F1E8DB; border-radius: 5px;">
						<div
							style="color: #994D22; font-size: 22pt; padding: 5px; border-bottom: 2px solid #E1D3BF;">${row.bno}</div>
						<div
							style="color: #545454; margin-top: 11px; font-size: 13pt; padding: 11px; font-family: 'SUITE-Regular' !important;">
							<span>' </span> <b>${row.writer}</b> <span>' 님</span>
							<p
								style="color: #545454; margin-top: 18px; margin-bottom: 18px; font-size: 20pt; font-family: 'SUITE-Regular' !important;">
								<b><a href="${path}/relay/board/view.do?bno=${row.bno}"
									style="text-decoration: none; color: #545454">${row.title}</a></b>
							</p>
							<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
							<div
								style="color: #545454; font-family: 'SUITE-Regular' !important;">
								<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd" />
							</div>
							<!-- <div class="card-text" style="color: #545454"><b>수정일 : </b><fmt:formatDate value="${row.updatedate}" pattern="yyyy-MM-dd"/></div> -->
						</div>
					</div>
				</div>
			</td>
			<c:if test="${(loop.index + 1) % 3 == 0 || loop.last}">
				</tr>
			</c:if>
		</c:forEach>
	</table>

	<table class="table list_table02"
		style="width: 706px; height: auto; margin-top: 5px; margin-left: auto; margin-right: auto;">
		<c:forEach var="row" items="${list}" varStatus="loop">
			<c:if test="${loop.index % 2 == 0}">
				<tr style="border-bottom: hidden;">
			</c:if>
			<td>
				<div style="text-align: center; padding: 15px;">
					<!-- boot card -->
					<div
						style="width: 300px; height: 200px; margin: 0 auto; padding: 10px; background: #F1E8DB; border-radius: 5px;">
						<div
							style="color: #994D22; font-size: 20pt; padding: 3px; border-bottom: 2px solid #E1D3BF;">${row.bno}</div>
						<div
							style="color: #545454; margin-top: 8px; font-size: 13pt; padding: 11px; font-family: 'SUITE-Regular' !important;">
							<span>' </span> <b>${row.writer}</b> <span>' 님</span>
							<p
								style="color: #545454; margin-top: 5px; margin-bottom: 5px; font-size: 20pt; font-family: 'SUITE-Regular' !important;">
								<b><a href="${path}/relay/board/view.do?bno=${row.bno}"
									style="text-decoration: none; color: #545454">${row.title}</a></b>
							</p>
							<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
							<div
								style="color: #545454; font-family: 'SUITE-Regular' !important;">
								<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd" />
							</div>
							<!-- <div class="card-text" style="color: #545454"><b>수정일 : </b><fmt:formatDate value="${row.updatedate}" pattern="yyyy-MM-dd"/></div> -->
						</div>
					</div>
				</div>
			</td>
			<c:if test="${(loop.index + 1) % 2 == 0 || loop.last}">
				</tr>
			</c:if>
		</c:forEach>
	</table>

	<table class="table list_table03"
		style="width: 350px; height: auto; margin-top: 5px; margin-left: auto; margin-right: auto;">
		<c:forEach var="row" items="${list}" varStatus="loop">
			<c:if test="${loop.index % 1 == 0}">
				<tr style="border-bottom: hidden;">
			</c:if>
			<td>
				<div style="text-align: center; padding: 15px;">
					<!-- boot card -->
					<div
						style="width: 300px; height: 200px; margin: 0 auto; padding: 10px; background: #F1E8DB; border-radius: 5px;">
						<div
							style="color: #994D22; font-size: 20pt; padding: 3px; border-bottom: 2px solid #E1D3BF;">${row.bno}</div>
						<div
							style="color: #545454; margin-top: 8px; font-size: 13pt; padding: 11px; font-family: 'SUITE-Regular' !important;">
							<span>' </span> <b>${row.writer}</b> <span>' 님</span>
							<p
								style="color: #545454; margin-top: 5px; margin-bottom: 5px; font-size: 20pt; font-family: 'SUITE-Regular' !important;">
								<b><a href="${path}/relay/board/view.do?bno=${row.bno}"
									style="text-decoration: none; color: #545454">${row.title}</a></b>
							</p>
							<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
							<div
								style="color: #545454; font-family: 'SUITE-Regular' !important;">
								<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd" />
							</div>
							<!-- <div class="card-text" style="color: #545454"><b>수정일 : </b><fmt:formatDate value="${row.updatedate}" pattern="yyyy-MM-dd"/></div> -->
						</div>
					</div>
				</div>
			</td>
			<c:if test="${(loop.index + 1) % 1 == 0 || loop.last}">
				</tr>
			</c:if>
		</c:forEach>
	</table>

	<div style="text-align: center;">
		<input style="width: 90px; margin-top: 3%; margin-bottom: 4%;"
			type="image" src="/resources/img/board/top.png"
			onClick="javascript:window.scrollTo(0,0)" alt="맨위로" />
	</div>
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
</html>
