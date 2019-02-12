<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Member Modify Page</title>
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
		<div class='container my-container'>
			<div class='row my-row'>
				<div class='col-3 my-col'>
					아이디
				</div>
				<div class='col-9 my-col'>
					${vo.userId }
				</div>
			</div>
			<div class='row my-row'>
				<div class='col-3 my-col'>
					이름
				</div>
				<div class='col-9 my-col'>
					${vo.userName }
				</div>
			</div>
			<div class='row my-row'>
				<div class='col-3 my-col'>
					이메일
				</div>
				<div class='col-9 my-col'>
					${vo.email }
				</div>
			</div>
			<div class='row my-row'>
				<div class='col-3 my-col'>
					연락처
				</div>
				<div class='col-9 my-col'>
					${vo.phone }
				</div>
			</div>
			<div class='row my-row'>
				<div class='col-3 my-col'>
					우편번호
				</div>
				<div class='col-9 my-col'>
					${vo.postal }
				</div>
			</div>
			<div class='row my-row'>
				<div class='col-3 my-col'>
					주소
				</div>
				<div class='col-9 my-col'>
					${vo.address }
				</div>
			</div>
		</div>
	</div>
	
	<br/><br/><br/><br/>

</body>
</html>