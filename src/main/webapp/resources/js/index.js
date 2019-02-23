/*
 * 작성자: 라대성
 * 작성일: 190209
 * 기능: index 페이지, member 정보와 관련된 모든 스크립트 모음
 */

$(function () {
	// modal
	var modalWindow = document.getElementById('modalWindow');
	var modalContent = document.getElementById('modalContent');
	var innerModalContent = document.getElementById('innerModalContent');
	
	
    // navbar
    var memberProfileAnc = document.getElementById('memberProfileAnc');
	var memberInfoAnc = document.getElementById('memberInfoAnc');
	var guestbookAnc = document.getElementById('guestbookAnc');
	var categoryAnc = document.getElementById('categoryAnc');
	var todayAnc = document.getElementById('todayAnc');
	var myDeskTopAnc = document.getElementById('myDeskTopAnc');
	var logoutAnc = document.getElementById('logoutAnc');
	var myPage = document.getElementById('myPage');
	var loginAnc = document.getElementById('loginAnc');
	var joinAnc = document.getElementById('joinAnc');
	
	/*
	 * index page
	 */
		// get window size
	$(window).resize(function () {
		getWindowSize();
	});
		// fade in
	$('.my-jumbo > h1').fadeOut(0);
	$('.my-jumbo > p').fadeOut(0);
	$('.my-jumbo > a').fadeOut(0);
	
	$('.my-jumbo > h1').fadeIn(1000);
	$('.my-jumbo > p').delay('slow').fadeIn(1000);
	$('.my-jumbo > a').delay('slow').fadeIn(1000);
		// modal action
	$(window).click(function (ev) { // 모달 외 화면 클릭 시
		if (ev.target == modalWindow) {
			modalWindow.style.display = 'none';
		}
	});
	$(window).keydown(function (ev) { // esc 버튼 입력 시
		if (ev.keyCode == '27') {
			modalWindow.style.display = 'none';
		}
	});
	$('#closeModal').click(function () {
		modalWindow.style.display = 'none';
	});
	
	/*
	 * navBar
	 */	
		// 모달에 로그인 폼 로드
		// 이후 funcLoginAction 함수 실행
	$('#loginAnc').click(function () {
		$.ajax({
			type: 'get',
			url: '/desktop/member/loginForm',
			dataType: 'html',
			success: function (html, status) {
				modalContent.setAttribute('style', 'height: 60%; margin: 12% auto;');
				innerModalContent.setAttribute('style', 'position: absolute; width: 96%; height: 90%; top: -10px;');
				
				innerModalContent.innerHTML = html;
				modalWindow.style.display = 'block';
				
				funcLoginAction();
			}
		});
	})
		// 조인 모달 창 불러오기
		// 이후 funcJoinAction 함수 실행
	$('#joinAnc').click(function () {
		$.ajax({
			type: 'get',
			url: '/desktop/member/joinForm',
			dataType: 'html',
			success: function (html, status) {
				modalContent.setAttribute('style', 'height: 78%; margin: 7% auto;');
				innerModalContent.setAttribute('style', 'position: absolute; width: 97%; height: 90%; top: 0;');
				
				innerModalContent.innerHTML = html;
				modalWindow.style.display = 'block';
				
				funcJoinAction();
			}
		})
	});
		// 로그아웃
	$('#logoutAnc').click(function(){
		location.href ='/desktop/member/logout';
		alert("로그아웃되었습니다.");
	});
	
		// 마이페이지 로드
	/*myPage.click(function () {
		
	});*/
});

/*
 * memberInfo.jsp (프로필 관리 페이지 혹은 회원정보 조회 페이지로 분기, 전자가 디폴트)
 * 각 분기는 ajax 로 비동기 로드
 * 각 분기에 따라 navbar 스크립트를 다르게 해야 한다 (해당 항목에 하이라이트 속성 추가)
 */
