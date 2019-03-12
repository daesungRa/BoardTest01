<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin book list part</title>
</head>
<body>

	<c:if test='${not empty requestScope.bkvoList and fn:length(requestScope.bkvoList) > 0 }'>
		<c:set var='bkvoList' value='${requestScope.bkvoList }' scope='page' />
		<c:set var='bkPageDto' value='${requestScope.bkPageDto }' scope='page' />
	</c:if>

	<div id='bookRegisterListBody'>
		<div style='position: relative; height: 50px;'>
			<span id='categoryContent' style='position: absolute; top: 20%; font-size: 12pt;'>
				<img src='/desktop/resources/imgs/document01.png' alt='icon_pencil for board' style='width: 18px; padding-bottom: 3px; margin-right: 10px;' /> 등록 요청된 책 목록
			</span>
			<form class='form' id='bookRegisterListForm' name='bookRegisterListForm' method='post' action='#' style='float: right;'>
				<input class='form-control' type='text' id='nowPage' name='nowPage' value='1' style='display: none;' />
				<select class='form-control' id='dateFlag' name='dateFlag' >
					<option value='0'>전체 기간 조회</option>
					<option value='1'>오늘</option>
					<option value='2'>어제부터</option>
					<option value='3' selected>최근 일주일</option>
					<option value='4'>최근 한 달</option>
				</select>
			</form>
		</div>
		<div class='row' style='height: 30px; font-size: 10pt; border-top: 2px solid black; border-bottom: 1px solid black; padding-top: 4px; background-color: #dedede;'>
			<div class='col-md-1'>책번호</div>
			<div class='col-md-3'>분류 / 승인 여부</div>
			<div class='col-md-2'>작성자</div>
			<div class='col-md-4'>책제목 / 작가</div>
			<div class='col-md-2'>등록일</div>
		</div>
		<c:choose>
			<c:when test='${not empty requestScope.bkvoList and fn:length(requestScope.bkvoList) > 0 }'>
				<c:forEach var="bkvo" items="${bkvoList }" >
					<div class='row my-adminList-row'>
						<div class='col-md-1' id='bookRegisterBookNo'>undef<%-- ${bkvo.bookNo } --%></div>
						<div class='col-md-3'>[${bkvo.category }]
							<c:choose>
								<c:when test='${bkvo.category == 1 }'>
									인문/사회/정치
								</c:when>
								<c:when test='${bkvo.category == 2 }'>
									경제/경영
								</c:when>
								<c:when test='${bkvo.category == 3 }'>
									과학/공학/수학/컴퓨터
								</c:when>
								<c:when test='${bkvo.category == 4 }'>
									문학/시/소설
								</c:when>
								<c:when test='${bkvo.category == 5 }'>
									문화/예술/자기계발/라이프
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test='${bkvo.isPermitted == 0 }'>
									/<span style='color: #ff7878;'> 승인되지 않음</span>
								</c:when>
								<c:when test='${bkvo.isPermitted == 1 }'>
									/<span style='color: #7878ff;'> 승인됨</span>
								</c:when>
							</c:choose>
						</div>
						<div class='col-md-2'>${bkvo.userId }</div>
						<div class='col-md-4'>${bkvo.title_kor }(${bkvo.title_eng }) / ${bkvo.author }</div>
						<div class='col-md-2'>${bkvo.pDate }</div>
					</div>
				</c:forEach>
				<c:if test='${not empty requestScope.bkPageDto }'>
					<div class='container' id='btnBookRegisterChangeGrp' style='height: 46px; font-size: 9pt; text-align: center; margin-top: 30px;'>
						<c:if test='${bkPageDto.nowPage >= 2 }'>
							<span class='btnAdminBtn'>처음<span style='display: none;'>1</span></span>
							<span class='btnAdminBtn'>이전<span style='display: none;'>${bkPageDto.nowPage - 1 }</span></span>
							<span class='btnAdminBtnBar'>|</span>
						</c:if>
						<c:forEach var='i' begin='${bkPageDto.startPage }' end='${bkPageDto.endPage }' step='1'>
							<c:choose>
								<c:when test='${bkPageDto.nowPage == i }'>
									<span class='btnAdminBtnNone'>${i }</span>
								</c:when>
								<c:otherwise>
									<span class='btnAdminBtn'>${i }<span style='display: none;'>${i }</span></span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test='${bkPageDto.nowPage < bkPageDto.totPage }'>
							<span class='btnAdminBtnBar'>|</span>
							<span class='btnAdminBtn'>다음<span style='display: none;'>${bkPageDto.nowPage + 1 }</span></span>
							<span class='btnAdminBtn'>마지막<span style='display: none;'>${bkPageDto.totPage }</span></span>
						</c:if>
					</div>
				</c:if>
			</c:when>
			<c:otherwise>
				<div style='height: 180px;'>
					<div id='noSelectResult'>
						<p>검색결과가 없습니다.</p>
					</div>
				</div><br/>
				<hr style='border-top: 3px double #8c8b8b;'/>
				<br/><br/>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>