/*
 * 작성자: 라대성
 * 작성일: 190217
 * 기능: 페이지를 구성하는 요소들를 대상으로 하는 스크립트 (top, navbar, loginForm, joinForm, header, footer, toTop)
 */

/* 페이지 내 링크 이동 함수 */
function funcMovePage (page) {
	if (page == 'main') { // 최상단 타이틀 클릭시
		location.href = '/desktop';
		
		return;
	}
	var offset = $("#" + page).offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
    
    switch (page) {
    case 'indexTop':
    	$('.my-jumbo > h1').fadeOut(0);
    	$('.my-jumbo > p').fadeOut(0);
    	$('.my-jumbo > a').fadeOut(0);
    	
    	$('.my-jumbo > h1').fadeIn(1000);
    	$('.my-jumbo > p').delay('slow').fadeIn(1000);
    	$('.my-jumbo > a').delay('slow').fadeIn(1000);
    	break;
    case 'indexHeader':
    	$('.my-jumbo > h1').fadeOut(0);
    	$('.my-jumbo > p').fadeOut(0);
    	$('.my-jumbo > a').fadeOut(0);
    	
    	$('.my-jumbo > h1').fadeIn(1000);
    	$('.my-jumbo > p').delay('slow').fadeIn(1000);
    	$('.my-jumbo > a').delay('slow').fadeIn(1000);
    	
    	break;
    case 'indexContent':
    	
    	break;
    case 'indexFooter':
    	
    	break;
    }
}

/* 브라우저 사이즈 표시 함수 */
function getWindowSize () {
	var width = window.outerWidth;
	$('#windowSize').text('window size : ' + width);
}