/*
 * 작성자: 라대성
 * 작성일: 190218
 * 기능: boardListPage
 */
$(function () {
	// get window size
	$(window).resize(function () {
		getWindowSize();
	});
	
	// 게시판 리스트 부분으로 이동
	$('#toBoardList').click(function () {
		funcMovePage('boardListView');
	});
	// top 부분으로 이동
	$('.my-btn-toTop').click(function () {
		funcMovePage('indexTop');
	});
	
	// top 의 돋보기 아이콘 배치
	$('.searchForm .icon').css({"margin-top":"-12px"});
	
	// 게시글 리스트 미리보기
	$('.my-board-grid-title').tooltip();
	$('.my-board-grid-bookTitle').tooltip();
	
	// 글 상세보기 페이지로 이동
	$('.boardViewAncMini').tooltip();
	
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
	
});