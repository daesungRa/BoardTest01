<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>View Member Info</title>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<link rel='stylesheet' href='/desktop/resources/css/myPage.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script> 
	<script src='/desktop/resources/js/myPage.js'></script>
	<script src='/desktop/resources/js/component.js'></script>
</head>
<body>
	<c:if test="${not empty requestScope.msg }">
		<c:set var="msg" value="${requestScope.msg }" scope="request"/>
		<script>alert('${msg}');</script>
		<c:remove var="msg" scope="request"/>
	</c:if>
	
	<!-- 브라우저 크기 확인 (임시) -->
	<div id='windowSize' style='width: 180px; border: 1px solid black;'>
		window size : 
	</div>
	
	<!-- top -->
	<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>

	<!-- include navBar -->
	<jsp:include page="/WEB-INF/views/component/navBar_top.jsp"></jsp:include>

	<!-- article component -->
	<div class='container my-con'>
		<div class='btn btn-info my-mypage-btn01' id='mypageBtn01'></div>
		<div class='btn btn-info my-mypage-btn03' id='mypageBtn03' style='display:none;'></div>
		<div class='btn btn-info my-mypage-btn02' id='mypageBtn02' onclick='location.href="/desktop/";'>홈으로</div>
		<div class='container' id='mypageInfoContainer'>
			<p/>
			<h2></h2><br/>
			<div id='mypageInfoContent'></div>
			
			<p/>
		</div>
	</div>

	<!-- include footer -->
	<footer>
		<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
	</footer>
	
	<!-- Modal -->
    <button id="modalBtn" style='display: none;'></button>
    <div id="mainModal" class="modal">
    	
	    <!-- Modal content -->
	    <div class="modal-content">
	   		<div id='innerContent'></div>
	   		<span class="close">닫기</span>
	    </div>
	    
    </div>
	
</body>
</html>