<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>navBar page</title>
</head>
<body>

	<div class='navbar navbar-expand-md bg-dark navbar-dark sticky-top'>
		<div class='navbar-header'>
			<a class='navbar-brand' href='#'> <img
				src='/controller/resources/imgs/book_logo01.svg' alt='brand logo'
				style='width: 50px; height: 44px' />
			</a>
		</div>
		<a id='title' href='/controller/'>책 상</a>

		<button class='navbar-toggler collapsed' type='button'
			data-toggle='collapse' data-target='#collapsibleNavbar'>
			<span class='navbar-toggler-icon'></span>
		</button>
		<div class='collapse navbar-collapse' id='collapsibleNavbar'>
			<ul class='navbar-nav'>
				<c:choose>
					<c:when test="${not empty requestScope.memberInfo and requestScope.memberInfo eq true }">
						<li class='nav-item'><a class='nav-link' href='#'>프로필 관리</a></li>
						<li class='nav-item'><a class='nav-link' href='#'>회원정보 관리</a></li>
					</c:when>
					<c:otherwise>
						<li class='nav-item'><a class='nav-link' href='#'>방명록</a></li>
						<li class='nav-item'><a class='nav-link' href='#'>카테고리</a></li>
						<li class='nav-item'><a class='nav-link' href='#'>오늘의 책</a></li>
						<li class='nav-item'><a class='nav-link' href='#'>나의 책상</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

		<c:choose>
			<c:when test="${not empty sessionScope.userId }">
				<div class='navbar navbar-nav navbar-right'>
					<div class='dropdown'>
						<a class='dropdown-toggle' data-toggle='dropdown' role='button'
							href='#'> 환영해요, ${sessionScope.userName } 님 <span
							class='caret'></span>
						</a>
						<ul class='dropdown-menu'
							style='text-align: right; padding-right: 10px;'>
							<li><a class='dropdown-item' href='/controller/member/logout'>로그아웃</a></li>
							<li><a class='dropdown-item' href='/controller/member/viewMember'>회원정보</a></li>
						</ul>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class='navbar navbar-nav navbar-right'>
					<div class='dropdown'>
						<a class='dropdown-toggle' data-toggle='dropdown' role='button'
							href='#'>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;접
							속 <span class='caret'></span>
						</a>
						<ul class='dropdown-menu'
							style='text-align: right; padding-right: 10px;'>
							<li><a class='dropdown-item' href='/controller/member/loginForm'>로그인</a>
							</li>
							<li><a class='dropdown-item' href='/controller/member/joinForm'>회원가입</a>
							</li>
						</ul>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>