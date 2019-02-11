/**
 * 
 */
window.onload = function () {
	var xhr = new XMLHttpReqeust();
	var infoContent = document.getElementById('infoContent');
	
}

function getProfilePage (xhr, infoContent) {
	xhr.open('get', '/controller/member/memberProfilePage');
	xhr.send();
	xhr.onreadstatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			infoContent = xhr.responseText;
		}
	}
}