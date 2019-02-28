<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>navBar page(aside)</title>
</head>
<body>

	<div id='navbarAside' style='position: fixed; display: none; width: 17%; height: 100%; border-right: 1px solid #aaa; z-index: 1;'>
		<div style='width:100%;height:20%;background-color: #fff;border-bottom:1px solid #aaa;'>
			<div class='' style='height: 20px; margin: 30px auto; text-align: center; border: 1px solid black;'>
				<a href='/desktop/'>
					<img src='/desktop/resources/imgs/book_logo01.svg' id='navLogo' alt='brand logo' />
				</a>
				<a id='title' href='/desktop/'>DESK TOP</a>
			</div>
			<div class='container' style='width: 90%; height: 110px; border: 1px solid black;'>
				<c:choose>
					<c:when test="${not empty sessionScope.userId }">
						<div class='dropdown'>
							<a class='dropdown-toggle' data-toggle='dropdown' role='button'
								href='#'> 환영해요, ${sessionScope.userName } 님 <span
								class='caret'></span>
							</a>
							<ul class='dropdown-menu dropdown-menu-right animate slideIn'>
								<li><a class='dropdown-item my-nav' id='logoutAnc' href='/desktop/member/logout'>로그아웃</a></li>
								<li><a class='dropdown-item my-nav' id='myPage' href='/desktop/member/myPage'>마이페이지</a></li>
							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<div class='dropdown'>
							<a class='dropdown-toggle' data-toggle='dropdown' role='button'
								href='#'>접속 <span class='caret'></span>
							</a>
							<ul class='dropdown-menu' style='list-style: none;'>
								<li><a class='dropdown-item' id='loginAnc' href='#'>로그인</a>
								</li>
								<li><a class='dropdown-item' id='joinAnc' href='#'>회원가입</a>
								</li>
							</ul>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class='my-nav-vertical' style='background-color: #efefef;'>
			<br/>
			<ul class='' style='list-style: none;'>
				<li class='dropdown'>
					<a class='dropdown-toggle my-nav' data-toggle='dropdown' role='button' id='categoryAnc' href='#'>리뷰 카테고리</a>
					<ul class='dropdown-menu my-nav' style='text-align: left;'>
						<li><a class='dropdown-item my-nav' id='' href='#'>오늘의 리뷰</a></li>
						<li><a class='dropdown-item my-nav' id='' href='#'>베스트셀러/신간</a></li>
						<li class="dropdown-divider"></li>
						<li><a class='dropdown-item my-nav' id='' href='#'>인문/사회/정치</a></li>
						<li><a class='dropdown-item my-nav' id='' href='#'>경제/경영</a></li>
						<li><a class='dropdown-item my-nav' id='' href='/desktop/board/boardListPage/4'>문학/시/소설</a></li>
						<li><a class='dropdown-item my-nav' id='' href='#'>과학/공학/수학/컴퓨터</a></li>
						<li><a class='dropdown-item my-nav' id='' href='#'>교육/수험서/자격증</a></li>
						<li><a class='dropdown-item my-nav' id='' href='#'>예술/문화/자기계발/라이프</a></li>
					</ul>
				</li>
						<li class='nav-item'><a class='nav-link my-nav' id='writerListAnc' href='#writerList'>작가별</a></li>
						<li class='nav-item'><a class='nav-link my-nav' id='guestbookAnc' href='#guestbook'>방명록</a></li>
						<li class='nav-item'><a class='nav-link my-nav .myPageAnc' id='' href='/desktop/member/myPage'>나의 책상</a></li>
			</ul>
		</div>
	</div>

</body>
</html>