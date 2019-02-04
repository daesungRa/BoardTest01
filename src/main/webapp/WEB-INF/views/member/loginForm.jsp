<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
	<script>
		function mainLoginForm () {
			var frm = document.frm;
			var btn = frm.btnSubmit;
			btn.onclick = function () {
				if (frm.userId.value == '') {
					alert('아이디를 입력하세요');
					frm.userId.focus();
				} else if (frm.userPwd.value == '') {
					alert('비밀번호를 입력하세요');
					frm.userPwd.focus();
				} else {
					frm.submit();
				}
			}
		}
	</script>
</head>
<body>

	<!-- 세션 스코프에서 삭제했는데 왜 새로고침하면 남아있는지? -->
	<c:if test="${not empty sessionScope.msg }">
		<script>alert('${sessionScope.msg}');</script>
		<c:set var="msg" value="msg" scope="session"/>
		<c:remove var="msg" scope="session"/>
		<script>alert('${sessionScope.msg}');</script>
	</c:if>

	<div class='navbar navbar-expand-sm justify-content-start bg-dark navbar-dark sticky-top'>
		<div class='navbar-header'>
			<a class='navbar-brand' href='#'>
				<img src='/controller/resources/imgs/deer.jpg' alt='brand logo' style='width: 50px; height: 44px'/>
			</a>
		</div>
	</div>
	
	<div class='container'>
		<form class='form-group' name='frm' action='login' method='post'>
			<input class='form-control' type='text' name='userId' placeholder='아이디 입력' />
			<input class='form-control' type='password' name='userPwd' placeholder='비밀번호 입력' />
			<input class='btn btn-primary' type='button' id='btnSubmit' value='제 출' />
		</form>
	</div>
	
	<script>mainLoginForm();</script>

</body>
</html>