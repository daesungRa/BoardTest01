<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book register part</title>
</head>
<body>

	<div class='container'>
		<div class='row' style='margin: 40px 100px 40px 40px;'>
			<div class='col-sm-8'>
				<form class='form' id='bookRegisterForm' name='bookRegisterForm' method='post' action ='#'>
					<div class='form-group'>
						<label for=''>책 제목(한글)</label>
						<input class='form-control' type='text' id='' name='' value='' placeholder='책 제목(한글) 입력' />
					</div>
					<div class='form-group'>
						<label for=''>책 제목(영문)</label>
						<input class='form-control' type='text' id='' name='' value='' placeholder='책 제목(영문) 입력' />
					</div>
					<div class='form-group'>
						<label for=''>작가</label>
						<input class='form-control' type='text' id='' name='' value='' placeholder='작가 입력' />
					</div>
					<div class='form-group'>
						<label for=''>출판사</label>
						<input class='form-control' type='text' id='' name='' value='' placeholder='출판사 입력' />
					</div>
					<div class='form-group'>
						<label for=''>국가</label>
						<input class='form-control' type='text' id='' name='' value='' placeholder='출판 국가 입력' />
					</div>
					<div class='form-group'>
						<label for=''>소개</label>
						<textarea class='form-control' rows='3' id='' name='' placeholder='책 소개 입력'></textarea>
					</div>
					<div class='form-group'>
						<label for=''>커버 이미지</label>
						<input class='form-control' type='file' id='coverImg' name='coverImg' value='' />
					</div>
					<div class='form-group'>
						<input class='btn btn-info' type='button' id='btnBookRegisterSubmit' name='btnBookRegisterSubmit' value='제출' style='float: right;' />
					</div>
				</form>
			</div>
			<div class='col-sm-4' style='text-align: center;'>
				<img id='image' src='https://via.placeholder.com/150x200?text=Images here' width='250px' height='300px' style='border-radius: 50px;' /><br/>
				<p>이미지 미리보기</p>
			</div>
		</div>
	</div>

</body>
</html>