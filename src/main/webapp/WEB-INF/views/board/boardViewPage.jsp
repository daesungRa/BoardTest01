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
	<link rel='stylesheet' href='https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css'>
	<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'/>
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css'>
	<link rel='stylesheet' href='/desktop/resources/css/boardViewPage.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
	<script src='https://code.jquery.com/jquery-1.10.2.js'></script>
	<script src='https://code.jquery.com/ui/1.10.4/jquery-ui.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<script src='/desktop/resources/js/boardViewPage.js'></script>
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
				
				<div class='container' id='boardTitleContent' style='position: relative; height: 100px; margin: 60px auto;'>
					<div id='inputBoardSerial' style='position: absolute; top: 0; left: 0; width: 30px; height: 50px; display: none'>${bvo.serial }</div>
					<div style='position: absolute; top: 0; left: 30px;'>
						<div style='display: inline-block; font-size: 16pt; margin-bottom: 10px;'>${bvo.title }</div><br/>
						<span style='font-size: 10pt; color: #ababab;'>by&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${bvo.userId }</div>&nbsp;&nbsp;
						<span style='font-size: 10pt; color: #ababab;'>book&nbsp;&nbsp;</span><div class='bookTitlePreview' style='display: inline-block; font-size: 10pt; color: #676767;' data-toggle="tooltip" data-placement="right" title="${bvo.title_kor }(${bvo.pDate }) / ${bvo.author }">${bvo.title_kor }</div>&nbsp;&nbsp;
						<span style='font-size: 10pt; color: #ababab;'>views&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${bvo.hit }</div>&nbsp;&nbsp;
						<span style='font-size: 10pt; color: #ababab;'>when&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${bvo.bDate }</div>
					</div>
				</div>
				
				<hr style='border: 1px solid #dedede;'/>
				
				<div class='row' id='boardTextContent'>
					<div class='col-md-10' id='' style='font-weight: bolder; border-right: 1px solid #bcbcbc; padding: 60px 0 60px 0; margin-bottom: 0;'>
						<div class='container' style='background-color: #fff;'>
							<div class='container' style='padding: 0 30px 0 30px;'>
								<img src='${bvo.coverImg }' alt="${bvo.title_kor } img" style='float: left; width: 120p; height: 140px; margin-right: 20px; border-radius: 20px;' />
								<div style='color: #353535; font-size: 10pt; letter-spacing: 1px; word-spacing: 2px; line-height: 25px;'>${bvo.content }</div>
							</div>
						</div>
					</div>
					<div class='col-md-2' id='rightSideComponent' style='text-align: center;'>
						<br/><br/><br/>
						<img src='/desktop/resources/imgs/sample/balloon02.svg' id='iconComment' alt='toCommentPart' style='width: 20px;' data-toggle="tooltip" data-placement="right" title='댓글보기' /><br/>
						<img src='/desktop/resources/imgs/sample/heart_empty01.svg' id='iconThumbUpDown' alt='thumbUpDown' style='width: 20px; margin-top: 15px;' data-toggle="tooltip" data-placement="right" title='추천하기' /><br/>
						<c:if test='${not empty sessionScope.userId and bvo.userId == sessionScope.userId }'>
							<div class='dropdown'>
								<span class='' data-toggle='dropdown' role='button' aria-expanded='false'>
									<img src='/desktop/resources/imgs/sample/gear02.svg' id='iconSettings' alt='boardSettings' style='width: 20px; margin-top: 15px;' data-toggle="tooltip" data-placement="right" title='글 설정' />
								</span>
								<ul class='dropdown-menu dropdown-menu-left'>
									<li><a class='dropdown-item' id='toBoardModifyPage' href='#boardModifyPage'>게시글 수정</a></li>
									<li><a class='dropdown-item' id='toBoardDeleteAction' href='#boardDeleteAction'>게시글 삭제</a></li>
								</ul>
							</div>
						</c:if>
					</div>
				</div>
				
				<div class='container' id='boardModifyPage' style='width: 90%; display: none; margin: 40px 0 80px 0;'>
					<form class='form' id='boardModifyAction' name='boardModifyAction' action='/desktop/board/boardModifyAction' method='post' style='font-size: 10pt; font-weight: bolder;'>
						<input class='form-control' id='serial' name='serial' type='hidden' value='${bvo.serial }' />
						<input class='form-control' id='bookNo' name='bookNo' type='hidden' value='${bvo.bookNo }' />
						<input class='form-control' id='category' name='category' type='hidden' value='${categoryNum }' />
						<input class='form-control' id='bDate' name='bDate' type='hidden' value='${bvo.bDate }' />
						<input class='form-control' id='hit' name='hit' type='hidden' value='${bvo.hit }' />
						<input class='form-control' id='title' name='title' type='text' value='${bvo.title }' style='margin: 5px 0 15px 0; font-weight: bolder;' />
						<textarea class='form-control' id='summernote' name='content' rows='15' placeholder='작성된 내용이 없습니다'>${bvo.content }</textarea>
						<div class='form-group' id='submitGrp' style='width: 135px; margin: 25px auto;'>
							<input class='btn btn-info' id='btnBoardModifySubmit' name='btnBoardWriteSubmit' type='button' value='제 출' />
							<input class='btn btn-info' id='btnBoardModifyCancel' name='btnBoardWriteCancel' type='button' value='취 소' style='margin-left: 5px;' />
						</div>
					</form>
				</div>
				
				<hr style='border: 1px solid #dedede;'/>
				
				<div class='container' id='boardCommentContent' style='width: 80%; padding: 40px 0 60px 0;'>
					<form class='form' id='' name='commentForm' action='' method='post'>
						<div class='form-group'>
							<c:choose>
								<c:when test='${not empty sessionScope.userId and not empty sessionScope.userName }'>
									<label for=''>댓글</label>
									<textarea class='form-control' id='' rows='5' placeholder='댓글 내용을 입력하세요' style='font-size: 10pt;'></textarea>
								</c:when>
								<c:otherwise>
									<label for=''>댓글</label>
									<textarea class='form-control' id='' rows='5' placeholder='댓글을 작성하려면 로그인 후 이용하세요' style='font-size: 10pt;' readonly></textarea>
								</c:otherwise>
							</c:choose>
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