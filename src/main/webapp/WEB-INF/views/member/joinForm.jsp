<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Page</title>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
</head>
<body>

	<!-- include navBar -->
	<jsp:include page="/WEB-INF/views/component/navBar.jsp"></jsp:include>

	<!-- middle component -->
	<div class='container'>
		<p/>
		<h1>회원가입 페이지</h1>
		<form class='form-group' name='frm' action='join' method='post'>
			<input class='form-control' type='text' name='userId' placeholder='아이디 입력' />
			<input class='form-control' type='password' name='userPwd' placeholder='비밀번호 입력' />
			<input class='form-control' type='text' name='userName' placeholder='이름 입력' />
			<input class='form-control' type='email' name='email' placeholder='이메일 입력' />
			<input class='form-control' type='text' name='phone' placeholder='전화번호 입력' />
			<input class='form-control' type='text' name='postal' placeholder='우편번호 입력' />
			<input class='form-control' type='text' name='address' placeholder='주소 입력' />
			<input class='form-control' type='text' name='photo' placeholder='사진 입력' />
			<input class='btn btn-primary' type='button' id='btnSubmit' value='제 출' />
		</form>
		<p/>
	</div>

	<!-- include footer -->
	<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
</body>
</html>