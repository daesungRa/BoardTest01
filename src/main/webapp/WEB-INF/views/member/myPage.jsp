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
		#image {
			width: 102px;
			height: 108px;
			border-radius: 40px;
		}
		#inputFNum {
			width: 56px;
			height: 29px;
			text-align: center;
			padding-top: 3px;
			color: #666;
			background-color: #eee;
			border-radius: 20px;
		}
		.my-tabs li {
			margin-right: 3px;
			padding: 0 5px 0 5px;
			border: 1px solid #bbb;
			border-bottom: none;
			border-radius: 5px;
		}
		#navtab-info-tag-li {
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
		
		/* The switch - the box around the slider */
		.switch {
		  position: relative;
		  display: inline-block;
		  width: 60px;
		  height: 34px;
		}
		
		/* Hide default HTML checkbox */
		.switch input {
		  opacity: 0;
		  width: 0;
		  height: 0;
		}
		
		/* The slider */
		.slider {
		  position: absolute;
		  cursor: pointer;
		  top: 0;
		  left: 0;
		  right: 0;
		  bottom: 0;
		  background-color: #ccc;
		  -webkit-transition: .4s;
		  transition: .4s;
		}
		.slider:before {
		  position: absolute;
		  content: "";
		  height: 26px;
		  width: 26px;
		  left: 4px;
		  bottom: 4px;
		  background-color: white;
		  -webkit-transition: .4s;
		  transition: .4s;
		}
		input:checked + .slider {
		  background-color: #2196F3;
		}
		input:focus + .slider {
		  box-shadow: 0 0 1px #2196F3;
		}
		input:checked + .slider:before {
		  -webkit-transform: translateX(26px);
		  -ms-transform: translateX(26px);
		  transform: translateX(26px);
		}
		
		/* Rounded sliders */
		.slider.round {
		  border-radius: 34px;
		}
		.slider.round:before {
		  border-radius: 50%;
		}
		
		#descIsPublic {
			position: absolute;
			left: 10px;
			top: 3px;
		}
		#descIsPublic:hover {
			color: #777;
			cursor: pointer;
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
			<div class='container' style='width: 80%; margin: 50px auto;'>
				<h2>마이 페이지</h2>
				<p>나만의 매력적인 프로필을 만드세요!</p>
				
				<div class='row my-myPage-memberinfo'>
					<div class='col-sm-2 my-col2'>
						<img src='/desktop/resources/imgs/blank_profile01.png' id='image' alt='profile image'/><br/><br/>
						구독자 수<br/>
						<div id='inputFNum'></div><br/>
						구독중인 작가<br/>
						<div id='inputFollowee'><a href='#'>보기 &gt;</a></div><br/>
						웹페이지<br/>
						<div id='inputWebPage'></div><br/>
						활동<br/>
						<div id='inputActivity'></div><br/>
						계정 생성일<br/>
						<div id='inputMDate'></div>
					</div>
					<hr/>
					<div class='col-sm-10'>
						<ul class='nav nav-tabs my-tabs'>
							<li class='active' id='navtab-profile-tag-li'><a data-toggle='tab' id='navtab-profile-tag' href='#profile-tag'>프로필</a></li>
							<li id='navtab-info-tag-li'><a data-toggle='tab' id='navtab-info-tag' href='#info-tag'>회원정보</a></li>
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
    		/*
    		 * navbar aside
    		 */   			
   			$('#btnShowNavbar').click(function () {
   				$('#navbarAside').animate({width:'toggle'}, 350);
   				if ($('#btnShowNavbar').text() == '<<') {
   					$('#btnShowNavbar').text('>>');
   					$('#btnShowNavbar').animate({left:'-=17%'}, 350);
   					$('#boardContent').animate({margin: '0 0 0 0'}, 350);
   					/*$('#navbarAside').css({"display":"none"});*/
   				} else if ($('#btnShowNavbar').text() == '>>') {
   					$('#btnShowNavbar').text('<<');
   					$('#btnShowNavbar').animate({left: '+=17%'}, 350);
   					$('#boardContent').animate({margin: '0 0 0 17%'}, 350);
   					/*$('#navbarAside').css({"display":"block"});*/
   				}
   			});
    		 
    		/*
    		 * 프로필, 회원정보
    		 */
    		$('#navtab-profile-tag').click(function () {
				$('#navtab-info-tag-li').css({'border':'none'});
				$('#navtab-profile-tag-li').css({'border':'1px solid #bbb', 'border-bottom':'none'});
				
				$.ajax({
					type: 'get',
					url: '/desktop/member/memberProfileForm',
					dataType: 'html',
					success: function (html, status) {
						
						$('#memberProfileContent').html(html);
						$('.my-myPage-memberinfo #image').attr('src', $('#profileForm #photoPath').val());
						$('.my-myPage-memberinfo #inputFNum').text($('#profileForm #fNum').val() + ' 명');
						$('.my-myPage-memberinfo #inputMDate').text($('#profileForm #mDate').val());
						
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
				$('#navtab-profile-tag-li').css({'border':'none'});
				$('#navtab-info-tag-li').css({'border':'1px solid #bbb', 'border-bottom':'none'});
				
				$.ajax({
					type: 'get',
					url: '/desktop/member/memberInfoForm',
					dataType: 'html',
					success: function (html, status) {
						
						$('#memberInfoContent').html(html);
						$('#memberImg').css({'display':'none'});
						$('.my-myPage-memberinfo #image').attr('src', $('#memberImg #image').attr('src'));
						$('.my-myPage-memberinfo #inputFNum').text($('#joinFrm #fNum').val());
						$('.my-myPage-memberinfo #inputMDate').text($('#joinFrm #mDate').val());
						
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
			$('#navtab-profile-tag').trigger('click');
    	});
    </script>

</body>
</html>