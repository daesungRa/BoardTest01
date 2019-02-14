<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>navBar page</title>
</head>
<body>

	<div class='navbar navbar-expand-md bg-dark navbar-dark sticky-top my-nav'>
		<div class='navbar-header'>
			<a class='navbar-brand' href='#'>
				<img src='/desktop/resources/imgs/book_logo01.svg' id='navLogo' alt='brand logo' />
			</a>
		</div>
		<a id='title' href='/desktop/'>책 상</a>

		<button class='navbar-toggler collapsed' type='button'
			data-toggle='collapse' data-target='#collapsibleNavbar'>
			<span class='navbar-toggler-icon'></span>
		</button>
		<div class='collapse navbar-collapse' id='collapsibleNavbar'>
			<ul class='navbar-nav'>
				<c:choose>
					<c:when test="${not empty requestScope.memberInfo and requestScope.memberInfo eq true }">
						<li class='nav-item'><a class='nav-link' id='memberProfileAnc' href='#'>프로필 관리</a></li>
						<li class='nav-item'><a class='nav-link' id='memberInfoAnc' href='#'>회원정보 관리</a></li>
					</c:when>
					<c:otherwise>
						<li class='nav-item dropdown'>
							<a class='nav-link dropdown-toggle' data-toggle='dropdown' role='button' id='categoryAnc' href='#'>리뷰 카테고리</a>
							<ul class='dropdown-menu' style='text-align: left;'>
								<li><a class='dropdown-item' id='' href='#'>오늘의 리뷰</a></li>
								<li><a class='dropdown-item' id='' href='#'>베스트셀러/신간</a></li>
								<li class="dropdown-divider"></li>
								<li><a class='dropdown-item' id='' href='#'>인문/사회/정치</a></li>
								<li><a class='dropdown-item' id='' href='#'>경제/경영</a></li>
								<li><a class='dropdown-item' id='' href='/desktop/board/categoryFour'>문학/시/소설</a></li>
								<li><a class='dropdown-item' id='' href='#'>과학/공학/수학/컴퓨터</a></li>
								<li><a class='dropdown-item' id='' href='#'>교육/수험서/자격증</a></li>
								<li><a class='dropdown-item' id='' href='#'>예술/문화/자기계발/라이프</a></li>
							</ul>
						</li>
						<li class='nav-item'><a class='nav-link' id='guestbookAnc' href='#123'>방명록</a></li>
						<li class='nav-item'><a class='nav-link' id='myDeskTopAnc' href='#'>나의 책상</a></li>
						<li class='nav-item'><a class='nav-link' id='myDeskTopAnc' href='#'>중고책</a></li>
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
						<ul class='dropdown-menu dropdown-menu-right animate slideIn'>
							<li><a class='dropdown-item' id='logoutAnc' href='/desktop/member/logout'>로그아웃</a></li>
							<li><a class='dropdown-item' id='myPage' href='/desktop/member/myPage'>마이페이지</a></li>
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
						<ul class='dropdown-menu'>
							<li><a class='dropdown-item' id='loginAnc' href='#'>로그인</a>
							</li>
							<li><a class='dropdown-item' id='joinAnc' href='#'>회원가입</a>
							</li>
						</ul>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>