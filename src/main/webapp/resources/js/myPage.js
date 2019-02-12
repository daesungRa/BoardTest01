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
	// 수정/삭제 버튼
	var btn01 = document.getElementById('btn01');
	var btn03 = document.getElementById('btn03');
	
	// 최초 페이지 로드 시 프로필 페이지 로드 실행
	getProfilePage(xhr, infoContent);
	
	// 각 앵커 태그 클릭시 실행
	memberProfileAnc.onclick = function () {
		getProfilePage(xhr, infoContent);
	}
	memberInfoAnc.onclick = function () {
		btn03.style.display = 'none';
		getInfoPage(xhr, infoContent);
	}
	
	// 수정/삭제 실행
	btn01.onclick = function () {
		getModifyPage(xhr, infoContent);
	}
	btn03.onclick = function () {
		btn03.style.display = 'none';
		getInfoPage(xhr, infoContent);
	}
}

function getProfilePage (xhr, infoContent) {
	document.getElementsByTagName('h2')[0].innerHTML = '프로필';
	document.getElementById('btn01').innerHTML = '프로필 수정/삭제';
	document.getElementById('btn02').innerHTML = '홈으로';
	document.getElementById('btn01').setAttribute('style', 'right: 110px;');
	xhr.open('get', '/controller/member/memberProfilePage');
	xhr.send();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			infoContent.innerHTML = xhr.responseText;
		}
	}
}
function getInfoPage (xhr, infoContent) {
	document.getElementsByTagName('h2')[0].innerHTML = '회원정보';
	document.getElementById('btn01').innerHTML = '회원정보 수정/탈퇴';
	document.getElementById('btn02').innerHTML = '홈으로';
	document.getElementById('btn01').setAttribute('style', 'right: 110px;');
	xhr.open('get', '/controller/member/memberInfoPage');
	xhr.send();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			infoContent.innerHTML = xhr.responseText;
		}
	}
}
function getModifyPage (xhr, infoContent) {
	document.getElementsByTagName('h2')[0].innerHTML = '회원정보 수정';
	document.getElementById('btn01').style.display = 'none';
	document.getElementById('btn03').removeAttribute('style');
	document.getElementById('btn03').innerHTML = '취소'
	document.getElementById('btn02').innerHTML = '홈으로';
	xhr.open('get', '/controller/member/memberModifyPage');
	xhr.send();
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			infoContent.innerHTML = xhr.responseText;
		}
	}
}