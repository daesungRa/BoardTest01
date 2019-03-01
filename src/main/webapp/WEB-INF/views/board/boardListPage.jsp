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
<title>Board List</title>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'/>
	<link rel='stylesheet' href='/desktop/resources/css/boardListPage.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src='/desktop/resources/js/boardListPage.js'></script>
	<script src='/desktop/resources/js/component.js'></script>
</head>
<body>
	
	<c:if test="${not empty requestScope.boardListDate }">
		<c:set var="boardListDate" value="${requestScope.boardListDate }"></c:set>
	</c:if>
	<c:if test="${not empty requestScope.boardListHit }">
		<c:set var="boardListHit" value="${requestScope.boardListHit }"></c:set>
	</c:if>
	
	<!-- 브라우저 크기 확인 (임시) -->
	<!-- <div id='windowSize' style='width: 180px; border: 1px solid black;'>
		window size : 
	</div> -->
	
	<!-- include navBar(aside) -->
	<jsp:include page="/WEB-INF/views/component/navBar_aside.jsp"></jsp:include>
	
	<!-- include content -->
	<div id='boardContent' style='z-index: 0;'>
		<button class='btn btn-sm btn-light' id='btnShowNavbar' style='position: fixed; top: 20px; left: 10px; background-color: #ccc;'>&gt;&gt;</button>
		<!-- top -->
		<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>
	
		<!-- middle component -->
		<div class='container'>
			<div class='container' id='boardList' style='width: 90%; border-right: 1px solid #bfbfbf; border-left: 1px solid #bfbfbf; padding: 20px 80px 20px 80px;'>
				<div style='position: relative; height: 80px;'>
					<span id='categoryContent' style='position: absolute; top: 20%; font-size: 14pt;  width: 150px;'><img src='/desktop/resources/imgs/icon_pencil01.png' alt='icon_pencil for board' style='width: 15px; padding-bottom: 3px; margin-right: 10px;' />문학 / 시 / 소설</span>
					<span id='toBoardList'  style='position: absolute; top: 27%; left: 158px; color: #898989; font-size: 6pt; text-align: center; border: 1px solid #898989; border-radius: 10px; padding: 1px 3px 1px 3px;'>글목록</span>
					<select class='form-control' style='position: absolute; top: 20%; right: 0; font-size: 8pt; width: 16%; height: 29px;'>
						<option>인문/사회/정치</option>
						<option selected>문학/시/소설</option>
						<option>경제/경영</option>
						<option>과학/공학/수학/컴퓨터</option>
						<option>문화/예술/자기계발/라이프</option>
					</select><br/>
					<hr style='border-top: 3px double #8c8b8b; margin-top: 30px;'/>
				</div>
				<br/><br/><br/>
				
				<div class='container'>
					<c:if test='${fn:length(boardListHit) > 2 }'>
						<div style='height: 280px; background-color: #fff; border-radius: 10px; /* border: 1px solid black; */'>
							<div class='container' style='position: relative; height: 90px;'>
								<div style='position: absolute; top: 0; left: 0; width: 30px; height: 50px; display: none'>${boardListHit[0].serial }</div>
								<div style='position: absolute; top: 0; left: 30px;'>
									<div style='display: inline-block; font-size: 16pt; margin-bottom: 10px;'>${boardListHit[0].title }</div><br/>
									<span style='font-size: 10pt; color: #ababab;'>by&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${boardListHit[0].userId }</div>&nbsp;&nbsp;
									<span style='font-size: 10pt; color: #ababab;'>when&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${boardListHit[0].bDate }</div>&nbsp;&nbsp;
									<span style='font-size: 10pt; color: #ababab;'>views&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${boardListHit[0].hit }</div>
								</div>
							</div>
							<div class='container' style='display: inline-block; float: left; padding: 30px 30px 0 30px;'>
								<img src='${boardListHit[0].coverImg }' alt="${boardListHit[0].title_kor } img" style='float: left; width: 80px; height: 100px; border-radius: 20px; margin-right: 20px;' />
								<c:if test='${fn:length(boardListHit[0].content) > 150 }'>
									<%-- 개행 문자열 치환 ("<br/>" to "\n")
									<%
										String content = ((BoardVo) ((List<BoardVo>) request.getAttribute("boardListHit")).get(0)).getContent();
										content = content.replaceAll("<br/>", "\n");
									%>
									<textarea cols="50" rows='30'><%=content %></textarea>
									 --%>
									<p>${fn:substring(boardListHit[0].content, 0, 149) } <span class='boardViewAncMini' data-toggle="tooltip" data-placement="top" title="글 상세보기" >...</span></p>
								</c:if>
							</div>
						</div>
						<c:forEach var='bvo' begin='1' end='2' step='1' items='${boardListHit }'>
							<br/><br/><br/><hr style='border: 1px solid #cfcfcf;'/><br/><br/><br/><br/><br/>
							
							<div style='height: 280px; background-color: #fff; border-radius: 10px; /* border: 1px solid black; */'>
								<div class='container' style='position: relative; height: 90px;'>
									<div style='position: absolute; top: 0; left: 0; width: 30px; height: 50px; display: none'>${bvo.serial }</div>
									<div style='position: absolute; top: 0; left: 30px;'>
										<div style='display: inline-block; font-size: 16pt; margin-bottom: 10px;'>${bvo.title }</div><br/>
										<span style='font-size: 10pt; color: #ababab;'>by&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${bvo.userId }</div>&nbsp;&nbsp;
										<span style='font-size: 10pt; color: #ababab;'>when&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${bvo.bDate }</div>&nbsp;&nbsp;
										<span style='font-size: 10pt; color: #ababab;'>views&nbsp;&nbsp;</span><div style='display: inline-block; font-size: 10pt; color: #676767;'>${bvo.hit }</div>
									</div>
								</div>
								<div class='container' style='display: inline-block; float: left; padding: 30px 30px 0 30px;'>
									<img src='${bvo.coverImg }' alt="${bvo.title_kor } img" style='float: left; width: 80p; height: 100px; margin-right: 20px; border-radius: 20px;' />
									<c:if test='${fn:length(bvo.content) > 150 }'>
										<p>${fn:substring(bvo.content, 0, 149) } <span class='boardViewAncMini' data-toggle="tooltip" data-placement="top" title="글 상세보기" >...</span></p>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
				<c:if test='${fn:length(boardListHit) > 3 }'>
					<div class='container' style='text-align: center;'>
						<div class='myBtn' style='display: inline-block;'>더보기</div>
					</div>
				</c:if>
				
				<br/><br/><br/>
				<hr style='border-top: 3px double #8c8b8b;'/>
				<br/><br/><br/>
				
				<div id='boardListView'>
					<div style='position: relative; height: 50px;'>
						<span id='categoryContent' style='position: absolute; top: 20%; font-size: 12pt;'>
							<img src='/desktop/resources/imgs/document01.png' alt='icon_pencil for board' style='width: 18px; padding-bottom: 3px; margin-right: 10px;' /> 게시글 목록 (문학 / 시 / 소설)
						</span>
					</div>
					<div class='row my-board-row' style='border-top: 2px solid black; padding-top: 2px;'>
						<div class='col-md-1 my-board-grid' style='font-size: 3pt;'>글번호</div>
						<div class='col-md-5 my-board-grid-title' style='text-align: center;'>제목</div>
						<div class='col-md-1 my-board-grid' style='font-size: 3pt;'>작성자</div>
						<div class='col-md-2 my-board-grid'>책제목</div>
						<div class='col-md-1 my-board-grid'>조회</div>
						<div class='col-md-2 my-board-grid' style='font-size: 3pt;'>등록일</div>
					</div>
					<c:forEach var="bvo" items="${boardListDate }" >
						<div class='row my-board-row'>
							<div class='col-md-1 my-board-grid'>${bvo.serial }</div>
							<c:choose>
								<c:when test="${fn:length(bvo.title) < 25 }">
									<div class='col-md-5 my-board-grid-title'>${bvo.title }</div>
								</c:when>
								<c:otherwise>
									<div class='col-md-5 my-board-grid-title' data-toggle="tooltip" data-placement="right" title="${bvo.title }">${fn:substring(bvo.title, 0, 24) } ...</div>
								</c:otherwise>
							</c:choose>
							<div class='col-md-1 my-board-grid'>${bvo.userId }</div>
							<c:choose>
								<c:when test="${fn:length(bvo.title_kor) < 7 }">
									<div class='col-md-2 my-board-grid-bookTitle' data-toggle="tooltip" data-placement="right" title="[${bvo.title_kor }] / ${bvo.author }">${bvo.title_kor }</div>
								</c:when>
								<c:otherwise>
									<div class='col-md-2 my-board-grid-bookTitle' data-toggle="tooltip" data-placement="right" title="[${bvo.title_kor }] / ${bvo.author }">${fn:substring(bvo.title_kor, 0, 6) } ...</div>
								</c:otherwise>
							</c:choose>
							<div class='col-md-1 my-board-grid'>${bvo.hit }</div>
							<div class='col-md-2 my-board-grid'>${fn:substring(bvo.bDate, 2, 10) }</div>
						</div>
					</c:forEach>
					<div class='container' style='height: 46px; font-size: 9pt; text-align: center; margin-top: 30px;'>
						<span class='btnBoardView'>처음</span>
						<span class='btnBoardView'>이전</span>
						<span class='btnBoardView' style='color: #8a8a8a'>|</span>
						<span class='btnBoardView'>01</span>
						<span class='btnBoardView'>02</span>
						<span class='btnBoardView'>03</span>
						<span class='btnBoardView'>04</span>
						<span class='btnBoardView'>05</span>
						<span class='btnBoardView' style='color: #8a8a8a'>|</span>
						<span class='btnBoardView'>다음</span>
						<span class='btnBoardView'>마지막</span>
					</div>
					<div class='container' style='height: 46px; text-align: center; /* border: 1px solid black; */'>
						<form class='form' id='boardSearchForm' name='boardSearchForm' style='position: relative; display: inline-block; right: 0; width: 70%;'>
							<select class='form-control' style='display: inline-block; font-size: 8pt; float: left; width: 18%; height: 29px; margin-right: 3px;'>
								<option selected>최신순</option>
								<option>오래된순</option>
								<option>조회순</option>
								<option>추천순</option>
							</select>
							<select class='form-control' style='display: inline-block; font-size: 8pt; float: left; width: 24%; height: 29px;'>
								<option selected>제목 + 내용</option>
								<option>제목만</option>
								<option>내용만</option>
								<option>작가별</option>
							</select>
							<input class='' type='search' style='display: inline-block; font-size: 8pt; float: left; width: 45%; height: 25px; margin: 3px 0 0 7px;' />
							<input type='button' value='검색' style='display: inline-block; font-size: 8pt; float: right; width: 10%; height: 25px; margin-top: 2px;' />
						</form>
					</div><br/><br/>
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
    <button id="modalBtn" style='display: none;'>Open Modal</button>
    <div id="mainModal" class="modal">
    	
	    <!-- Modal content -->
	    <div class="modal-content">
	   		<div id='innerContent'></div>
	   		<span class="close">닫기</span>
	    </div>
	    
    </div>
	
</body>
</html>