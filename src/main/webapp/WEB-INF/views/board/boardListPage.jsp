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
	
	<c:if test="${not empty requestScope.boardList }">
		<c:set var="boardList" value="${requestScope.boardList }"></c:set>
	</c:if>
	
	<!-- 브라우저 크기 확인 (임시) -->
	<!-- <div id='windowSize' style='width: 180px; border: 1px solid black;'>
		window size : 
	</div> -->
	
	<!-- include navBar(aside) -->
	<jsp:include page="/WEB-INF/views/component/navBar_aside.jsp"></jsp:include>
	
	<!-- include content -->
	<div id='boardContent' style='z-index: 0;'>
		<button class='btn btn-sm btn-light' id='btnShowNavbar' style='position: fixed; top: 20px; left: 10px;'>&gt;&gt;</button>
		<!-- top -->
		<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>
	
		<!-- middle component -->
		<div class='container'>
			<div class='container' id='boardList' style='width: 90%; border-right: 1px solid #bfbfbf; border-left: 1px solid #bfbfbf; padding: 60px 80px 20px 80px;'>
				<p/>
				<h2>게시판 리스트</h2><br/><br/>
				<div class='row my-board-row' style='border-top: 2px solid black;'>
					<div class='col-md-1 my-board-grid' style='text-align: center;'>글 번호</div>
					<div class='col-md-6 my-board-grid-title'>제목</div>
					<div class='col-md-1 my-board-grid'>작성자</div>
					<div class='col-md-1 my-board-grid'>카테고리</div>
					<div class='col-md-1 my-board-grid'>조회수</div>
					<div class='col-md-2 my-board-grid'>등록일</div>
				</div>
				<c:forEach var="bvo" items="${boardList }" >
					<div class='row my-board-row'>
						<div class='col-md-1 my-board-grid'>${bvo.serial }</div>
						<c:choose>
							<c:when test="${fn:length(bvo.title) < 40 }">
								<div class='col-md-6 my-board-grid-title'>${bvo.title }</div>
							</c:when>
							<c:otherwise>
								<div class='col-md-6 my-board-grid-title'>${fn:substring(bvo.title, 0, 38) } ...</div>
							</c:otherwise>
						</c:choose>
						<div class='col-md-1 my-board-grid'>${bvo.userId }</div>
						<div class='col-md-1 my-board-grid'>${bvo.category }</div>
						<div class='col-md-1 my-board-grid'>${bvo.hit }</div>
						<div class='col-md-2 my-board-grid'>${bvo.bDate }</div>
					</div>
				</c:forEach>
				
				<br/><br/><br/>
				<hr style='border: 1px solid #afafaf;'/>
				<br/><br/><br/>
				
				<c:if test='${fn:length(boardList) > 2 }'>
					<div style='height: 600px; background-color: #fff; border-radius: 10px; /* border: 1px solid black; */'>
						<div style='display: inline-block; float: left; width: 10px; border-bottom: 1px solid #9a9a9a;'>${boardList[0].serial }</div>
						<div class='container' style='height: 200px; padding: 30px 30px 0 30px;'>
							<div style='display: inline-block; float: left; margin: 0 40px 0 0; border: 1px solid black;'>
								<img src='${boardList[0].coverImg }' alt="unbearable img" style='width: 90px; height: 150px;' />
							</div>
							<span>제목 : </span><div style='display: inline-block; border-bottom: 1px solid #9a9a9a; margin-bottom: 10px;'>${boardList[0].title } (${boardList[0].bDate })</div><br/>
							<div style='display: inline-block; float: left; border-bottom: 1px solid #9a9a9a; margin-right: 10px;'>${boardList[0].author }</div>
						</div>
						<div class='container' style='height: 400px; padding: 10px 20px 30px 20px;'>
							<p>${boardList[0].content }</p>
						</div>
					</div>
					<c:forEach var='bvo' begin='1' end='2' step='1' items='${boardList }'>
						<br/><hr/><br/>
						
						<div style='height: 600px; background-color: #fff; border-radius: 10px; /* border: 1px solid black; */'>
							<div style='display: inline-block; float: left; width: 10px; border-bottom: 1px solid #9a9a9a;'>${bvo.serial }</div>
							<div class='container' style='height: 200px; padding: 30px 30px 0 30px;'>
								<div style='display: inline-block; float: left; margin: 0 40px 0 0; border: 1px solid black;'>
									<img src='${bvo.coverImg }' alt="unbearable img" style='width: 90px; height: 150px;' />
								</div>
								<span>제목 : </span><div style='display: inline-block; border-bottom: 1px solid #9a9a9a; margin-bottom: 10px;'>${bvo.title } (${bvo.bDate })</div><br/>
								<div style='display: inline-block; float: left; border-bottom: 1px solid #9a9a9a; margin-right: 10px;'>${bvo.author }</div>
							</div>
							<div class='container' style='height: 400px; padding: 10px 20px 30px 20px;'>
								<p>${bvo.content }</p>
							</div>
						</div>
					</c:forEach>
				</c:if>
				
				<c:if test='${fn:length(boardList) > 3 }'>
					<div class='container' style='text-align: center;'>
						<div class='btn btn-info' style='display: inline-block;'>더보기</div>
					</div>
					<br/><br/>
				</c:if>
				
			</div>
		</div>
	
		<!-- include footer -->
		<footer>
			<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
		</footer>
	</div>
	
	<!-- button for to-top -->
	<a class='btn btn-secondary my-btn-toTop' href='#' onclick='funcMovePage("indexTop");'>top</a>
	
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