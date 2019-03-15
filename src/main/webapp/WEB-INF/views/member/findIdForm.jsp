<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find id page</title>
</head>
<body>

	<div class="container">
	    <div class="row" style='width: 90%; margin: 100px auto;'>
	    	<div class='col-sm-4'></div>
	        <div class="col-md-4" style='padding: 30px 20px 30px 20px; border: 1px solid #bdbdbd; border-radius: 20px;'>
	            <div class="account-wall">
	                <label class="profile">아이디 찾기</label>
	                <p class="profile_p" >회원가입 시 입력한 회원정보를 입력해주세요.</p>
	                <form class="form-signin"  name='emailFrm' method='post' action ='#emailId' enctype = 'multipart/form-data'>
	                
		                <input type="text" class="form-control" name ='userName' placeholder="이름" value='' required autofocus autocomplete='off'>
		                <input type="text" class="form-control" name ='receiver' placeholder="이메일" value='' required autofocus autocomplete='off'>
		                
		                
		                <input type ='hidden' name='sender' value='desktop2020@gmail.com'>
		                <input type= 'hidden' name ='subject' value ='세상의 모든 책 리뷰, "책상" 입니다.'>
		
		                <input type= 'hidden' name='attFile' >
		                
		                <br/>
		                <input type="button" class="btn btn-md btn-info btn-block" id='btnFindId' value='아이디 찾기' onclick = 'funcFindId()'>
	
	                </form>
	            </div>
	        </div>
	        <div class='col-sm-4'></div>
	    </div>
	</div>

</body>
</html>