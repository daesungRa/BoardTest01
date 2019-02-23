<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Member Profile Page</title>
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
					별명
				</div>
				<div class='col-9 my-col'>
					${vo.userName }
				</div>
			</div>
			<div class='row my-row'>
				<div class='col-3 my-col'>
					관심사
				</div>
				<div class='col-9 my-col'>
					${vo.interest }
				</div>
			</div>
			<div class='row my-row'>
				<div class='col-3 my-col'>
					소개
				</div>
				<div class='col-9 my-col'>
					${vo.introduce }
				</div>
			</div>
			<div class='row my-row'>
				<div class='col-3 my-col'>
					사진
				</div>
				<div class='col-9 my-col'>
					<!-- 서버 to 로컬접근 : 보안 이슈에 걸림 / damuni 파일로 그냥 조치해 놓음 -->
					<img src='${vo.photo }' alt="사용자 프로필 사진" width="60px;" />
					${vo.photoOri }
				</div>
			</div>
			<div class='row my-row'>
				<div class='col-3 my-col'>
					공개유무
				</div>
				<div class='col-9 my-col'>
					${vo.isPublic }
				</div>
			</div>
		</div>
	</div>
	
	<br/><br/><br/><br/>

</body>
</html>