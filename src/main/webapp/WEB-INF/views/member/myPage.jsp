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
	<link rel='stylesheet' href='/desktop/resources/css/index.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	<link rel='stylesheet' href='/desktop/resources/css/myPage.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script> 
	<script src='/desktop/resources/js/myPage.js'></script>
</head>
<body>
	<c:if test="${not empty requestScope.msg }">
		<c:set var="msg" value="${requestScope.msg }" scope="request"/>
		<script>alert('${msg}');</script>
		<c:remove var="msg" scope="request"/>
	</c:if>

	<!-- include navBar -->
	<jsp:include page="/WEB-INF/views/component/navBar.jsp"></jsp:include>

	<!-- middle component -->
	<div class='container my-con'>
		<div class='btn btn-info my-btn01' id='btn01'></div>
		<div class='btn btn-info my-btn03' id='btn03' style='display:none;'></div>
		<div class='btn btn-info my-btn02' id='btn02' onclick='location.href="/desktop/";'>홈으로</div>
		<div class='container' id='infoContainer'>
			<p/>
			<h2></h2><br/>
			<div id='infoContent'></div>
			
			<p/>
		</div>
	</div>

	<!-- include footer -->
	<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
	
	<script>funcMyPage();</script>
	
</body>
</html>