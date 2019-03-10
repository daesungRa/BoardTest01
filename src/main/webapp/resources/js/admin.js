/*
 * 작성자: 라대성
 * 작성일: 190309
 * 기능: admin 페이지 관련 스크립트 모음
 */
$(function () {
	$('#indexTop #adminComponentInTop').css({"display":"block"});
	
	$('#showshowshow').click(function () {
		$.ajax({
			type: 'get',
			url: '/desktop/admin/getBoardReportList',
			dataType: 'html',
			success: function (html) {
				alert(html);
				$('#noSelectResult').html(html);
			}
		});
	});
	
	// navbar 의 회원관리 버튼 클릭 시 member admin component 보여주기
	$('#collapsibleNavbar #showMemberAdminComponentNav').click(function () {
		$('#adminArticle #showMemberAdminComponent').trigger('click');
	});
	
	// show member admin component
	$('#adminArticle #showMemberAdminComponent').click(function () {
		$('#adminArticle #showMemberAdminComponent').css({"display":"none"});
		$('#adminArticle #hideAlign').css({"display":"block"});
		$('#adminArticle #memberAdminComponent').css({"display":"block"});
		$('#adminArticle #hideMemberAdminComponentContainer').css({"display":"block"});
		
		funcMovePage('memberAdminComponent');
	});
	
	// hide member admin component
	$('#adminArticle #hideMemberAdminComponent').click(function () {
		$('#adminArticle #showMemberAdminComponent').css({"display":"inline-block"});
		$('#adminArticle #hideAlign').css({"display":"none"});
		$('#adminArticle #memberAdminComponent').css({"display":"none"});
		$('#adminArticle #hideMemberAdminComponentContainer').css({"display":"none"});
		
		funcMovePage('adminPageTitle');
	});
})