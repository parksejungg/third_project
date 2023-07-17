<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel='stylesheet' type='text/css' media='screen' href='/resources/common/bootstrap-3.3.2.min.css'>
<link rel="stylesheet" href="/resources/css/hs_css/buttons.css">
<link rel="stylesheet" href="/resources/css/hs_css/popup.css">
<script src="/resources/common/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
// https://business.juso.go.kr/addrlink/openApi/searchApi.do 웹사이트에서 하단 "웹 호출 소스 보기"에서 "JSON" 클릭해서 참고 합니다.
// 도로명 주소로 검색 api 연동을 ajax로 처리 합니다.
function fn_search(){
	$.ajax({
		 url :"https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#searchForm").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(jsonStr){
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr != null){
					fn_makeListJson(jsonStr); //fn_makeListJson(jsonStr) 호출!!
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

//결과 테이블 생성
//위에서 호출 받아서 처리할 fn_makeListJson(jsonStr) 메서드 선언
function fn_makeListJson(jsonStr){
	var htmlStr = "";
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr onclick=\"javascript:chooseAddress('"+this.roadAddr+"','"+this.jibunAddr+"','"+this.zipNo+"');\">";
		htmlStr += "<td>";
		htmlStr += "<dl>"+this.roadAddr+"</dl>";
		htmlStr += "<dl>"+this.jibunAddr+"</dl>";
		htmlStr += "</td>";
		htmlStr += "<td>"+this.zipNo+"</td>";
		htmlStr += "</tr>";
	});
	$("#addressTableTbody").html(htmlStr);
}

//엔터키 이벤트
function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {    
		event.keyCode = 0;  
		fn_search(); //jsonp사용시 enter키 입력 확인: fn_search()함수호출
	} 
}

//주소선택
function chooseAddress(roadAddr, jibunAddr, zipNo) {
	var aParam = [];
	aParam["roadAddr"] = roadAddr;
	aParam["jibunAddr"] = jibunAddr;
	aParam["zipNo"] = zipNo;
	
	opener.callback_openAddressPopup(aParam);
	window.close();
	
}
</script>

<title>주소검색창</title>
</head>
<body>
<div class="container" style="margin-top:25px;">
		<div id="memberSearchDiv" class="text-center">
		<form name="searchForm" id="searchForm" method="post" class="navbar-form navbar-left" role="search" onsubmit="event.preventDefault()">
	<input type="hidden" name="currentPage" value="1"/>
	<input type="hidden" name="countPerPage" value="100"/><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->
	<input type="hidden" name="resultType" value="json"/> <!-- 요청 변수 설정 (검색결과형식 설정, json) --> 
	<input type="hidden" id="confmKey" name="confmKey" value="devU01TX0FVVEgyMDIzMDUwODE3MTIwOTExMzc1MjM=		
"/><!-- 요청 변수 설정 (승인키) -->
	
	<div class="form-group">
		<input type="text" name="keyword" id="keyword" class="form-control" placeholder="도로명+건물번호, 건물명, 지번을 입력하세요." onkeypress="javascript:enterSearch();"  /><!-- 요청 변수 설정 (키워드) -->
	</div>
	  <button class="button button--ujarak button--border-thin button--text-thick btn" onClick="javascript:fn_search();">검색하기</button>
		</form>
		</div>
	</div>
	
	<div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>주소</th>
					<th>우편 번호</th>
				</tr>
			</thead>
			<tbody id="addressTableTbody">
			
			</tbody>
			
		</table>
	</div>
</body>
</html>