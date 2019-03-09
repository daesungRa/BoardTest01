/*
 * 작성자: 라대성
 * 작성일: 190309
 * 기능: admin 페이지 관련 스크립트 모음
 */
$(function () {
	$('#indexTop #adminComponentInTop').css({"display":"block"});
	
	$('#adminArticle #showMemberAdminComponent').click(function () {
		$('#adminArticle #showMemberAdminComponent').css({"display":"none"});
		$('#adminArticle #hideAlign').css({"display":"block"});
		$('#adminArticle #memberAdminComponent').css({"display":"block"});
		
		funcMovePage('memberAdminComponent');
	});
	
	$('#adminArticle #hideMemberAdminComponent').click(function () {
		$('#adminArticle #showMemberAdminComponent').css({"display":"inline-block"});
		$('#adminArticle #hideAlign').css({"display":"none"});
		$('#adminArticle #memberAdminComponent').css({"display":"none"});
		
		funcMovePage('adminPageTitle');
	});
})