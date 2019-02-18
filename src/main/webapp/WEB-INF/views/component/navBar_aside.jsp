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
					<li><a class='dropdown-item my-nav' id='' href='/desktop/board/categoryFour'>문학/시/소설</a></li>
					<li><a class='dropdown-item my-nav' id='' href='#'>과학/공학/수학/컴퓨터</a></li>
					<li><a class='dropdown-item my-nav' id='' href='#'>교육/수험서/자격증</a></li>
					<li><a class='dropdown-item my-nav' id='' href='#'>예술/문화/자기계발/라이프</a></li>
				</ul>
			</li>
			<li class=''>
				<a class='my-nav' id='guestbookAnc' href='#123'>방명록</a>
			</li>
			<li class=''>
				<a class='my-nav' id='myDeskTopAnc' href='#'>나의 책상</a>
			</li>
			<li class=''>
				<a class='my-nav' id='myDeskTopAnc' href='#'>중고책</a>
			</li>
		</ul>
	</div>

</body>
</html>