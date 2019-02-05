<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header page</title>
<style>
	header {
		background: url("/controller/resources/imgs/book-back03-opa.jpg") no-repeat center center fixed;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
		height: 500px;
	}
</style>
</head>
<body>

	<header class='container-fluid'>
	
		<jsp:include page="/WEB-INF/views/component/navBar.jsp"></jsp:include>
		
		<div class='container'>
			<div class='jumbotron' style='height: 400px; color: #fff; background-color: rgba(0, 0, 0, 0.7);'>
				<br/>
				<h1>환영합니다!</h1><br/>
				
				<p>이 페이지는 부트스트랩으로 디자인하였습니다.<br/>사이트의 컨셉은 감성적인 나만의 책 리뷰를 작성하고 다른 사람들과 서로 공유하는 것입니다</p>
				<P>  The time on the server is ${serverTime}. </P>
				<a href='board/list'>리뷰 보기</a>
			</div>
		</div>
	</header>

</body>
</html>