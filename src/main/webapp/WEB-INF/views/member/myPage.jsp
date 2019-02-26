<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>My Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />
	<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'/>
	<link rel='stylesheet' href='/desktop/resources/css/index.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	<link rel='stylesheet' href='/desktop/resources/css/member.css' />
	<link rel='stylesheet' href='/desktop/resources/css/board.css' />
	<style>
		.my-myPage-memberinfo {
			margin: 20px 0 20px 0;
			padding: 30px 0 30px 0;
			border-top: 1px solid #ababab;
			border-bottom: 1px solid #ababab;
		}
		.my-col2 {
			border-right: 1px solid #bbb;
		}
		#profile-image {
			width: 102px;
			height: 96px;
			border-radius: 40px;
		}
		.my-tabs li {
			margin-right: 3px;
			padding: 0 5px 0 5px;
			border: 1px solid #bbb;
			border-bottom: none;
			border-radius: 5px;
		}
		#navtab-info-tag {
			border: none;
		}
		.my-tabs li:hover {
			background-color: #bcbcbc;
		}
		.my-tabs li a {
			color: #676767;
		}
		.my-tabs li a:hover {
			color: #38b3ef;
			text-decoration: none;
		}
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src='/desktop/resources/js/index.js'></script>
	<script src='/desktop/resources/js/component.js'></script>
	<script src='/desktop/resources/js/member.js'></script>
	<script src='/desktop/resources/js/board.js'></script>
</head>
<body>

	<c:if test='${not empty requestScope.vo }'>
		<c:set var='mvo' value='${requestScope.vo }' scope='page' />
	</c:if>

	<!-- include navBar(aside) -->
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
		<jsp:include page="/WEB-INF/views/component/navBar_aside.jsp"></jsp:include>
	</div>

	<!-- include content -->
	<div id='boardContent' style='z-index: 0;'>
		<button class='btn btn-sm btn-light' id='btnShowNavbar' style='position: fixed; top: 20px; left: 10px;'>&gt;&gt;</button>
		<!-- top -->
		<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>
	
		<!-- middle component -->
		<div class='container'>
			<div class='container' style='margin: 50px auto;'>
				<h2>마이 페이지</h2>
				<p>나만의 개성있는 프로필을 만드세요!</p>
				
				<div class='row my-myPage-memberinfo'>
					<div class='col-sm-2 my-col2'>
						<img src='/desktop/resources/imgs/damuni.jpg' id='profile-image'alt='profile image'/><br/><br/>
						구독자 수<br/><br/>
						웹페이지<br/><br/>
						활동
					</div>
					<hr/>
					<div class='col-sm-10'>
						<ul class='nav nav-tabs my-tabs'>
							<li class='active' id='navtab-profile-tag'><a data-toggle='tab' href='#profile-tag'>프로필</a></li>
							<li id='navtab-info-tag'><a data-toggle='tab' href='#info-tag'>회원정보</a></li>
						</ul>
						<hr/>
						
						<div class='tab-content my-tab-pane'>
							<div id='profile-tag' class='tab-pane fade'>
								<div id='memberProfileContent'></div>
							</div>
							<div id='info-tag' class='tab-pane fade'>
								<div id='memberInfoContent'></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			
		</div>
	
		<!-- include footer -->
		<footer>
			<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
		</footer>
	</div>
	
	<!-- button for to-top -->
	<a class='btn btn-secondary my-btn-toTop' href='#' onclick='funcMovePage("indexTop");'>top</a>
	
	<!-- Modal -->
    <button id="modalBtn" style='display: none;'>Open Modal</button>
    <div id="mainModal" class="modal">
    	
	    <!-- Modal content -->
	    <div class="modal-content">
	   		<div id='innerContent'></div>
	   		<span class="close">닫기</span>
	    </div>
	    
    </div>
    
    <script>
    	$(function () {
    		$('#navtab-profile-tag').click(function () {
				$('#navtab-info-tag').css({'border':'none'});
				$('#navtab-profile-tag').css({'border':'1px solid #bbb', 'border-bottom':'none'});
				
				$.ajax({
					type: 'get',
					url: '/desktop/member/memberProfileForm',
					dataType: 'html',
					success: function (html, status) {
						
						$('#memberProfileContent').html(html);
						
						// 에러코드 0 이면 세션아이디 없음, 에러코드 1 이면 조회된 결과 없음
						if ($('#flag').text() == "0") { // 세션아이디 없음
							alert('접속 정보가 존재하지 않습니다. 로그인 후 이용하세요.');
							/* $.ajax({
								type: 'get',
								url: '/desktop/member/loginForm',
								dataType: 'html',
								success: function (html, status) {
									
									innerModalContent.innerHTML = html;
									modalWindow.style.display = 'block';
									
									funcLoginAction();
								}
							}); */
							location.href = '/desktop';
						} else if ($('#flag').text() == "1") { // 조회결과 없음 (vo == null)
							alert('현재 접속정보로 조회된 회원정보가 존재하지 않습니다. 확인 후 이용해주세요.');
							location.href = '/desktop';
						} else if ($('#flag').text() == "2"){
							funcMemberInfo();
						} else {
							alert('예상치 못한 에러 발생. 관리자에게 문의하십시오.');
							location.href = '/desktop';
						}
					}
				});
			});
    		
			$('#navtab-info-tag').click(function () {
				$('#navtab-profile-tag').css({'border':'none'});
				$('#navtab-info-tag').css({'border':'1px solid #bbb', 'border-bottom':'none'});
				
				$.ajax({
					type: 'get',
					url: '/desktop/member/memberInfoForm',
					dataType: 'html',
					success: function (html, status) {
						
						$('#memberInfoContent').html(html);
						$('#memberImg').css({'display':'none'});
						
						// 에러코드 0 이면 세션아이디 없음, 에러코드 1 이면 조회된 결과 없음
						if ($('#flag').text() == "0") { // 세션아이디 없음
							alert('접속 정보가 존재하지 않습니다. 로그인 후 이용하세요.');
							/* $.ajax({
								type: 'get',
								url: '/desktop/member/loginForm',
								dataType: 'html',
								success: function (html, status) {
									
									innerModalContent.innerHTML = html;
									modalWindow.style.display = 'block';
									
									funcLoginAction();
								}
							}); */
							location.href = '/desktop';
						} else if ($('#flag').text() == "1") { // 조회결과 없음 (vo == null)
							alert('현재 접속정보로 조회된 회원정보가 존재하지 않습니다. 확인 후 이용해주세요.');
							location.href = '/desktop';
						} else if ($('#flag').text() == "2"){
							funcMemberInfo();
						} else {
							alert('예상치 못한 에러 발생. 관리자에게 문의하십시오.');
							location.href = '/desktop';
						}
					}
				});
			});
    	});
    </script>

</body>
</html>