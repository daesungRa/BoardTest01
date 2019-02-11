<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Member Info</title>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<link rel='stylesheet' href='/controller/resources/css/main.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
	<script src='/controller/resources/js/memberInfo.js'></script>
</head>
<body>
	<c:if test="${not empty requestScope.msg }">
		<c:set var="msg" value="${requestScope.msg }" scope="request"/>
		<script>alert('${msg}');</script>
		<c:remove var="msg" scope="request"/>
	</c:if>
	
	<c:choose>
		<c:when test="${not empty requestScope.memberVo }">
			<c:set var="vo" value="${requestScope.memberVo }" scope="request"/>
			<script>
				var xhr = new XMLHttpRequest();
				var infoContent = document.getElementById('infoContent');
				
				getProfilePage(xhr, infoContent);
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('회원 정보가 존재하지 않습니다. 이전 페이지로 돌아갑니다');
				history.back();
			</script>
		</c:otherwise>
	</c:choose>

	<!-- include navBar -->
	<jsp:include page="/WEB-INF/views/component/navBar.jsp"></jsp:include>

	<!-- middle component -->
	<div class='container' style='height: 720px;'>
		<div class='container' id='infoContainer'>
			<p/>
			<h2>회원정보 페이지</h2><br/>
			<div id='infoContent'></div>
			
			<p/>
		</div>
	</div>

	<!-- include footer -->
	<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
</body>
</html>