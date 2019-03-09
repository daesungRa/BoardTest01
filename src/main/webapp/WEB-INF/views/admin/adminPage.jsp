<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/functions' prefix='fn' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Admin page</title>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'/>
	<link rel='stylesheet' href='/desktop/resources/css/admin.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
	<script src='/desktop/resources/js/admin.js'></script>
	<script src='/desktop/resources/js/component.js'></script>
</head>
<body>

	<!-- top -->
	<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>
	
	<!-- include navbar(top) -->
	<jsp:include page="/WEB-INF/views/component/navBar_top.jsp"></jsp:include>

	<c:choose>
		<c:when test='${not empty sessionScope.userId and not empty sessionScope.authority and sessionScope.authority > 0 }'>
			<c:set var='authority' value='${sessionScope.authority }' scope='page' />
			<script>alert('관리자 페이지입니다');</script>
		</c:when>
		<c:otherwise>
			<script>
				location.href = '/desktop/';
			</script>
		</c:otherwise>
	</c:choose>

	<article class='container-fluid' style='height: 500px; border: 1px solid black;'>
		<div class='container-fluid' style='height: 240px; border: 1px solid black;'>
		
		</div>
		<div class='container-fluid' style='height: 240px; border: 1px solid black;'>
		
		</div>
	</article>
	
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