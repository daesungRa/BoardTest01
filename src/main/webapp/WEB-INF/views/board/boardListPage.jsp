<%@page import="com.daesungra.domain.BoardVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Board List</title>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'/>
	<link rel='stylesheet' href='/desktop/resources/css/boardListPage.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src='/desktop/resources/js/boardListPage.js'></script>
	<script src='/desktop/resources/js/component.js'></script>
</head>
<body>
	<c:if test="${not empty requestScope.msg }">
		<c:set var="msg" value="${requestScope.msg }" scope="request"/>
		<script>alert('${msg}');</script>
		<c:remove var="msg" scope="request"/>
	</c:if>
	
	<!-- 브라우저 크기 확인 (임시) -->
	<!-- <div id='windowSize' style='width: 180px; border: 1px solid black;'>
		window size : 
	</div> -->
	
	<!-- include navBar(aside) -->
	<div id='navbarAside' style='position: fixed; display: none; width: 15%; height: 100%; border-right: 1px solid #aaa; z-index: 1;'>
		<div style='width:100%;height:15%;background-color: #fff;border-bottom:1px solid #aaa;'>
			<div style='margin: 20px auto;'>
				<a href='/desktop/'>
					<img src='/desktop/resources/imgs/book_logo01.svg' id='navLogo' alt='brand logo' />
				</a><br/>
				<a id='title' href='/desktop/'>책 상</a>
			</div>
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
					<ul class='' style='list-style: none;'>
						<li class='dropdown'>
							<a class='dropdown-toggle' data-toggle='dropdown' role='button'
								href='#'>접속 <span class='caret'></span>
							</a>
							<ul class='dropdown-menu'>
								<li><a class='dropdown-item' id='loginAnc' href='#'>로그인</a>
								</li>
								<li><a class='dropdown-item' id='joinAnc' href='#'>회원가입</a>
								</li>
							</ul>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<jsp:include page="/WEB-INF/views/component/navBar_aside.jsp"></jsp:include>
	</div>
	
	<!-- include content -->
	<div id='boardContent' style='z-index: 0;'>
		<button class='btn btn-sm btn-light' id='btnShowNavbar' style='position: fixed; top: 20px; left: 10px;'>&gt;&gt;</button>
		<!-- top -->
		<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>
	
		<!-- middle component -->
		<div class='container' style='border: 1px solid black;'>
			<div class='container' style='width: 70%; border-right: 1px solid #afafaf; border-left: 1px solid #afafaf; padding: 20px 60px 20px 60px;'>
				<c:set var="boardList" value="${requestScope.boardList }"></c:set>
				<p/>
				<h2>게시판 리스트</h2><br/>
				<div class='row my-board-row' style='border-top: 2px solid black;'>
					<div class='col-md-1 my-board-grid'>serial</div>
					<div class='col-md-5 my-board-grid'>title</div>
					<div class='col-md-2 my-board-grid'>userId</div>
					<div class='col-md-2 my-board-grid'>category</div>
					<div class='col-md-2 my-board-grid'>date</div>
				</div>
				<div class='row my-board-row'>
					<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
					<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
					<div class='col-md-2 my-board-grid'></div>
				</div>
				<div class='row my-board-row'>
					<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
					<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
					<div class='col-md-2 my-board-grid'></div>
				</div>
				<div class='row my-board-row'>
					<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
					<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
					<div class='col-md-2 my-board-grid'></div>
				</div>
				<div class='row my-board-row'>
					<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
					<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
					<div class='col-md-2 my-board-grid'></div>
				</div>
				<div class='row my-board-row'>
					<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
					<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
					<div class='col-md-2 my-board-grid'></div>
				</div>
				<div class='row my-board-row' style='border-bottom: 2px solid black;'>
					<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
					<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
					<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
					<div class='col-md-2 my-board-grid'></div>
				</div>
				
				<br/><br/>
				<hr style='border: 1px solid #afafaf;'/>
				<br/><br/>
				
				<div style='height: 500px;'>
				</div>
				
				<br/><hr/><br/>
				
				<div style='height: 500px;'>
				</div>
				
				<br/><br/>
			</div>
		</div>
	
		<!-- include footer -->
		<footer>
			<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
		</footer>
	</div>
	
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