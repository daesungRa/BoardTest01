/*
 * index.jsp
 */

/*
 * loginForm.jsp
 */
function mainLoginForm () {
	var frm = document.loginFrm;
	var btn = frm.btnSubmit;
	btn.onclick = function () {
		if (frm.userId.value == '') {
			alert('아이디를 입력하세요');
			frm.userId.focus();
		} else if (frm.userPwd.value == '') {
			alert('비밀번호를 입력하세요');
			frm.userPwd.focus();
		} else {
			frm.submit();
		}
	}
}

/*
 * joinForm.jsp
 * 각 항목 입력 시 자동 무결성체크
 */
	// 메인 함수 (페이지 로드 시 항상 돈다)
function funcJoinForm () {
	var frm = document.joinFrm;
	var xhr = new XMLHttpRequest();

	frm.userId.focus();
	frm.userId.select();
	
	// userId
	frm.btnIdChk.onclick = function () {
		funcIdChk(xhr);
	}
	// userPwd
	frm.userPwd01.onkeyup = function () {
		funcPwdChk(userPwd01, userPwd02);
	}
	frm.userPwd02.onkeyup = function () {
		funcPwdChk(userPwd01, userPwd02);
	}
	// userName
	frm.userName.onkeyup = function () {
		funcNameChk();
	}
	// email
	frm.email.onkeyup = function () {
		funcEmailChk();
	}
	// phone
	frm.phone.onkeyup = function () {
		funcPhoneChk();
	}
	// postal, address
	frm.btnPostal.onclick = function () {
        searchPostal();
    }
	// photo file
	frm.photo.onchange = imagePreView;
	// btn submit
	frm.btnSubmit.onclick = function () {
		funcSubmit(frm);
	}
	// cancel
	frm.btnCancel.onclick = function () {
		window.location.reload();
	}
}
	// 아이디 체크 함수
function funcIdChk (xhr) {
	var userId = document.getElementById('userId');
	var btnIdChk = document.getElementById('btnIdChk');
	var userIdChk = document.getElementById('userIdChk');
	var userIdChkResult = document.getElementById('userIdChkResult');
	
	if (userId.value == '') {
		alert('아이디를 입력하세요');
		userId.focus();
		return;
	}

	if (btnIdChk.value == '중복확인') {
		xhr.open('post', '/controller/member/idChk');
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send('userId=' + userId.value);
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var result = xhr.responseText;
				if (result != '1') {
					alert('아이디 중복확인 완료');
					userId.setAttribute("readonly", true);
					userIdChk.value = 'checked';
					btnIdChk.value = '재설정';
					userIdChkResult.innerHTML = '중복확인 완료';
				} else {
					alert('이미 존재하는 아이디입니다');
					userIdChk.value = 'unChecked';
					userId.focus();
					userId.select();
					userIdChkResult.innerHTML = '';
				}
			}
		}
	} else if (btnIdChk.value == '재설정') {
		userId.removeAttribute("readonly");
		userIdChk.value = 'unChecked';
		btnIdChk.value = '중복확인';
		userId.focus();
		userId.select();
		userIdChkResult.innerHTML = '';
	}
}
	// 비번 체크 함수
function funcPwdChk (userPwd01, userPwd02) {
	var userPwdChk = document.getElementById('userPwdChk');
	var userPwdChkResult = document.getElementById('userPwdChkResult');
	
	if (userPwd01.value != userPwd02.value || userPwd01.value == '') {
		userPwdChk.value = 'unChecked';
		userPwdChkResult.innerHTML = '비밀번호가 일치하지 않습니다';
	} else if (userPwd01.value == userPwd02.value || userPwd01.value != '') {
		userPwdChk.value = 'checked';
		userPwdChkResult.innerHTML = '';
	}
}
	// 이름 체크 함수
function funcNameChk () {
	var userNameExp = /^[가-힣a-zA-Z]+$/;
	var userName = document.getElementById('userName');
	var userNameChk = document.getElementById('userNameChk');
	var userNameChkResult = document.getElementById('userNameChkResult');
	
	if (userNameExp.test(userName.value)) {
		userNameChk.value = 'checked';
		userNameChkResult.innerHTML = '';
	} else {
		userNameChk.value = 'unChecked';
		userNameChkResult.innerHTML = '한글 혹은 영문으로만 입력하십시오';
	}
}
	// 이메일 체크
function funcEmailChk () {
	var emailExp = /^\w+@\w+.\w(.\w){1,2}/;
	var email = document.getElementById('email');
	var emailChk = document.getElementById('emailChk');
	var emailChkResult = document.getElementById('emailChkResult');
	
	if (emailExp.test(email.value)) {
		emailChk.value = 'checked';
		emailChkResult.innerHTML = '';
	} else {
		emailChk.value = 'unChecked';
		emailChkResult.innerHTML = '이메일 형식에 맞게 입력하십시오';
	}
}
	// 전화번호 체크
function funcPhoneChk () {
	var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var phone = document.getElementById('phone');
	var phoneChk = document.getElementById('phoneChk');
	var phoneChkResult = document.getElementById('phoneChkResult');
	
	if (phoneExp.test(phone.value)) {
		phoneChk.value = 'checked';
		phoneChkResult.innerHTML = '';
	} else {
		phoneChk.value = 'unChecked';
		phoneChkResult.innerHTML = '연락처 형식에 맞게 입력하십시오';
	}
}
	// 우편번호 찾기 API (daum kakao)
function searchPostal () {
    new daum.Postcode({
        oncomplete: function(data) {
            var frm = document.joinFrm;
            frm.postal.value = data.zonecode;
            frm.address.value = data.address;
        }
    }).open();
}
	// 이미지 미리보기 함수
function imagePreView (e) {
    var profile = document.getElementById('image');
    var url = e.srcElement;
    var file = url.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (e2) {
        var img = new Image();
        img.src = e2.target.result;
        profile.src = img.src;
    }
}
	// 최종 제출 함수
function funcSubmit (frm) {
	// 폼 내부 모든 input 중 타입이 hidden 인 태그만 검증
	var inputs = frm.getElementsByTagName('input');
	for (var i = 0; i < inputs.length; i++) {
		var tag = inputs[i];
		if (tag.type.toLowerCase() == 'hidden') {
			var chkState = tag.value;
			// 현재 태그가 unChecked 상태라면 메시지 발생 후 포커싱
			if (chkState == 'unChecked') {
				if (tag.id == 'userIdChk') {
					alert('아이디 중복확인이 필요합니다');
					frm.userId.focus();
					frm.userId.select();
					return;
				} else if (tag.id == 'userPwdChk') {
					alert('비밀번호는 영문, 숫자, 특수문자 조합만 가능합니다');
					frm.userPwd.focus();
					frm.userPwd.select();
					return;
				} else if (tag.id == 'userNameChk') {
					alert('이름은 한글 혹은 영문으로만 입력하십시오');
					frm.userName.focus();
					frm.userName.select();
					return;
				} else if (tag.id == 'emailChk') {
					alert('이메일 형식에 맞게 입력하십시오');
					frm.email.focus();
					frm.email.select();
					return;
				} else if (tag.id == 'phoneChk') {
					alert("연락처 형식에 맞게 입력하십시오 ( '-' 포함)");
					frm.phone.focus();
					frm.phone.select();
					return;
				}
			}
		}
	} // 입력 데이터 검증 로직 끝
	
	frm.submit();
} // end of joinForm method