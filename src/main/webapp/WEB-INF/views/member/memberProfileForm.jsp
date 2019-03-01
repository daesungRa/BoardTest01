<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Member Profile Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>

	<c:choose>
		<c:when test='${requestScope.flag == "2" }'>
			<c:set var="vo" value="${requestScope.memberVo }" scope='page'></c:set>
			<div id='flag' hidden="">2</div>
		</c:when>
		<c:when test='${requestScope.flag == "1" }'>
			<c:set var="vo" value="${requestScope.memberVo }" scope='page'></c:set>
			<div id='flag' hidden="">1</div>
		</c:when>
		<c:otherwise>
			<c:set var="vo" value="${requestScope.memberVo }" scope='page'></c:set>
			<div id='flag' hidden="">0</div>
		</c:otherwise>
	</c:choose>
	
	<div class='container'>
		<div class='container'>
			<form class='form' name='profileForm' id='profileForm' method='post' action='#profileModifyAction' enctype='multipart/form-data'>
				<div class="form-group">
					<label for="nickName">이름</label>
					<div class='form-inline'>
						<input class="form-control" type="text" name='userName' id="userName" value='${vo.userName }' readonly style='width: 50%;'>&nbsp;&nbsp;&nbsp;&nbsp;
						<div id='alertUserName' style='color: #0000ff; display: none;'>이름을 변경하려면 회원정보 수정을 이용하십시오.</div>
					</div>
				</div>
				<div class="form-group">
					<label for="nickName">별명</label>
					<c:choose>
						<c:when test='${not empty vo.nickName }'>
							<input class="form-control" type="text" name='nickName' id="nickName" value='${vo.nickName }' placeholder='별명이 없습니다. 새로 등록해주세요.' readonly style='width: 50%;'>
						</c:when>
						<c:otherwise>
							<input class="form-control" type="text" name='nickName' id="nickName" value='' placeholder='별명이 없습니다. 새로 등록해주세요.' readonly style='width: 50%;'>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="form-group">
					<label for="nickName">관심사</label>
					<input class="form-control" type="text" name='interest' id="interest" value='${vo.interest }' placeholder='관심사 내용이 없습니다. 새로 등록해주세요.' readonly style='width: 50%;'>
				</div>
				<div class="form-group shadow-textarea">
					<label for="introduce">소개</label>
					<textarea class="form-control z-depth-1" name='introduce' id="introduce" rows="3" placeholder="소개 글이 없습니다. 새로 등록해주세요." readonly>${vo.introduce }</textarea>
				</div>
				<div class='form-group' id='shiftPhoto' style='display: none;'>
					<label for="photo">프로필 사진 변경</label><br/>
					<input type='file' id='photo' name='photo' style='padding: 3px 0 3px 3px; border: 1px solid #cdcdcd; border-radius: 5px;' />
					<input type='hidden' id='photoPath' value='${vo.photo }' />
				</div>
				<div class='form-group'>
					<label for='isDelete'>프로필 공개유무</label><br/>
					<label class="switch">
						<c:choose>
							<c:when test='${vo.isPublic == 0  }'>
								<input type="checkbox" id='isPublic' name='isPublic' value='0' disabled />
							</c:when>
							<c:otherwise>
								<input type="checkbox" id='isPublic' name='isPublic' value='1' checked disabled />
							</c:otherwise>
						</c:choose>
						<span class="slider round"></span>
					</label>
					<span style='position: relative;'>
						<span id='descIsPublic' data-toggle="tooltip" data-placement="right" title="변경하려면 '프로필 수정하기' 를 클릭하십시오." >?</span>
					</span>
				</div>
				<div class='form-group'>
					<input class='btn btn-primary' type='button' id='btnModifyProfileSubmit' name='btnModifyProfileSubmit' value='제 출' style='display: none;' />
					<input class='btn btn-primary' type='button' id='btnModifyProfileCancel' name='btnModifyProfileCancel' value='취 소' style='display: none;' />
				</div>
				<div class='form-group'>
					<input class='btn btn-primary' type='button' id='btnModifyProfile' name='btnModifyProfile' value='프로필 수정하기' />
				</div>
				<div class='form-group' id='hiddenVal'>
					<input class='form-control' type='hidden' id='mDate' name='mDate' value='${vo.mDate }' />
					<input class='form-control' type='hidden' id='fNum' name='fNum' value='${vo.fNum }' />
				</div>
			</form>
		</div>
	</div>

</body>
</html>