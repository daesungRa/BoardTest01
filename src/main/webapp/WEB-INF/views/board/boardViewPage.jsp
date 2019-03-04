<%@page import="com.daesungra.domain.BoardVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Board View Page</title>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'/>
	<link rel='stylesheet' href='/desktop/resources/css/boardListPage.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
	<script src='/desktop/resources/js/boardWritePage.js'></script>
	<script src='/desktop/resources/js/component.js'></script>
</head>
<body>

	<c:choose>
		<c:when test='${not empty requestScope.boardVo }'>
			<c:set var='bvo' value='${requestScope.boardVo }' scope="page"></c:set>
			<c:set var='categoryNum' value='${bvo.category }' scope="page"></c:set>
		</c:when>
		<c:when test='${not empty requestScope.category }'>
			<c:set var='categoryNum' value='${requestScope.category }' scope="page"></c:set>
		</c:when>
	</c:choose>

	<!-- include navBar(aside) -->
	<jsp:include page="/WEB-INF/views/component/navBar_aside.jsp"></jsp:include>
	
	<!-- include content -->
	<div id='boardContent' style='z-index: 0;'>
		<button class='btn btn-sm btn-light' id='btnShowNavbar'>&gt;&gt;</button>
		<!-- top -->
		<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>
		
		<!-- middle component -->
		<div class='container'>
			<div class='container' id='boardList' style='width: 96%; border-right: 1px solid #bfbfbf; border-left: 1px solid #bfbfbf; padding: 20px 120px 20px 120px;'>
				<div style='position: relative; height: 80px;'>
					<div id='saveCategoryNum' style='display: none;'>${categoryNum }</div>
					<c:choose>
						<c:when test='${requestScope.category == 2 }'>
							<span id='categoryContent' style='position: absolute; top: 20%; font-size: 14pt;  width: 180px;'><img src='/desktop/resources/imgs/icon_pencil01.png' alt='icon_pencil for board' style='width: 15px; padding-bottom: 3px; margin-right: 10px;' />글쓰기</span>
							<span id='showCategoryContent'  style='position: absolute; top: 30%; left: 83px; color: #898989; font-size: 6pt; text-align: center; padding: 1px 3px 1px 3px;'>경제 / 경영</span>
							<select class='form-control' id='changeCategoryInWritePage' style='position: absolute; top: 20%; right: 0; font-size: 8pt; width: 16%; height: 29px;'>
								<option value='1'>인문/사회/정치</option>
								<option value='2' selected>경제/경영</option>
								<option value='3'>과학/공학/수학/컴퓨터</option>
								<option value='4'>문학/시/소설</option>
								<option value='5'>문화/예술/자기계발/라이프</option>
							</select>
						</c:when>
						<c:when test='${requestScope.category == 3 }'>
							<span id='categoryContent' style='position: absolute; top: 20%; font-size: 14pt;  width: 180px;'><img src='/desktop/resources/imgs/icon_pencil01.png' alt='icon_pencil for board' style='width: 15px; padding-bottom: 3px; margin-right: 10px;' />글쓰기</span>
							<span id='showCategoryContent'  style='position: absolute; top: 30%; left: 83px; color: #898989; font-size: 6pt; text-align: center; padding: 1px 3px 1px 3px;'>과학 / 공학 / 수학 / 컴퓨터</span>
							<select class='form-control' id='changeCategoryInWritePage' style='position: absolute; top: 20%; right: 0; font-size: 8pt; width: 24%; height: 29px;'>
								<option value='1'>인문/사회/정치</option>
								<option value='2'>경제/경영</option>
								<option value='3' selected>과학/공학/수학/컴퓨터</option>
								<option value='4'>문학/시/소설</option>
								<option value='5'>문화/예술/자기계발/라이프</option>
							</select>
						</c:when>
						<c:when test='${requestScope.category == 4 }'>
							<span id='categoryContent' style='position: absolute; top: 20%; font-size: 14pt;  width: 180px;'><img src='/desktop/resources/imgs/icon_pencil01.png' alt='icon_pencil for board' style='width: 15px; padding-bottom: 3px; margin-right: 10px;' />글쓰기</span>
							<span id='showCategoryContent'  style='position: absolute; top: 30%; left: 83px; color: #898989; font-size: 6pt; text-align: center; padding: 1px 3px 1px 3px;'>문학 / 시 / 소설</span>
							<select class='form-control' id='changeCategoryInWritePage' style='position: absolute; top: 20%; right: 0; font-size: 8pt; width: 17%; height: 29px;'>
								<option value='1'>인문/사회/정치</option>
								<option value='2'>경제/경영</option>
								<option value='3'>과학/공학/수학/컴퓨터</option>
								<option value='4' selected>문학/시/소설</option>
								<option value='5'>문화/예술/자기계발/라이프</option>
							</select>
						</c:when>
						<c:when test='${requestScope.category == 5 }'>
							<span id='categoryContent' style='position: absolute; top: 20%; font-size: 14pt;  width: 180px;'><img src='/desktop/resources/imgs/icon_pencil01.png' alt='icon_pencil for board' style='width: 15px; padding-bottom: 3px; margin-right: 10px;' />글쓰기</span>
							<span id='showCategoryContent'  style='position: absolute; top: 30%; left: 83px; color: #898989; font-size: 6pt; text-align: center; padding: 1px 3px 1px 3px;'>문화 / 예술 / 자기계발 / 라이프</span>
							<select class='form-control' id='changeCategoryInWritePage' style='position: absolute; top: 20%; right: 0; font-size: 8pt; width: 27%; height: 29px;'>
								<option value='1'>인문/사회/정치</option>
								<option value='2'>경제/경영</option>
								<option value='3'>과학/공학/수학/컴퓨터</option>
								<option value='4'>문학/시/소설</option>
								<option value='5' selected>문화/예술/자기계발/라이프</option>
							</select>
						</c:when>
						<c:otherwise>
							<span id='categoryContent' style='position: absolute; top: 20%; font-size: 14pt;  width: 180px;'><img src='/desktop/resources/imgs/icon_pencil01.png' alt='icon_pencil for board' style='width: 15px; padding-bottom: 3px; margin-right: 10px;' />글보기</span>
							<span id='showCategoryContent'  style='position: absolute; top: 30%; left: 83px; color: #898989; font-size: 6pt; text-align: center; padding: 1px 3px 1px 3px;'>인문 / 사회 / 정치</span>
							<select class='form-control' id='changeCategoryInWritePage' style='position: absolute; top: 20%; right: 0; font-size: 8pt; width: 18%; height: 29px;'>
								<option value='1' selected>인문/사회/정치</option>
								<option value='2'>경제/경영</option>
								<option value='3'>과학/공학/수학/컴퓨터</option>
								<option value='4'>문학/시/소설</option>
								<option value='5'>문화/예술/자기계발/라이프</option>
							</select>
						</c:otherwise>
					</c:choose>
					<br/>
					<hr style='border-top: 3px double #8c8b8b; margin-top: 30px;'/>
				</div>
				
				<div class='container' style='position: relative; height: 90px; margin: 60px auto;'>
					<div style='position: absolute; top: 0; left: 0; width: 30px; height: 50px; display: none'>${bvo.serial }</div>
					<div style='position: absolute; top: 0; left: 30px;'>
						<div style='display: inline-block; font-size: 16pt; margin-bottom: 10px;'>${bvo.title }</div><br/>
						<span style='font-size: 10pt; color: #ababab;'>by&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${bvo.userId }</div>&nbsp;&nbsp;
						<span style='font-size: 10pt; color: #ababab;'>book&nbsp;&nbsp;</span><div class='bookTitlePreview' style='display: inline-block; font-size: 10pt; color: #676767;' data-toggle="tooltip" data-placement="right" title="${bvo.title_kor }(${bvo.pDate }) / ${bvo.author }">${bvo.title_kor }</div>&nbsp;&nbsp;
						<span style='font-size: 10pt; color: #ababab;'>views&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${bvo.hit }</div>&nbsp;&nbsp;
						<span style='font-size: 10pt; color: #ababab;'>when&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${bvo.bDate }</div>
					</div>
				</div>
				<div class='container' id='' style='font-weight: bolder; margin: 20px 0 60px 0;'>
					<div class='container' style='background-color: #fff; border-radius: 10px;'>
						<div class='container' style='padding: 0 30px 0 30px; margin: 20px auto;'>
							<img src='${bvo.coverImg }' alt="${bvo.title_kor } img" style='float: left; width: 120p; height: 130px; margin-right: 20px; border-radius: 20px;' />
							<div style='color: #353535; font-size: 10pt; letter-spacing: 1px; word-spacing: 2px; line-height: 25px;'>${bvo.content }</div>
						</div>
					</div>
					
					<form class='form' id='' name='' action='' method='post' style='display: none;'>
						<input class='form-control' id='serial' name='serial' type='hidden' value='${bvo.serial }' />
						<input class='form-control' id='bookNo' name='bookNo' type='hidden' value='${bvo.bookNo }' />
						<input class='form-control' id='category' name='category' type='hidden' value='${categoryNum }' />
						<input class='form-control' id='bDate' name='bDate' type='hidden' value='${bvo.bDate }' />
						<input class='form-control' id='hit' name='hit' type='hidden' value='${bvo.hit }' />
						<input class='form-control' id='title' name='title' type='text' value='${bvo.title }' style='margin: 5px 0 5px 0; font-weight: bolder;' />
						<textarea class='form-control' id='' name='content' cols='25' placeholder='작성된 내용이 없습니다' style='display: none;'>${bvo.content }</textarea>
						<div class='form-group' id='submitGrp' style='width: 135px; margin: 25px auto;'>
							<input class='btn btn-info' id='btnBoardWriteSubmit' name='btnBoardWriteSubmit' type='button' value='제 출' />
							<input class='btn btn-info' id='btnBoardWriteCancel' name='btnBoardWriteCancel' type='button' value='취 소' style='margin-left: 5px;' />
						</div>
					</form>
				</div>				
			</div>
		</div>
		
		<!-- include footer -->
		<footer>
			<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
		</footer>
	</div>
	
	<!-- button for to-top -->
	<a class='btn btn-secondary my-btn-toTop' href='#'>top</a>
	
	<!-- Modal -->
    <jsp:include page="/WEB-INF/views/component/modal.jsp"></jsp:include>

</body>
</html>