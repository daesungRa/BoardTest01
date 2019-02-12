<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header page</title>
</head>
<body>

	<header class='container-fluid' id='header'>
	
		<jsp:include page="/WEB-INF/views/component/navBar.jsp"></jsp:include>
		
		<div class='container'>
			<div class='jumbotron' style='height: 400px; color: #fff; background-color: rgba(0, 0, 0, 0.7);'>
				<br/>
				<h1>환영합니다!</h1><br/>
				
				<p>라대성의 포트폴리오 사이트입니다.<br/>컨셉은 나만의 책 리뷰를 작성하고 다른 사람들과 서로 공유하는 것입니다.<br/>디자인은 부트스트랩으로 하였고, spring mvc 로 서버환경을 구축했습니다. 데이터베이스는 oracle 11g xe 입니다.</p>
				<P>  The time on the server is ${serverTime}. </P>
				<a href='board/list'>리뷰 보기</a>
			</div>
		</div>
	</header>

</body>
</html>