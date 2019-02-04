<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<meta charset='utf-8'>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>Home Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<style>
		#title {
			color: white;
			font-size: 14pt;
			font-weight: bolder;
			padding: 12px 15px 0 15px;
		}
		#title:hover {
			cursor: pointer;
		}
		.container-fluid {
			margin-top: 15px;
		}
	</style>
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
		<p id='title'>Welcome!</p>
		
		<button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#collapsibleNavbar'>
			<span class='navbar-toggler-icon'></span>
		</button>
		<div class='collapse navbar-collapse' id='collapsibleNavbar'>
			<ul class='navbar-nav'>
				<li class='nav-item'>
					<a class='nav-link' href='#'>Ajax</a>
				</li>
				<li class='nav-item'>
					<a class='nav-link' href='#'>jQuery</a>
				</li>
				<li class='nav-item'>
					<a class='nav-link' href='#'>JSP</a>
				</li>
				<li class='nav-item'>
					<a class='nav-link' href='#'>Servlet</a>
				</li>
				<li class='nav-item'>
					<a class='nav-link' href='#'>Spring</a>
				</li>
			</ul>
		</div>
		
		<c:choose>
			<c:when test="${not empty sessionScope.userId }">
				<div class='nav navbar-nav navbar-right'>
					<ul class='navbar-nav'>
						<li class='nav-item'>
							<a class='nav-link' href='#'>${sessionScope.userName } 님, 환영합니다</a>
						</li>
						<li class='nav-item'>
							<a class='nav-link' href='member/logout'>
								logout
							</a>
						</li>
						<li class='nav-item'>
							<a class='nav-link' href='#'>
								<img src='/controller/resources/imgs/lion.png' alt='control memberInfo' style='width: 50px; height: 44px'/>
							</a>
						</li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div class='nav navbar-nav navbar-right'>
					<ul class='navbar-nav'>
						<li class='nav-item'>
							<a class='nav-link' href='member/loginForm'>login</a>
						</li>
						<li class='nav-item'>
							<a class='nav-link' href='member/joinForm'>join</a>
						</li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<div class='container-fluid'>
		<h1>Welcome to My Home Page!</h1>
		<P>  The time on the server is ${serverTime}. </P>
		<a href='board/list'>게시판 리스트 보기</a>
	</div>

	<div class="container-fluid">
		<h1>Responsive Columns</h1>
		<p>Resize the browser window to see the effect.</p>
		<p>The columns will automatically stack on top of each other when the screen is less than 576px wide.</p>
		
		<div class="col-sm-3" style="background-color:lavender;">.col-sm-3</div>
		<div class="col-md-3" style="background-color:lavenderblush;">.col-md-3</div>
		<div class="col-lg-3" style="background-color:lavender;">.col-lg-3</div>
		<div class="col-xl-3" style="background-color:lavenderblush;">.col-xl-3</div>
		
		<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
		<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
		<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
		<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
		<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
		<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
		<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
		<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
		<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
	</div>
	
</body>
</html>
