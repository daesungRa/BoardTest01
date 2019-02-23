<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>navBar page(top)</title>
</head>
<body>

	<div class='navbar navbar-expand-md bg-light navbar-light sticky-top my-nav'>
		<div class='navbar-header text-light'>
			<a class='navbar-brand' href='/desktop/'>
				<img src='/desktop/resources/imgs/book_logo01.svg' id='navLogo' alt='brand logo' />
			</a>
			<!-- <a id='title' href='/desktop/'>책 상</a> -->
		</div>

		<button class='navbar-toggler collapsed' type='button'
			data-toggle='collapse' data-target='#collapsibleNavbar'>
			<span class='navbar-toggler-icon'></span>
		</button>
		<div class='collapse navbar-collapse' id='collapsibleNavbar'>
			<ul class='navbar-nav'>
				<%-- <c:choose>
					<c:when test="${not empty requestScope.memberInfo and requestScope.memberInfo eq true }">
						<li class='nav-item'><a class='nav-link my-nav' id='memberProfileAnc' href='#'>프로필 관리</a></li>
						<li class='nav-item'><a class='nav-link my-nav' id='memberInfoAnc' href='#'>회원정보 관리</a></li>
					</c:when>
					<c:otherwise> --%>
						<li class='nav-item dropdown'>
							<a class='nav-link dropdown-toggle my-nav' data-toggle='dropdown' role='button' id='categoryAnc' href='#'>리뷰 카테고리</a>
							<ul class='dropdown-menu my-nav' style='text-align: left;'>
								<li><a class='dropdown-item my-nav' id='' href='#'>오늘의 리뷰</a></li>
								<li><a class='dropdown-item my-nav' id='' href='#'>베스트셀러/신간</a></li>
								<li class="dropdown-divider"></li>
								<li><a class='dropdown-item my-nav' id='' href='#'>인문/사회/정치</a></li>
								<li><a class='dropdown-item my-nav' id='' href='#'>경제/경영</a></li>
								<li><a class='dropdown-item my-nav' id='' href='/desktop/board/categoryFour'>문학/시/소설</a></li>
								<li><a class='dropdown-item my-nav' id='' href='#'>과학/공학/수학/컴퓨터</a></li>
								<li><a class='dropdown-item my-nav' id='' href='#'>교육/수험서/자격증</a></li>
								<li><a class='dropdown-item my-nav' id='' href='#'>예술/문화/자기계발/라이프</a></li>
							</ul>
						</li>
						<li class='nav-item'><a class='nav-link my-nav' id='writerListAnc' href='#writerList'>작가별</a></li>
						<li class='nav-item'><a class='nav-link my-nav' id='guestbookAnc' href='#guestbook'>방명록</a></li>
						<li class='nav-item'><a class='nav-link my-nav' id='myDeskTopAnc' href='#myDeskTop'>나의 책상</a></li>
					<%-- </c:otherwise>
				</c:choose> --%>
			</ul>
		</div>

		<c:choose>
			<c:when test="${not empty sessionScope.userId }">
					<div class='dropdown'>
						<a class='dropdown-toggle' data-toggle='dropdown' role='button'
							href='#'> 환영해요, ${sessionScope.userName } 님 <span
							class='caret'></span>
						</a>
						<ul class='dropdown-menu dropdown-menu-right animate slideIn'>
							<li><a class='dropdown-item my-nav' id='logoutAnc' href='#logout'>로그아웃</a></li>
							<li><a class='dropdown-item my-nav' id='loadMemberInfo' href='#loadMemberInfo'>마이페이지</a></li>
						</ul>
					</div>
			</c:when>
			<c:otherwise>
				<div class='navbar'>
					<div class='dropdown'>
						<a class='dropdown-toggle' data-toggle='dropdown' role='button'
							href='#'>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;접
							속 <span class='caret'></span>
						</a>
						<ul class='dropdown-menu'>
							<li><a class='dropdown-item' id='loginAnc' href='#login'>로그인</a>
							</li>
							<li><a class='dropdown-item' id='joinAnc' href='#join'>회원가입</a>
							</li>
						</ul>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>