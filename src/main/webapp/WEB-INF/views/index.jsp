<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<meta charset='utf-8'>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>Home Page</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />
	<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'/>
	<link rel='stylesheet' href='/desktop/resources/css/index.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	<link rel='stylesheet' href='/desktop/resources/css/member.css' />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src='/desktop/resources/js/index.js'></script>
	<script src='/desktop/resources/js/component.js'></script>
	<script src='/desktop/resources/js/member.js'></script>
</head>
<body>

	<!-- 세션 메시지는 스크립트로 일괄 처리할 것! -->
	
	<%-- <c:if test="${not empty sessionScope.msg }">
		<c:set var="msg" value="${sessionScope.msg }" scope="session"/>
		<script>alert('${msg}');</script>
		<c:remove var="msg" scope="session"/>
		<%
			// 세션 내 메시지 삭제
			session.removeAttribute("msg");
		%>
	</c:if> --%>
	
	<!-- 브라우저 크기 확인 (임시) -->
	<!-- <div id='windowSize' style='width: 180px; border: 1px solid black;'>
		window size : 
	</div> -->
	
	<!-- top -->
	<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>
	
	<!-- include navbar(top) -->
	<jsp:include page="/WEB-INF/views/component/navBar_top.jsp"></jsp:include>
	
	<!-- include header -->
	<header id='indexHeader'>
		<jsp:include page="/WEB-INF/views/component/header.jsp"></jsp:include>
	</header>

	<!-- article component -->
	<article id='article'>
		<div class='container my-index-article'>
			<div class='row my-index-article-row'>
				
			
			
				<div class='col-lg-4 my-index-article-col'>
					<h4>컨텐트 1</h4>
				</div>
				<div class='col-lg-4 my-index-article-col'>
					<h4>컨텐트 2</h4>
				</div>
				<div class='col-lg-4 my-index-article-col'>
					<h4>컨텐트 3</h4>
				</div>
			</div>
		</div>
	</article>
	
	<!-- button for to-top -->
	<a class='btn btn-secondary my-btn-toTop' href='#' onclick='funcMovePage("indexTop");'>top</a>
	
	<!-- include footer -->
	<footer>
		<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
	</footer>
	
    <!-- Modal -->
    <jsp:include page="/WEB-INF/views/component/modal.jsp"></jsp:include>
	
</body>
</html>
