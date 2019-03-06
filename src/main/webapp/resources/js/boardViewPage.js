/*
 * 작성자: 라대성
 * 작성일: 190304
 * 기능: boardViewPage
 */
$(function () {
	/*
	 * component
	 */
	// top 의 돋보기 아이콘 배치
	$('.searchForm .icon').css({"margin-top":"-12px"});
	// 좌측 네비게이션 바 토글
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
	// top 부분으로 이동
	$('.my-btn-toTop').click(function () {
		funcMovePage('indexTop');
	});
	// 게시글 카테고리 바꾸기
	$('#changeCategoryInWritePage').change(function () {
		var category3 = $(this).children('option:selected').val();
		var requestUrl = '/desktop/board/boardListPage/' + category3;
		
		location.href = requestUrl;
	});
	// 댓글, 좋아요, 설정 부분의 tooltip
	$('#rightSideComponent #iconComment').tooltip();
	$('#rightSideComponent #iconThumbUpDown').tooltip();
	$('#rightSideComponent #iconSettings').tooltip();
	
	/*
	 * modify 페이지로 변경
	 */
	$('#toBoardModifyPage').click(function () {
		$('#categoryContent #titleName').text('글수정');
		$('#boardTitleContent').css({"display":"none"});
		$('#boardTextContent').css({"display":"none"});
		$('#boardModifyPage').css({"display":"block"});
		$('#boardCommentContent').css({"display":"none"});
		
		$('#summernote').summernote({
			minHeight: 300,
			maxHeight: 1000
		});
		
		$('.my-btn-toTop').trigger('click');
	});
	// modify submit
	$('#btnBoardModifySubmit').click(function () {
		var result = confirm('게시글을 수정하시겠습니까?');
		if (result) {
			$('#boardModifyAction').submit();
		}
	});
	// modify cancel
	$('#btnBoardModifyCancel').click(function () {
		location.reload();
	});
	
	/*
	 * 게시글 삭제
	 */
	$('#toBoardDeleteAction').click(function () {
		var serial = $('#boardModifyAction #serial').val();
		var result = confirm('해당 게시글을 삭제하시겠습니까?');
		if (result) {
			$.ajax({
				type: 'get',
				url: '/desktop/board/boardRemoveAction',
				dataType: 'html',
				data: {serial: serial},
				success: function (data) {
					if (data == '1') {
						var categoryNum = $('#boardViewContainer #saveCategoryNum').text();
						location.href = '/desktop/board/boardListPage/' + categoryNum + '/1';
					} else if (data == '0') {
						alert('게시글 삭제에 실패했습니다');
					}
				}
			});
		}
	});
});