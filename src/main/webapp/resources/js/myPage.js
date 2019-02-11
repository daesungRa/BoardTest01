/**
 * myPage
 */
function funcMyPage () {
	// xhr, 페이지 로드 영역
	var xhr = new XMLHttpRequest();
	var infoContent = document.getElementById('infoContent');
	// 프로필 앵커, 회원정보 앵커
	var memberProfileAnc = document.getElementById('memberProfileAnc');
	var memberInfoAnc = document.getElementById('memberInfoAnc');
	
	// 최초 페이지 로드 시 프로필 페이지 로드 실행
	getProfilePage(xhr, infoContent);
	
	// 각 앵커 태그 클릭시 실행
	memberProfileAnc.onclick = function () {
		getProfilePage(xhr, infoContent);
	}
	memberInfoAnc.onclick = function () {
		getInfoPage(xhr, infoContent);
	}
}

function getProfilePage (xhr, infoContent) {
	document.getElementsByTagName('h2')[0].innerHTML = '프로필 관리';
	xhr.open('get', '/controller/member/memberProfilePage');
	xhr.send();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			infoContent.innerHTML = xhr.responseText;
		}
	}
}
function getInfoPage (xhr, infoContent) {
	document.getElementsByTagName('h2')[0].innerHTML = '회원정보 관리';
	xhr.open('get', '/controller/member/memberInfoPage');
	xhr.send();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			infoContent.innerHTML = xhr.responseText;
		}
	}
}