<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>

	<!-- <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<link rel='stylesheet' href='/desktop/resources/css/main.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
	<script src='/desktop/resources/js/main.js'></script> -->
</head>
<body>

	<!-- 세션 스코프에서 삭제했는데 왜 새로고침하면 남아있는지? -->
	<%-- <c:if test="${not empty sessionScope.msg }">
		<c:set var="msg" value="${sessionScope.msg }" scope="session"/>
		<script>alert('${msg}');</script>
		<c:remove var="msg" scope="session"/>
	</c:if> --%>
	
	<!-- include navBar -->
	<%-- <jsp:include page="/WEB-INF/views/component/navBar.jsp"></jsp:include> --%>
	
	<!-- middle component -->
	<div class='container' id='loginForm'>
		<div class='container' id='innerLoginForm'>
			<p/>
			<h3>로그인 페이지</h3>
			<form class='form-group' name='loginFrm' id='loginFrm' action='#loginAction' method='post'>
				<input class='form-control' type='text' name='userId' id='userId' placeholder='아이디 입력' /><br/>
				<input class='form-control' type='password' name='userPwd' id='userPwd' placeholder='비밀번호 입력' /><br/>
				<input class='btn btn-primary' type='button' id='btnLoginSubmit' value='제 출' style='margin-top: 20px;'/><br/>
			</form>
			<a id='finduserIdAnc' href='#findId'>아이디 찾기</a>&nbsp;&nbsp;
			<a id='finduserPwdAnc' href='#findPwd'>비밀번호 찾기</a>&nbsp;&nbsp;
			<a id='logintojoinAnc' href='#join'>회원가입</a>
			<p/>
		</div>
	</div>
	
	<!-- include footer -->
	<%-- <jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include> --%>

</body>
</html>