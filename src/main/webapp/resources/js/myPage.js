/*
 * 작성자: 라대성
 * 작성일: 190216
 * 기능: mypage
 */

$(function () {
	// get window size
	$(window).resize(function () {
		getWindowSize();
	});
	
	// xhr, 페이지 로드 영역
	var xhr = new XMLHttpRequest();
	var mypageInfoContent = document.getElementById('mypageInfoContent');
	// 프로필 앵커, 회원정보 앵커
	var memberProfileAnc = document.getElementById('memberProfileAnc');
	var memberInfoAnc = document.getElementById('memberInfoAnc');
	// 수정/삭제 버튼
	var mypageBtn01 = document.getElementById('mypageBtn01');
	var mypageBtn03 = document.getElementById('mypageBtn03');
	
	// 최초 페이지 로드 시 프로필 페이지 로드 실행
	getProfilePage(xhr, mypageInfoContent);
	
	// 각 앵커 태그 클릭시 실행
	memberProfileAnc.onclick = function () {
		getProfilePage(xhr, mypageInfoContent);
	}
	memberInfoAnc.onclick = function () {
		mypageBtn03.style.display = 'none';
		getInfoPage(xhr, mypageInfoContent);
	}
	
	// 수정/삭제 실행
	mypageBtn01.onclick = function () {
		getModifyPage(xhr, mypageInfoContent);
	}
	mypageBtn03.onclick = function () {
		mypageBtn03.style.display = 'none';
		getInfoPage(xhr, mypageInfoContent);
	}
});

function getProfilePage (xhr, mypageInfoContent) {
	document.getElementsByTagName('h2')[0].innerHTML = '프로필';
	document.getElementById('mypageBtn01').innerHTML = '프로필 수정/삭제';
	document.getElementById('mypageBtn02').innerHTML = '홈으로';
	document.getElementById('mypageBtn01').setAttribute('style', 'right: 110px;');
	xhr.open('get', '/desktop/member/memberProfilePage');
	xhr.send();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			mypageInfoContent.innerHTML = xhr.responseText;
		}
	}
}
function getInfoPage (xhr, mypageInfoContent) {
	document.getElementsByTagName('h2')[0].innerHTML = '회원정보';
	document.getElementById('mypageBtn01').innerHTML = '회원정보 수정/탈퇴';
	document.getElementById('mypageBtn02').innerHTML = '홈으로';
	document.getElementById('mypageBtn01').setAttribute('style', 'right: 110px;');
	xhr.open('get', '/desktop/member/memberInfoPage');
	xhr.send();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			mypageInfoContent.innerHTML = xhr.responseText;
		}
	}
}
function getModifyPage (xhr, mypageInfoContent) {
	document.getElementsByTagName('h2')[0].innerHTML = '회원정보 수정';
	document.getElementById('mypageBtn01').style.display = 'none';
	document.getElementById('mypageBtn03').removeAttribute('style');
	document.getElementById('mypageBtn03').innerHTML = '취소'
	document.getElementById('mypageBtn02').innerHTML = '홈으로';
	xhr.open('get', '/desktop/member/memberModifyPage');
	xhr.send();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			mypageInfoContent.innerHTML = xhr.responseText;
		}
	}
}