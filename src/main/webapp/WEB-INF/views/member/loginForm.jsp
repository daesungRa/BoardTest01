<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>

	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<link rel='stylesheet' href='/controller/resources/css/custom.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
	<script src='/controller/resources/js/custom.js'></script>
</head>
<body>

	<!-- 세션 스코프에서 삭제했는데 왜 새로고침하면 남아있는지? -->
	<c:if test="${not empty sessionScope.msg }">
		<script>alert('${sessionScope.msg}');</script>
		<c:set var="msg" value="msg" scope="session"/>
		<c:remove var="msg" scope="session"/>
		<script>alert('${sessionScope.msg}');</script>
	</c:if>
	
	<!-- include navBar -->
	<jsp:include page="/WEB-INF/views/component/navBar.jsp"></jsp:include>
	
	<!-- middle component -->
	<div class='container'>
		<p/>
		<h1>로그인 페이지</h1>
		<form class='form-group' name='loginFrm' action='/controller/member/login' method='post'>
			<input class='form-control' type='text' name='userId' placeholder='아이디 입력' />
			<input class='form-control' type='password' name='userPwd' placeholder='비밀번호 입력' />
			<input class='btn btn-primary' type='button' id='btnSubmit' value='제 출' />
		</form>
		<p/>
	</div>
	
	<!-- include footer -->
	<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
	
	<script>mainLoginForm();</script>

</body>
</html>