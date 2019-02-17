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
	<link rel='stylesheet' href='/desktop/resources/css/myPage.css' />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src='/desktop/resources/js/index.js'></script>
</head>
<body>

	<c:if test="${not empty sessionScope.msg }">
		<c:set var="msg" value="${sessionScope.msg }" scope="session"/>
		<script>alert('${msg}');</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
	<!-- top -->
	<div class='container-fluid my-top' id='indexTop'>
		<div class='container my-top-container'>
			<div class='container my-top-content'>
				<h3 style='cursor: pointer;' onclick='funcMovePage("indexTop")'>책 상</h3>
				<p>세상의 모든 책 리뷰</p>
			</div>
			<div class='searchForm'>
				<form name='searchForm' action=''>
					<span class='icon'><i class='fa fa-search'></i></span>
					<input type='search' id='search' placeholder='Search...' />
				</form>
			</div>
		</div>
	</div>
	
	<!-- include navbar -->
	<jsp:include page="/WEB-INF/views/component/navBar.jsp"></jsp:include>
	
	<!-- include header -->
	<header id='indexHeader'>
		<jsp:include page="/WEB-INF/views/component/header.jsp"></jsp:include>
	</header>

	<!-- article component -->
	<article id='article'>
		<div class='container my-article'>
			<div class='row my-article-row'>
				<div class='col-lg-4 my-article-col'>
					<h4>컨텐트 1</h4>
				</div>
				<div class='col-lg-4 my-article-col'>
					<h4>컨텐트 2</h4>
				</div>
				<div class='col-lg-4 my-article-col'>
					<h4>컨텐트 3</h4>
				</div>
			</div>
		</div>
	</article>
	
	<a class='btn btn-secondary my-btn-toTop' href='#' onclick='funcMovePage("indexTop");'>top</a>
	
	<!-- include footer -->
	<footer>
		<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
	</footer>
	
    <!-- Modal -->
    <button id="modalBtn" style='display: none;'>Open Modal</button>
    <div id="mainModal" class="modal">
    	
	    <!-- Modal content -->
	    <div class="modal-content">
	   		<div id='innerContent'></div>
	   		<span class="close">닫기</span>
	    </div>
	    
    </div>
	
</body>
</html>
