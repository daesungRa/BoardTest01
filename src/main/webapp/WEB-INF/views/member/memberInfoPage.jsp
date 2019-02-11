<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Info Page</title>
</head>
<body>

	<c:choose>
		<c:when test="${not empty requestScope.memberVo }">
			<c:set var="vo" value="${requestScope.memberVo }" scope="request"/>
		</c:when>
		<c:otherwise>
			<script>
				alert('회원 정보가 존재하지 않습니다. 이전 페이지로 돌아갑니다');
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
	
	<div class='container'>
		
	</div>

</body>
</html>