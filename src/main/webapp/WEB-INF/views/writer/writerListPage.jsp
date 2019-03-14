<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>writer page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />
	<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'/>
	<link rel='stylesheet' href='/desktop/resources/css/index.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	<link rel='stylesheet' href='/desktop/resources/css/writerListPage.css' />
	<link rel='stylesheet' href='/desktop/resources/css/board.css' />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src='/desktop/resources/js/index.js'></script>
	<script src='/desktop/resources/js/component.js'></script>
	<script src='/desktop/resources/js/writerListPage.js'></script>
	<script src='/desktop/resources/js/board.js'></script>
</head>
<body style='position: relative; height: 100%; padding-bottom: 200px; min-height: 100%;'>

	<c:if test='${not empty requestScope.mbvoList }'>
		<c:set var='mbvoList' value='${requestScope.mbvoList }' />
	</c:if>

	<!-- include navBar(aside) -->
	<jsp:include page="/WEB-INF/views/component/navBar_aside.jsp"></jsp:include>

	<!-- include content -->
	<div id='boardContent' style='z-index: 0;'>
		<button class='btn btn-light' id='btnShowNavbar'>&gt;&gt;</button>
		<!-- top -->
		<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>
	
		<!-- middle component -->
		<div class='container'>
			<div class='container' style='width: 75%; margin: 30px auto;'>
				<p id='writerListPageTitle'>작가 페이지</p><br/>
				
				<div class='container' style='text-align: center; margin: 0 auto;'>
					<div id='writerListPageSubTitle' style='float: left;'>인기 작가</div>
					<hr/>
					<c:forEach var="mbvo" items='${mbvoList }'>
						<div class='container' style='width: 70%; height: 100px; display: inline-block; text-align: left; padding-top: 10px; margin: 10px auto; border: 1px solid #9a9a9a; border-radius: 20px;'>
							<img src='${mbvo.photo }' alt='writer profile img' id='' style='width: 70px; height: 80px; border-radius: 55px; margin-bottom: 40px; margin-left: 10px;' />
							<div style='display: inline-block; margin-left: 30px; margin-top: 10px;'>
								<span style='font-size: 14pt;'>${mbvo.userName }</span><br/>
								<span style='color: #565656; font-size: 12pt;'>${mbvo.nickName }</span>
							</div>
							<div style='display: inline-block; margin-left: 30px;'>
								<span style='color: #787878; font-size: 10pt;'>${mbvo.interest }</span><br/>
								<span style='color: #565656; font-size: 10pt;'>${mbvo.email }</span><br/>
								<span style='color: #565656; font-size: 10pt;'>팔로워 : ${mbvo.fNum }</span>
							</div>
						</div>
					</c:forEach>
					<br/>
					<form class='form' id='' name='' style='display: inline-block; margin: 30px auto;'>
						<div class='form-inline'>
							<input class='form-control' type='search' id='' name='' placeholder='작가 검색' />
							<input class='btn btn-info' type='button' id='' name='' value='검색' style='font-size: 10pt; margin-left: 10px;' />
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- button for to-top -->
	<a class='btn btn-secondary my-btn-toTop' href='#' onclick='funcMovePage("indexTop");'>top</a>
	
	<!-- include footer -->
	<footer>
		<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
	</footer>
	
    <!-- Modal -->
    <jsp:include page="/WEB-INF/views/component/modal.jsp"></jsp:include>
    
</body>
</html>