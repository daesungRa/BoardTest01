/*
 * 작성자: 라대성
 * 작성일: 190209
 * 기능: index 페이지, member 정보와 관련된 모든 스크립트 모음
 */

$(function () {
	var xhr = new XMLHttpRequest();
	
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
	
		// Get the modal
    var modal = document.getElementById('mainModal');
    var btnModal = document.getElementById("modalBtn");
    var modalClose = document.getElementsByClassName("close")[0];                                          

    btnModal.onclick = function() {
        modal.style.display = "block";
    }
    modalClose.onclick = function() {
        modal.style.display = "none";
    }
    window.onclick = function(ev) {
        if (ev.target == modal) {
            modal.style.display = "none";
        }
    }
    
    /*
     * loginForm page
     */
	
	/*
	 * joinForm page
	 * 각 항목 입력 시 자동 무결성체크
	 */
	
	/*
	 * navBar
	 */
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
	
	/* 로그인, 조인 */
	loginAnc.onclick = function () {
		var mainModal = document.getElementById('mainModal'); // 모달 화면
		var modalContent = document.getElementById('innerContent'); // 모달 내용
		xhr.open('get', '/desktop/member/loginForm');
		xhr.send();
		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				document.getElementsByClassName('modal-content')[0].setAttribute('style', 'height: 60%; margin: 12% auto;');
				modalContent.setAttribute('style', 'position: absolute; width: 96%; height: 90%; top: -10px;');
				modalContent.innerHTML = xhr.responseText;
				$("#modalBtn").trigger("click");
				
				loginlogin();
			}
		}
	}
	
	joinAnc.onclick = function () {
		var mainModal = document.getElementById('mainModal'); // 모달 화면
		var modalContent = document.getElementById('innerContent'); // 모달 내용
		xhr.open('get', '/desktop/member/joinForm');
		xhr.send();
		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				document.getElementsByClassName('modal-content')[0].setAttribute('style', 'height: 78%; margin: 7% auto;');
				modalContent.setAttribute('style', 'position: absolute; width: 97%; height: 90%; top: 0;');
				modalContent.innerHTML = xhr.responseText;
				$("#modalBtn").trigger("click");
				
				joinjoin(xhr);
			}
		}
	}
});

/*
 * memberInfo.jsp (프로필 관리 페이지 혹은 회원정보 조회 페이지로 분기, 전자가 디폴트)
 * 각 분기는 ajax 로 비동기 로드
 * 각 분기에 따라 navbar 스크립트를 다르게 해야 한다 (해당 항목에 하이라이트 속성 추가)
 */
