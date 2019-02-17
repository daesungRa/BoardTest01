<%@page import="com.daesungra.domain.BoardVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Board List</title>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<link rel='stylesheet' href='/desktop/resources/css/boardListPage.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
	<script src='/desktop/resources/js/boardListPage.js'></script>
	<script src='/desktop/resources/js/component.js'></script>
</head>
<body>
	<c:if test="${not empty requestScope.msg }">
		<c:set var="msg" value="${requestScope.msg }" scope="request"/>
		<script>alert('${msg}');</script>
		<c:remove var="msg" scope="request"/>
	</c:if>
	
	<!-- 브라우저 크기 확인 (임시) -->
	<div id='windowSize' style='width: 180px; border: 1px solid black;'>
		window size : 
	</div>
	
	<!-- top -->
	<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>

	<!-- include navBar(aside) -->

	<!-- middle component -->
	<div class='container my-con'>
		<c:set var="boardList" value="${requestScope.boardList }"></c:set>
		<p/>
		<h2>게시판 리스트</h2><br/>
		<div class='row my-board-row' style='border-top: 2px solid black;'>
			<div class='col-md-1 my-board-grid'>serial</div>
			<div class='col-md-5 my-board-grid'>title</div>
			<div class='col-md-2 my-board-grid'>userId</div>
			<div class='col-md-2 my-board-grid'>category</div>
			<div class='col-md-2 my-board-grid'>date</div>
		</div>
		<div class='row my-board-row'>
			<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
			<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].bDate }</div>
		</div>
		<div class='row my-board-row'>
			<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
			<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].bDate }</div>
		</div>
		<div class='row my-board-row'>
			<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
			<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].bDate }</div>
		</div>
		<div class='row my-board-row'>
			<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
			<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].bDate }</div>
		</div>
		<div class='row my-board-row'>
			<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
			<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].bDate }</div>
		</div>
		<div class='row my-board-row' style='border-bottom: 2px solid black;'>
			<div class='col-md-1 my-board-grid'>${boardList[0].serial }</div>
			<div class='col-md-5 my-board-grid'>${boardList[0].title }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].userId }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].category }</div>
			<div class='col-md-2 my-board-grid'>${boardList[0].bDate }</div>
		</div>
		<p/>
	</div>
	
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

	<!-- include footer -->
	<footer>
		<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
	</footer>
	
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